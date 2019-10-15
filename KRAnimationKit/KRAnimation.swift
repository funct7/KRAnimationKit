//
//  AnimationDescriptor.swift
//  KRAnimationKit
//
//  Created by Joshua Park on 6/17/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import KRTimingFunction

public enum KRAnimation {
    
    /**
     - Precondition: All animations in an animation group must have the same duration.
     */
    @discardableResult
    static public func chain(
        _ animDescriptors: [AnimationDescriptor]...,
        reverses: Bool = false,
        repeatCount: Float = 1.0,
        completion: (() -> Void)? = nil)
        -> String
    {
        var propDic = [UIView: ViewProperties]()
        var animDic = [UIView: [CAAnimation]]()
        
        var totalDuration = 0.0
        
        CATransaction.begin()
        CATransaction.setCompletionBlock {
            CATransaction.begin()
            CATransaction.setCompletionBlock {
                completion?()
            }
            for (view, _) in animDic {
                if !reverses { view.update(propDic[view]!) }
                view.layer.removeAllAnimations()
            }
            CATransaction.commit()
        }
        
        for animDescArray in animDescriptors {
            if animDescArray.count == 1 {
                let animDesc = animDescArray[0]
                let viewProp = propDic[animDesc.view] ?? ViewProperties(view: animDesc.view)
                var viewAnims = animDic[animDesc.view] ?? [CAAnimation]()
                
                let anim = getAnimation(animDesc, viewProperties: viewProp, setDelay: true)
                anim.beginTime += totalDuration
                totalDuration = anim.beginTime + anim.duration
                
                viewAnims.append(anim)
                
                propDic[animDesc.view] = viewProp
                animDic[animDesc.view] = viewAnims
                
                if needsSnapshotAnimation(animDesc.view, animDesc: animDesc) {
                    let contentView = animDesc.view.subviews[0]
                    let contentViewProp = propDic[contentView] ?? ViewProperties(view: contentView)
                    var contentViewAnims = animDic[contentView] ?? [CAAnimation]()
                    let contentAnim = getSnapshotAnimation(
                        animDesc,
                        viewProperties: contentViewProp,
                        setDelay: true)
                    
                    contentAnim.beginTime = anim.beginTime
                    contentViewAnims.append(contentAnim)
                    
                    propDic[contentView] = contentViewProp
                    animDic[contentView] = contentViewAnims
                }
            } else {
                var animGroupDic = [UIView: CAAnimationGroup]()
                var segmentDuration: Double! = nil
                
                for animDesc in animDescArray {
                    if segmentDuration == nil { segmentDuration = animDesc.delay + animDesc.duration }
                    guard segmentDuration == animDesc.delay
                        + animDesc.duration
                    else {
                        preconditionFailure("All animations in an animation group must have the same duration.")
                    }
                    
                    let viewProp = propDic[animDesc.view] ?? ViewProperties(view: animDesc.view)
                    let animGroup = animGroupDic[animDesc.view] ?? {
                        let animGroup = CAAnimationGroup()
                        animGroup.beginTime = totalDuration + animDesc.delay
                        animGroup.duration = animDesc.duration
                        animGroup.fillMode = .forwards
                        animGroup.animations = [CAAnimation]()
                        animGroup.isRemovedOnCompletion = false

                        return animGroup
                    }()
                    
                    animGroup.animations!.append(getAnimation(animDesc, viewProperties: viewProp, setDelay: false))

                    propDic[animDesc.view] = viewProp
                    animGroupDic[animDesc.view] = animGroup
                    
                    if needsSnapshotAnimation(animDesc.view, animDesc: animDesc) {
                        let contentView = animDesc.view.subviews[0]
                        let contentViewProp = propDic[contentView] ?? ViewProperties(view: contentView)
                        let contentViewAnimGroup = animGroupDic[contentView] ?? {
                            let animGroup = CAAnimationGroup()
                            animGroup.beginTime = totalDuration + animDesc.delay
                            animGroup.duration = animDesc.duration
                            animGroup.fillMode = .forwards
                            animGroup.animations = [CAAnimation]()
                            animGroup.isRemovedOnCompletion = false
                            
                            return animGroup
                        }()

                        contentViewAnimGroup.animations!.append(
                            getSnapshotAnimation(
                                animDesc,
                                viewProperties: contentViewProp,
                                setDelay: false))

                        propDic[contentView] = contentViewProp
                        animGroupDic[contentView] = contentViewAnimGroup
                    }
                }
                
                for (view, animGroup) in animGroupDic {
                    var viewAnims = animDic[view] ?? [CAAnimation]()
                    viewAnims.append(animGroup)
                    animDic[view] = viewAnims
                }
                
                totalDuration += segmentDuration
            }
        }
        
        let animKey = "\(CACurrentMediaTime().hashValue)"
        
        for (view, animations) in animDic {
            let chainedAnim = CAAnimationGroup()
            chainedAnim.animations = animations
            chainedAnim.beginTime = view.layer.convertTime(CACurrentMediaTime(), from: nil) + 0.0
            chainedAnim.duration = totalDuration
            chainedAnim.repeatCount = repeatCount
            chainedAnim.autoreverses = reverses
            chainedAnim.fillMode = .forwards
            chainedAnim.isRemovedOnCompletion = false
            
            view.layer.add(chainedAnim, forKey: animKey)
        }
        
        CATransaction.commit()
        
        return animKey
    }
    
    static internal func getScaledValue(_ b: CGFloat, _ e: CGFloat, _ scale: CGFloat) -> CGFloat {
        return b + scale * (e - b)
    }
    
    static internal func getScaledValue(_ b: Float, _ e: Float, _ scale: CGFloat) -> CGFloat {
        return CGFloat(b) + scale * CGFloat(e - b)
    }
    
    static internal func getScaledValue(_ b: Double, _ e: Double, _ scale: CGFloat) -> CGFloat {
        return CGFloat(b) + scale * CGFloat(e - b)
    }
    
    static internal func animate(
        _ animDesc: AnimationDescriptor,
        reverses: Bool,
        repeatCount: Float,
        completion: (() -> Void)?)
        -> String
    {
        let view = animDesc.view
        let updatedProperties = ViewProperties(view: view)
        
        CATransaction.begin()
        CATransaction.setCompletionBlock {
            CATransaction.begin()
            CATransaction.setCompletionBlock {
                completion?()
            }
            if !reverses { view.update(updatedProperties) }
            
            view.layer.removeAllAnimations()
            CATransaction.commit()
        }
        
        let animKey = "\(CACurrentMediaTime().hashValue)"

        let anim = getAnimation(animDesc, viewProperties: updatedProperties, setDelay: true)
        anim.beginTime += view.layer.convertTime(CACurrentMediaTime(), from: nil)
        anim.autoreverses = reverses
        anim.repeatCount = repeatCount
        
        view.layer.add(anim, forKey: animKey)
        
        if needsSnapshotAnimation(view, animDesc: animDesc) {
            let contentView = view.subviews[0]
            let contentAnim = getSnapshotAnimation(animDesc, viewProperties: updatedProperties, setDelay: true)
            contentAnim.beginTime += contentView.layer.convertTime(CACurrentMediaTime(), to: nil)
            contentAnim.autoreverses = reverses
            contentAnim.repeatCount = repeatCount
            contentView.layer.add(contentAnim, forKey: animKey)
        }
        
        CATransaction.commit()
        
        return animKey
    }
    
    static private func getAnimation(
        _ animDesc: AnimationDescriptor,
        viewProperties: ViewProperties,
        setDelay: Bool)
        -> CAAnimation
    {
        if animDesc.property == .frame {
            let frameAnimations = animDesc.getFrameAnimations()
            
            let animSize = getKeyframeAnimation(
                frameAnimations.size,
                viewProperties: viewProperties,
                setDelay: false)
            let animOrigin = getKeyframeAnimation(
                frameAnimations.origin,
                viewProperties: viewProperties,
                setDelay: false)
            
            let anim = CAAnimationGroup()
            anim.animations = [animOrigin, animSize]
            anim.duration = animDesc.duration
            anim.fillMode = .forwards
            anim.isRemovedOnCompletion = false
            
            if setDelay { anim.beginTime = animDesc.delay }
            
            return anim
        } else {
            return getKeyframeAnimation(
                animDesc,
                viewProperties: viewProperties,
                setDelay: setDelay)
        }
    }
    
    static private func getKeyframeAnimation(
        _ animDesc: AnimationDescriptor,
        viewProperties: ViewProperties,
        setDelay: Bool)
        -> CAKeyframeAnimation
    {
        var anim: CAKeyframeAnimation!
        switch animDesc.property {
            // Origin
        case .originX:
            anim = CAKeyframeAnimation(keyPath: "position.x")
        case .originY:
            anim = CAKeyframeAnimation(keyPath: "position.y")
        case .origin:
            anim = CAKeyframeAnimation(keyPath: "position")
            
            // Size
        case .sizeWidth:
            anim = CAKeyframeAnimation(keyPath: "bounds.size.width")
        case .sizeHeight:
            anim = CAKeyframeAnimation(keyPath: "bounds.size.height")
        case .size:
            anim = CAKeyframeAnimation(keyPath: "bounds.size")
            
            // Frame
        case .frame:
            preconditionFailure("""
Keyframe animation for `frame` unavailable.
Get separate animations for origin, size and bind into CAAnimationGroup instead.
""")

            // Center & Position
        case .centerX, .positionX:
            anim = CAKeyframeAnimation(keyPath: "position.x")
        case .centerY, .positionY:
            anim = CAKeyframeAnimation(keyPath: "position.y")
        case .center, .position:
            anim = CAKeyframeAnimation(keyPath: "position")

            // Background color
        case .backgroundColor:
            anim = CAKeyframeAnimation(keyPath: "backgroundColor")
        
            // Border
        case .borderColor:
            anim = CAKeyframeAnimation(keyPath: "borderColor")
        case .borderWidth:
            anim = CAKeyframeAnimation(keyPath: "borderWidth")
            
            // Corner radius
        case .cornerRadius:
            anim = CAKeyframeAnimation(keyPath: "cornerRadius")
            
            // Opacity
        case .opacity, .alpha:
            anim = CAKeyframeAnimation(keyPath: "opacity")

            // Shadow
        case .shadowColor:
            anim = CAKeyframeAnimation(keyPath: "shadowColor")
        case .shadowOffset:
            anim = CAKeyframeAnimation(keyPath: "shadowOffset")
        case .shadowOpacity:
            anim = CAKeyframeAnimation(keyPath: "shadowOpacity")
        case .shadowRadius:
            anim = CAKeyframeAnimation(keyPath: "shadowRadius")
        case .shadowPath:
            fatalError("INCOMPLETE IMPLEMENTATION")
            
            // Transform
        case.transform:
            anim = CAKeyframeAnimation(keyPath: "transform")
        
            // Rotation
        case .rotationX, .rotationY, .rotationZ:
            anim = CAKeyframeAnimation(keyPath: "transform")
            
            // Scale
        case .scaleX:
            anim = CAKeyframeAnimation(keyPath: "transform.scale.x")
        case .scaleY:
            anim = CAKeyframeAnimation(keyPath: "transform.scale.y")
        case .scaleZ:
            anim = CAKeyframeAnimation(keyPath: "transform.scale.z")
        case .scale2D:
            anim = CAKeyframeAnimation(keyPath: "transform")
        case .scale:
            anim = CAKeyframeAnimation(keyPath: "transform")
            
            // Translation
        case .translationX,
             .translationY,
             .translationZ,
             .translation:
            anim = CAKeyframeAnimation(keyPath: "transform")
            
            // Z Position
        case .zPosition:
            fatalError("INCOMPLETE IMPLEMENTATION")
        }
        
        if setDelay { anim.beginTime = animDesc.delay }
        anim.duration = animDesc.duration
        anim.fillMode = .forwards
        anim.isRemovedOnCompletion = false
        anim.values = getValues(animDesc, viewProperties: viewProperties)
        
        return anim
    }
    
    static private func getValues(
        _ animDesc: AnimationDescriptor,
        viewProperties: ViewProperties)
        -> [Any]
    {
        var values = [Any]()
        let totalFrames = CGFloat(60 * animDesc.duration)
        var f: ((CGFloat) -> Any)!
        
        switch animDesc.property {
            
            // Origin
            
        case .originX:
            let b = viewProperties.position.x
            let e = (animDesc.endValue as! CGFloat)
                + viewProperties.bounds.width * viewProperties.anchorPoint.x
            
            f = { getScaledValue(b, e, $0) }
            viewProperties.origin.x = animDesc.endValue as! CGFloat
            
        case .originY:
            let b = viewProperties.position.y
            let e = (animDesc.endValue as! CGFloat)
                + viewProperties.bounds.height * viewProperties.anchorPoint.y
            
            f = { getScaledValue(b, e, $0) }
            viewProperties.origin.y = animDesc.endValue as! CGFloat
            
        case .origin:
            let e = (animDesc.endValue as! NSValue).cgPointValue
            
            let bX = viewProperties.position.x
            let bY = viewProperties.position.y
            
            let eX = e.x + viewProperties.bounds.width * viewProperties.anchorPoint.x
            let eY = e.y + viewProperties.bounds.height * viewProperties.anchorPoint.y
            
            f = {
                NSValue(cgPoint: CGPoint(
                    x: getScaledValue(bX, eX, $0),
                    y: getScaledValue(bY, eY, $0)))
            }
            viewProperties.origin = e
            
            // Size
            
        case .sizeWidth:
            let b = viewProperties.bounds.width
            let e = animDesc.endValue as! CGFloat
            
            f = { getScaledValue(b, e, $0) }
            viewProperties.bounds.size.width = e
            
        case .sizeHeight:
            let b = viewProperties.bounds.height
            let e = animDesc.endValue as! CGFloat
            
            f = { getScaledValue(b, e, $0) }
            viewProperties.bounds.size.height = e
            
        case .size:
            let e = (animDesc.endValue as! NSValue).cgSizeValue
            
            let bW = viewProperties.bounds.width
            let bH = viewProperties.bounds.height
            let eW = e.width
            let eH = e.height
            
            f = {
                NSValue(cgSize:CGSize(
                    width: getScaledValue(bW, eW, $0),
                    height: getScaledValue(bH, eH, $0)))
            }
            viewProperties.bounds.size = e
        
            // Frame
            
        case .frame:
            preconditionFailure("""
Unable to get values for `frame` directly.
Set values for `origin` and `size` separately instead.
""")
            
            // Center, Position
            
        case .centerX, .positionX:
            let b = viewProperties.position.x
            let e = animDesc.endValue as! CGFloat
            
            f = { getScaledValue(b, e, $0) }
            viewProperties.position.x = e
            
        case .centerY, .positionY:
            let b = viewProperties.position.y
            let e = animDesc.endValue as! CGFloat
            
            f = { getScaledValue(b, e, $0) }
            viewProperties.position.y = e
            
        case .center, .position:
            let e = (animDesc.endValue as! NSValue).cgPointValue
            let bX = viewProperties.position.x
            let eX = e.x
            let bY = viewProperties.position.y
            let eY = e.y
            
            f = {
                NSValue(cgPoint: CGPoint(
                    x: getScaledValue(bX, eX, $0),
                    y: getScaledValue(bY, eY, $0)))
            }
            viewProperties.position = e
            
            // Background color
            
        case .backgroundColor:
            let b = viewProperties.backgroundColor ?? UIColor.clear
            let e = animDesc.endValue as! UIColor
            
            var (bR, bG, bB, bA): (CGFloat, CGFloat, CGFloat, CGFloat) = (0.0, 0.0, 0.0, 0.0)
            var (eR, eG, eB, eA): (CGFloat, CGFloat, CGFloat, CGFloat) = (0.0, 0.0, 0.0, 0.0)
            
            b.getRed(&bR, green: &bG, blue: &bB, alpha: &bA)
            e.getRed(&eR, green: &eG, blue: &eB, alpha: &eA)
            
            f = {
                UIColor(
                    red: getScaledValue(bR, eR, $0),
                    green: getScaledValue(bG, eG, $0),
                    blue: getScaledValue(bB, eB, $0),
                    alpha: getScaledValue(bA, eA, $0)).cgColor
            }
            
            viewProperties.backgroundColor = e
            
            // Border
            
        case .borderColor:
            let b = viewProperties.borderColor ?? UIColor.clear
            let e = animDesc.endValue as! UIColor
            
            var (bR, bG, bB, bA): (CGFloat, CGFloat, CGFloat, CGFloat) = (0.0, 0.0, 0.0, 0.0)
            var (eR, eG, eB, eA): (CGFloat, CGFloat, CGFloat, CGFloat) = (0.0, 0.0, 0.0, 0.0)
            
            b.getRed(&bR, green: &bG, blue: &bB, alpha: &bA)
            e.getRed(&eR, green: &eG, blue: &eB, alpha: &eA)
            
            f = {
                UIColor(
                    red: getScaledValue(bR, eR, $0),
                    green: getScaledValue(bG, eG, $0),
                    blue: getScaledValue(bB, eB, $0),
                    alpha: getScaledValue(bA, eA, $0)).cgColor
            }
            viewProperties.borderColor = e
            
        case .borderWidth:
            let b = viewProperties.borderWidth
            let e = animDesc.endValue as! CGFloat
            
            f = { getScaledValue(b, e, $0) }
            viewProperties.borderWidth = e

            // Corner radius
            
        case .cornerRadius:
            let b = viewProperties.cornerRadius
            let e = animDesc.endValue as! CGFloat
            
            f = { getScaledValue(b, e, $0) }
            viewProperties.cornerRadius = e

            // Opacity
            
        case .opacity, .alpha:
            let b = viewProperties.opacity
            let e = animDesc.property == .opacity ? animDesc.endValue as! Float : Float(animDesc.endValue as! CGFloat)
            
            f = { getScaledValue(b, e, $0) }
            viewProperties.opacity = e
            
            // Shadow
            
        case .shadowColor:
            let b = viewProperties.shadowColor ?? UIColor.clear
            let e = animDesc.endValue as! UIColor
            
            var (bR, bG, bB, bA): (CGFloat, CGFloat, CGFloat, CGFloat) = (0.0, 0.0, 0.0, 0.0)
            var (eR, eG, eB, eA): (CGFloat, CGFloat, CGFloat, CGFloat) = (0.0, 0.0, 0.0, 0.0)
            
            b.getRed(&bR, green: &bG, blue: &bB, alpha: &bA)
            e.getRed(&eR, green: &eG, blue: &eB, alpha: &eA)
            
            f = {
                UIColor(
                    red: getScaledValue(bR, eR, $0),
                    green: getScaledValue(bG, eG, $0),
                    blue: getScaledValue(bB, eB, $0),
                    alpha: getScaledValue(bA, eA, $0)).cgColor
            }
            viewProperties.shadowColor = e
            
        case .shadowOffset:
            let b = viewProperties.shadowOffset
            let e = (animDesc.endValue as! NSValue).cgSizeValue
            
            f = {
                NSValue(cgSize: CGSize(
                    width: getScaledValue(b.width, e.width, $0),
                    height: getScaledValue(b.height, e.height, $0)))
            }
            viewProperties.shadowOffset = e
            
        case .shadowOpacity:
            let b = viewProperties.shadowOpacity
            let e = animDesc.endValue as! Float
            
            f = { getScaledValue(b, e, $0) }
            viewProperties.shadowOpacity = e
        
        case .shadowPath:
            fatalError("INCOMPLETE IMPLEMENTATION")
        
        case .shadowRadius:
            let b = viewProperties.shadowRadius
            let e = animDesc.endValue as! CGFloat
            
            f = { getScaledValue(b, e, $0) }
            viewProperties.shadowRadius = e
            
            // Transform
            
        case .transform:
            fatalError("INCOMPLETE IMPLEMENTATION")

            // TODO: Implement transform animation
            
            
            // Rotation
            
        case .rotationX:
            let b = viewProperties.transform
            let e = animDesc.endValue as! CGFloat
            
            f = { NSValue(caTransform3D: CATransform3DRotate(b, e * $0, 1.0, 0.0, 0.0)) }
            
            viewProperties.transform = CATransform3DRotate(b, e, 1.0, 0.0, 0.0)
            
        case .rotationY:
            let b = viewProperties.transform
            let e = animDesc.endValue as! CGFloat
            
            f = { NSValue(caTransform3D: CATransform3DRotate(b, e * $0, 0.0, 1.0, 0.0)) }
            
            viewProperties.transform = CATransform3DRotate(b, e, 0.0, 1.0, 0.0)
            
        case .rotationZ:
            let b = viewProperties.transform
            let e = animDesc.endValue as! CGFloat
            
            f = { NSValue(caTransform3D: CATransform3DRotate(b, e * $0, 0.0, 0.0, 1.0)) }
            
            viewProperties.transform = CATransform3DRotate(b, e, 0.0, 0.0, 1.0)
            
            // Scale
        case .scaleX:
            let b = viewProperties.transform.m11
            let e = animDesc.endValue as! CGFloat
            
            f = { getScaledValue(b, e, $0) }
            viewProperties.transform.m11 = e
            
        case .scaleY:
            let b = viewProperties.transform.m22
            let e = animDesc.endValue as! CGFloat
            
            f = { getScaledValue(b, e, $0) }
            viewProperties.transform.m22 = e
            
        case .scale2D:
            let b = viewProperties.transform
            let e = (animDesc.endValue as! NSValue).caTransform3DValue
            
            f = {
                var c = b
                (c.m11, c.m22) = (getScaledValue(b.m11, e.m11, $0), getScaledValue(b.m22, e.m22, $0))
                return NSValue(caTransform3D: c)
            }
            viewProperties.transform.m11 = e.m11
            viewProperties.transform.m22 = e.m22
            
        case .scaleZ:
            let b = viewProperties.transform.m33
            let e = animDesc.endValue as! CGFloat
            
            f = { getScaledValue(b, e, $0) }
            
            viewProperties.transform.m33 = e
            
        case .scale:
            let b = viewProperties.transform
            let e = (animDesc.endValue as! NSValue).caTransform3DValue
            
            f = {
                var c = b
                c.m11 = getScaledValue(b.m11, e.m11, $0)
                c.m22 = getScaledValue(b.m22, e.m22, $0)
                c.m33 = getScaledValue(b.m33, e.m33, $0)
                
                return NSValue(caTransform3D: c)
            }
            viewProperties.transform = e
            
            // Translation
        case .translationX:
            let b = viewProperties.transform
            let e = animDesc.endValue as! CGFloat
            
            f = { NSValue(caTransform3D: CATransform3DTranslate(b, e * $0, 0.0, 0.0)) }
            
            viewProperties.transform = CATransform3DTranslate(b, e, 0.0, 0.0)
            
        case .translationY:
            let b = viewProperties.transform
            let e = animDesc.endValue as! CGFloat
            
            f = { NSValue(caTransform3D: CATransform3DTranslate(b, 0.0, e * $0, 0.0)) }
            
            viewProperties.transform = CATransform3DTranslate(b, 0.0, e, 0.0)
            
        case .translationZ:
            let b = viewProperties.transform
            let e = animDesc.endValue as! CGFloat
            
            f = { NSValue(caTransform3D: CATransform3DTranslate(b, 0.0, 0.0, e * $0)) }
            
            viewProperties.transform = CATransform3DTranslate(b, 0.0, 0.0, e)
            
        case .translation:
            let b = viewProperties.transform
            let e = (animDesc.endValue as! NSValue).cgSizeValue
            
            f = {
                let c = CATransform3DTranslate(b, e.width * $0, e.height * $0, 0.0)
                return NSValue(caTransform3D: c)
            }
            
            viewProperties.transform = CATransform3DTranslate(b, e.width, e.height, 0.0)
            
        case .zPosition:
            fatalError("INCOMPLETE IMPLEMENTATION")
            
        }
        
        for i in 0 ... Int(totalFrames) {
            let rt = CGFloat(i) / totalFrames
            let scale = TimingFunction.value(
                using: animDesc.function,
                rt: rt,
                b: 0.0,
                c: 1.0,
                d: CGFloat(animDesc.duration))
            
            values.append(f(scale))
        }
        
        return values
    }
    
    static private func needsSnapshotAnimation(
        _ view: UIView,
        animDesc: AnimationDescriptor)
        -> Bool
    {
        // FIXME: `_UIReplicantView` is a private UIKit class. Do not depend on its behavior.
        return String(describing: type(of: view)) == "_UIReplicantView"
            && [AnimatableProperty.frame, .size, .sizeWidth, .sizeHeight].contains(animDesc.property)
    }
    
    static private func getSnapshotAnimation(
        _ animDesc: AnimationDescriptor,
        viewProperties: ViewProperties,
        setDelay: Bool)
        -> CAAnimation
    {
        let contentView = animDesc.view.subviews[0]
        var contentAnimDesc: AnimationDescriptor!
        
        if animDesc.property == .frame {
            var frame = (animDesc.endValue as! NSValue).cgRectValue
            frame.origin = CGPoint.zero
            let endValue = NSValue(cgRect: frame)
            contentAnimDesc = AnimationDescriptor(
                view: contentView,
                delay: animDesc.delay,
                property: animDesc.property,
                endValue: endValue,
                duration: animDesc.duration,
                function: animDesc.function)
        } else {
            contentView.layer.anchorPoint = CGPoint.zero
            contentAnimDesc = AnimationDescriptor(
                view: contentView,
                delay: animDesc.delay,
                property: animDesc.property,
                endValue: animDesc.endValue,
                duration: animDesc.duration,
                function: animDesc.function)
        }
        
        return getAnimation(
            contentAnimDesc,
            viewProperties: ViewProperties(view: contentView),
            setDelay: setDelay)
    }
}
