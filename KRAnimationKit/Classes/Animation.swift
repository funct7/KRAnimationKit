//
//  AnimationDescriptor.swift
//  KRAnimationKit
//
//  Created by Joshua Park on 6/17/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import KRTimingFunction

internal enum AnimatableProperty {
    case Origin
    case OriginX
    case OriginY
    
    case Size
    case SizeWidth
    case SizeHeight
    
    case Frame
    
    case Center
    case CenterX
    case CenterY
    
    case PositionX
    case PositionY
    case Position
    
    case BackgroundColor
    
    case BorderColor
    case BorderWidth
    
    case CornerRadius
    
    case Opacity
    case Alpha
    
    case ShadowColor
    case ShadowOffset
    case ShadowOpacity
    case ShadowPath
    case ShadowRadius
    
    case Transform
    
    case RotationX
    case RotationY
    case RotationZ
    
    case ScaleX
    case ScaleY
    case ScaleZ
    case Scale2D
    case Scale
    
    case TranslationX
    case TranslationY
    case TranslationZ
    case Translation
    
    case ZPosition
}

public struct AnimationDescriptor {
    let view: UIView
    let delay: Double
    let property: AnimatableProperty
    let endValue: AnyObject
    let duration: Double
    let function: FunctionType
    
    internal func getFrameAnimations() -> (origin: AnimationDescriptor, size: AnimationDescriptor) {
        let frame = (endValue as! NSValue).CGRectValue()
        
        let animOrigin = AnimationDescriptor(view: view, delay: delay, property: .Origin, endValue: NSValue(CGPoint: frame.origin), duration: duration, function: function)
        let animSize = AnimationDescriptor(view: view, delay: delay, property: .Size, endValue: NSValue(CGSize: frame.size), duration: duration, function: function)
        
        return (origin: animOrigin, size: animSize)
    }
}

internal class ViewProperties: NSObject {
    var origin: CGPoint {
        get {
            let (x, y) = (position.x - bounds.width*anchorPoint.x, position.y - bounds.height * anchorPoint.y)
            return CGPointMake(x, y)
        }
        set {
            let (posX, posY) = (newValue.x + bounds.width*anchorPoint.x, newValue.y + bounds.height * anchorPoint.y)
            position = CGPointMake(posX, posY)
        }
    }
    var frame: CGRect {
        get {
            return CGRect(origin: origin, size: bounds.size)
        }
        set {
            origin = newValue.origin
            bounds.size = newValue.size
        }
    }
    
    var center: CGPoint {
        get {
            return position
        }
        set {
            position = newValue
        }
    }
    var anchorPoint: CGPoint
    var position: CGPoint
    var bounds: CGRect
    
    var backgroundColor: UIColor?
    
    var borderColor: UIColor?
    var borderWidth: CGFloat
    var cornerRadius: CGFloat
    
    var opacity: Float
    var alpha: CGFloat {
        get {
            return CGFloat(opacity)
        }
        set {
            opacity = Float(newValue)
        }
    }
    
    var shadowColor: UIColor?
    var shadowOffset: CGSize
    var shadowOpacity: Float
    var shadowPath: CGPath?
    var shadowRadius: CGFloat
    
    var transform: CATransform3D
    
    init(view: UIView) {
        anchorPoint = view.layer.anchorPoint
        position = view.layer.position
        bounds = view.layer.bounds
        backgroundColor = view.layer.backgroundColor?.getUIColor()
        borderColor = view.layer.borderColor?.getUIColor()
        borderWidth = view.layer.borderWidth
        cornerRadius = view.layer.cornerRadius
        opacity = view.layer.opacity
        
        shadowColor = view.layer.shadowColor?.getUIColor()
        shadowOffset = view.layer.shadowOffset
        shadowOpacity = view.layer.shadowOpacity
        shadowPath = view.layer.shadowPath
        shadowRadius = view.layer.shadowRadius
        
        transform = view.layer.transform
    }
}

public struct KRAnimation {
    public static func chain(animDescriptors: [AnimationDescriptor]..., reverses: Bool = false, repeatCount: Float = 1.0, completion: (() -> Void)? = nil) {
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
            } else {
                var animGroupDic = [UIView: CAAnimationGroup]()
                var segmentDuration: Double! = nil
                
                for animDesc in animDescArray {
                    if segmentDuration == nil { segmentDuration = animDesc.delay + animDesc.duration }
                    guard segmentDuration == animDesc.delay + animDesc.duration else { fatalError("All animations in an animation group must have the same duration.") }
                    
                    let viewProp = propDic[animDesc.view] ?? ViewProperties(view: animDesc.view)
                    let animGroup = animGroupDic[animDesc.view] ?? {
                        let animGroup = CAAnimationGroup()
                        animGroup.beginTime = totalDuration + animDesc.delay
                        animGroup.duration = animDesc.duration
                        animGroup.fillMode = kCAFillModeForwards
                        animGroup.animations = [CAAnimation]()
                        animGroup.removedOnCompletion = false

                        return animGroup
                    }()
                    
                    animGroup.animations!.append(getAnimation(animDesc, viewProperties: viewProp, setDelay: false))

                    propDic[animDesc.view] = viewProp
                    animGroupDic[animDesc.view] = animGroup
                }
                
                for (view, animGroup) in animGroupDic {
                    var viewAnims = animDic[view] ?? [CAAnimation]()
                    viewAnims.append(animGroup)
                    animDic[view] = viewAnims
                }
                
                totalDuration += segmentDuration
            }
        }
        
        for (view, animations) in animDic {
            let chainedAnim = CAAnimationGroup()
            chainedAnim.animations = animations
            chainedAnim.beginTime = view.layer.convertTime(CACurrentMediaTime(), fromLayer: nil) + 0.0
            chainedAnim.duration = totalDuration
            chainedAnim.repeatCount = repeatCount
            chainedAnim.autoreverses = reverses
            chainedAnim.fillMode = kCAFillModeForwards
            chainedAnim.removedOnCompletion = false
            
            view.layer.addAnimation(chainedAnim, forKey: nil)
        }
        
        CATransaction.commit()
    }
    
    internal static func getScaledValue(b: CGFloat, _ e: CGFloat, _ scale: CGFloat) -> CGFloat {
        return b + scale * (e - b)
    }
    
    internal static func getScaledValue(b: Float, _ e: Float, _ scale: CGFloat) -> CGFloat {
        return CGFloat(b) + scale * CGFloat(e - b)
    }
    
    internal static func getScaledValue(b: Double, _ e: Double, _ scale: CGFloat) -> CGFloat {
        return CGFloat(b) + scale * CGFloat(e - b)
    }
    
    internal static func animate(animDescription: AnimationDescriptor, reverses: Bool, repeatCount: Float, completion: (() -> Void)?) {
        let view = animDescription.view
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
        
        let anim = getAnimation(animDescription, viewProperties: updatedProperties, setDelay: true)
        anim.beginTime += view.layer.convertTime(CACurrentMediaTime(), fromLayer: nil)
        anim.autoreverses = reverses
        anim.repeatCount = repeatCount
        
        view.layer.addAnimation(anim, forKey: nil)
        
        CATransaction.commit()
    }

    private static func getAnimation(animDesc: AnimationDescriptor, viewProperties: ViewProperties, setDelay: Bool) -> CAAnimation {
        if animDesc.property == .Frame {
            let frameAnimations = animDesc.getFrameAnimations()
            
            let animSize = getKeyframeAnimation(frameAnimations.size, viewProperties: viewProperties, setDelay: false)
            let animOrigin = getKeyframeAnimation(frameAnimations.origin, viewProperties: viewProperties, setDelay: false)
            
            let anim = CAAnimationGroup()
            anim.animations = [animOrigin, animSize]
            anim.duration = animDesc.duration
            anim.fillMode = kCAFillModeForwards
            anim.removedOnCompletion = false
            
            if setDelay { anim.beginTime = animDesc.delay }
            
            return anim
        } else {
            let anim = getKeyframeAnimation(animDesc, viewProperties: viewProperties, setDelay: setDelay)

            return anim
        }
    }
    
    private static func getKeyframeAnimation(animDesc: AnimationDescriptor, viewProperties: ViewProperties, setDelay: Bool) -> CAKeyframeAnimation {
        var anim: CAKeyframeAnimation!
        switch animDesc.property {
            // Origin
        case .OriginX:
            anim = CAKeyframeAnimation(keyPath: "position.x")
        case .OriginY:
            anim = CAKeyframeAnimation(keyPath: "position.y")
        case .Origin:
            anim = CAKeyframeAnimation(keyPath: "position")
            
            // Size
        case .SizeWidth:
            anim = CAKeyframeAnimation(keyPath: "bounds.size.width")
        case .SizeHeight:
            anim = CAKeyframeAnimation(keyPath: "bounds.size.height")
        case .Size:
            anim = CAKeyframeAnimation(keyPath: "bounds.size")

            // Frame
        case .Frame:
            fatalError("Keyframe animation for `frame` unavailable. Get separate animations for origin, size and bind into CAAnimationGroup instead.")

            // Center & Position
        case .CenterX, .PositionX:
            anim = CAKeyframeAnimation(keyPath: "position.x")
        case .CenterY, .PositionY:
            anim = CAKeyframeAnimation(keyPath: "position.y")
        case .Center, .Position:
            anim = CAKeyframeAnimation(keyPath: "position")

            // Background color
        case .BackgroundColor:
            anim = CAKeyframeAnimation(keyPath: "backgroundColor")
        
            // Border
        case .BorderColor:
            anim = CAKeyframeAnimation(keyPath: "borderColor")
        case .BorderWidth:
            anim = CAKeyframeAnimation(keyPath: "borderWidth")
            
            // Corner radius
        case .CornerRadius:
            anim = CAKeyframeAnimation(keyPath: "cornerRadius")
            
            // Opacity
        case .Opacity, .Alpha:
            anim = CAKeyframeAnimation(keyPath: "opacity")

            // Shadow
        case .ShadowColor:
            anim = CAKeyframeAnimation(keyPath: "shadowColor")
        case .ShadowOffset:
            anim = CAKeyframeAnimation(keyPath: "shadowOffset")
        case .ShadowOpacity:
            anim = CAKeyframeAnimation(keyPath: "shadowOpacity")
        case .ShadowRadius:
            anim = CAKeyframeAnimation(keyPath: "shadowRadius")
        case .ShadowPath:
            fatalError("INCOMPLETE IMPLEMENTATION")
            
            // Transform
        case.Transform:
            anim = CAKeyframeAnimation(keyPath: "transform")
        
            // Rotation
        case .RotationX, .RotationY, .RotationZ:
            anim = CAKeyframeAnimation(keyPath: "transform")
            
            // Scale
        case .ScaleX:
            anim = CAKeyframeAnimation(keyPath: "transform.scale.x")
        case .ScaleY:
            anim = CAKeyframeAnimation(keyPath: "transform.scale.y")
        case .ScaleZ:
            anim = CAKeyframeAnimation(keyPath: "transform.scale.z")
        case .Scale2D:
            anim = CAKeyframeAnimation(keyPath: "transform")
        case .Scale:
            anim = CAKeyframeAnimation(keyPath: "transform")
            
            // Translation
        case .TranslationX, .TranslationY, .TranslationZ, .Translation:
            anim = CAKeyframeAnimation(keyPath: "transform")
            
            // Z Position
        case .ZPosition:
            fatalError("INCOMPLETE IMPLEMENTATION")
        }
        
        if setDelay { anim.beginTime = animDesc.delay }
        anim.duration = animDesc.duration
        anim.fillMode = kCAFillModeForwards
        anim.removedOnCompletion = false
        anim.values = getValues(animDesc, viewProperties: viewProperties)
        
        return anim
    }
    
    private static func getValues(animDesc: AnimationDescriptor, viewProperties: ViewProperties) -> [AnyObject] {
        var values = [AnyObject]()
        let totalFrames = 60 * animDesc.duration
        var f: ((CGFloat) -> AnyObject)!
        
        switch animDesc.property {
            
            // Origin
            
        case .OriginX:
            let b = viewProperties.position.x
            let e = (animDesc.endValue as! CGFloat) + viewProperties.bounds.width * viewProperties.anchorPoint.x
            
            f = { return getScaledValue(b, e, $0) }
            viewProperties.origin.x = animDesc.endValue as! CGFloat
            
        case .OriginY:
            let b = viewProperties.position.y
            let e = (animDesc.endValue as! CGFloat) + viewProperties.bounds.height * viewProperties.anchorPoint.y
            
            f = { return getScaledValue(b, e, $0) }
            viewProperties.origin.y = animDesc.endValue as! CGFloat
            
        case .Origin:
            let e = (animDesc.endValue as! NSValue).CGPointValue()
            
            let bX = viewProperties.position.x
            let bY = viewProperties.position.y
            
            let eX = e.x + viewProperties.bounds.width*viewProperties.anchorPoint.x
            let eY = e.y + viewProperties.bounds.height * viewProperties.anchorPoint.y
            
            f = { return NSValue(CGPoint: CGPointMake(getScaledValue(bX, eX, $0), getScaledValue(bY, eY, $0))) }
            viewProperties.origin = e
            
            // Size
            
        case .SizeWidth:
            let b = viewProperties.bounds.width
            let e = animDesc.endValue as! CGFloat
            
            f = { return getScaledValue(b, e, $0) }
            viewProperties.bounds.size.width = e
            
        case .SizeHeight:
            let b = viewProperties.bounds.height
            let e = animDesc.endValue as! CGFloat
            
            f = { return getScaledValue(b, e, $0) }
            viewProperties.bounds.size.height = e
            
        case .Size:
            let e = (animDesc.endValue as! NSValue).CGSizeValue()
            
            let bW = viewProperties.bounds.width
            let bH = viewProperties.bounds.height
            let eW = e.width
            let eH = e.height
            
            f = { return NSValue(CGSize: CGSizeMake(getScaledValue(bW, eW, $0), getScaledValue(bH, eH, $0))) }
            viewProperties.bounds.size = e
        
            // Frame
            
        case .Frame:
            fatalError("Unable to get values for `frame` directly. Set values for `origin` and `size` separately instead.")
         
            // Center, Position
            
        case .CenterX, .PositionX:
            let b = viewProperties.position.x
            let e = animDesc.endValue as! CGFloat
            
            f = { return getScaledValue(b, e, $0) }
            viewProperties.position.x = e
            
        case .CenterY, .PositionY:
            let b = viewProperties.position.y
            let e = animDesc.endValue as! CGFloat
            
            f = { return getScaledValue(b, e, $0) }
            viewProperties.position.y = e
            
        case .Center, .Position:
            let e = (animDesc.endValue as! NSValue).CGPointValue()
            let bX = viewProperties.position.x
            let eX = e.x
            let bY = viewProperties.position.y
            let eY = e.y
            
            f = { return NSValue(CGPoint: CGPointMake(getScaledValue(bX, eX, $0), getScaledValue(bY, eY, $0))) }
            viewProperties.position = e
            
            // Background color
            
        case .BackgroundColor:
            let b = viewProperties.backgroundColor ?? UIColor.clearColor()
            let e = animDesc.endValue as! UIColor
            
            var bComp = [CGFloat](count: 4, repeatedValue: 0.0)
            var eComp = [CGFloat](count: 4, repeatedValue: 0.0)
            
            b.getRed(&bComp[0], green: &bComp[1], blue: &bComp[2], alpha: &bComp[3])
            e.getRed(&eComp[0], green: &eComp[1], blue: &eComp[2], alpha: &eComp[3])
            f = { return UIColor(red: getScaledValue(bComp[0], eComp[0], $0), green: getScaledValue(bComp[1], eComp[1], $0), blue: getScaledValue(bComp[2], eComp[2], $0), alpha: getScaledValue(bComp[3], eComp[3], $0)).CGColor }
            viewProperties.backgroundColor = e
            
            // Border
            
        case .BorderColor:
            let b = viewProperties.borderColor ?? UIColor.clearColor()
            let e = animDesc.endValue as! UIColor
            
            var bComp = [CGFloat](count: 4, repeatedValue: 0.0)
            var eComp = [CGFloat](count: 4, repeatedValue: 0.0)
            
            b.getRed(&bComp[0], green: &bComp[1], blue: &bComp[2], alpha: &bComp[3])
            e.getRed(&eComp[0], green: &eComp[1], blue: &eComp[2], alpha: &eComp[3])
            
            f = { return UIColor(red: getScaledValue(bComp[0], eComp[0], $0), green: getScaledValue(bComp[1], eComp[1], $0), blue: getScaledValue(bComp[2], eComp[2], $0), alpha: getScaledValue(bComp[3], eComp[3], $0)).CGColor }
            viewProperties.borderColor = e
            
        case .BorderWidth:
            let b = viewProperties.borderWidth
            let e = animDesc.endValue as! CGFloat
            
            f = { return getScaledValue(b, e, $0) }
            viewProperties.borderWidth = e

            // Corner radius
            
        case .CornerRadius:
            let b = viewProperties.cornerRadius
            let e = animDesc.endValue as! CGFloat
            
            f = { return getScaledValue(b, e, $0) }
            viewProperties.cornerRadius = e

            // Opacity
            
        case .Opacity, .Alpha:
            let b = viewProperties.opacity
            let e = animDesc.endValue as! Float
            
            f = { return getScaledValue(b, e, $0) }
            viewProperties.opacity = e
            
            // Shadow
            
        case .ShadowColor:
            let b = viewProperties.shadowColor ?? UIColor.clearColor()
            let e = animDesc.endValue as! UIColor
            
            var bComp = [CGFloat](count: 4, repeatedValue: 0.0)
            var eComp = [CGFloat](count: 4, repeatedValue: 0.0)
            
            b.getRed(&bComp[0], green: &bComp[1], blue: &bComp[2], alpha: &bComp[3])
            e.getRed(&eComp[0], green: &eComp[1], blue: &eComp[2], alpha: &eComp[3])
            
            f = { return UIColor(red: getScaledValue(bComp[0], eComp[0], $0), green: getScaledValue(bComp[1], eComp[1], $0), blue: getScaledValue(bComp[2], eComp[2], $0), alpha: getScaledValue(bComp[3], eComp[3], $0)).CGColor }
            viewProperties.shadowColor = e
            
        case .ShadowOffset:
            let b = viewProperties.shadowOffset
            let e = (animDesc.endValue as! NSValue).CGSizeValue()
            
            f = { return NSValue(CGSize: CGSizeMake(getScaledValue(b.width, e.width, $0), getScaledValue(b.height, e.height, $0))) }
            viewProperties.shadowOffset = e
            
        case .ShadowOpacity:
            let b = viewProperties.shadowOpacity
            let e = animDesc.endValue as! Float
            
            f = { return getScaledValue(b, e, $0) }
            viewProperties.shadowOpacity = e
        
        case .ShadowPath:
            fatalError("INCOMPLETE IMPLEMENTATION")
        
        case .ShadowRadius:
            let b = viewProperties.shadowRadius
            let e = animDesc.endValue as! CGFloat
            
            f = { return getScaledValue(b, e, $0) }
            viewProperties.shadowRadius = e
            
            // Transform
            
        case .Transform:
            fatalError("INCOMPLETE IMPLEMENTATION")

            // TODO: Implement transform animation
            
            
            // Rotation
            
        case .RotationX:
            let b = viewProperties.transform
            let e = animDesc.endValue as! CGFloat
            
            f = {
                let scale = getScaledValue(0.0, 1.0, $0)
                return NSValue(CATransform3D: CATransform3DRotate(b, e * scale, 1.0, 0.0, 0.0))
            }
            
            viewProperties.transform = CATransform3DRotate(b, e, 1.0, 0.0, 0.0)
            
        case .RotationY:
            let b = viewProperties.transform
            let e = animDesc.endValue as! CGFloat
            
            f = {
                let scale = getScaledValue(0.0, 1.0, $0)
                return NSValue(CATransform3D: CATransform3DRotate(b, e * scale, 0.0, 1.0, 0.0))
            }
            
            viewProperties.transform = CATransform3DRotate(b, e, 0.0, 1.0, 0.0)
            
        case .RotationZ:
            let b = viewProperties.transform
            let e = animDesc.endValue as! CGFloat
            
            f = {
                let scale = getScaledValue(0.0, 1.0, $0)
                return NSValue(CATransform3D: CATransform3DRotate(b, e * scale, 0.0, 0.0, 1.0))
            }
            
            viewProperties.transform = CATransform3DRotate(b, e, 0.0, 0.0, 1.0)
            
            // Scale
        case .ScaleX:
            let b = viewProperties.transform.m11
            let e = animDesc.endValue as! CGFloat
            
            f = { return getScaledValue(b, e, $0) }
            viewProperties.transform.m11 = e
            
        case .ScaleY:
            let b = viewProperties.transform.m22
            let e = animDesc.endValue as! CGFloat
            
            f = { return getScaledValue(b, e, $0) }
            viewProperties.transform.m22 = e
            
        case .Scale2D:
            let b = viewProperties.transform
            let e = (animDesc.endValue as! NSValue).CATransform3DValue
            
            f = {
                var c = b
                (c.m11, c.m22) = (getScaledValue(b.m11, e.m11, $0), getScaledValue(b.m22, e.m22, $0))
                return NSValue(CATransform3D: c)
            }
            viewProperties.transform.m11 = e.m11
            viewProperties.transform.m22 = e.m22
            
        case .ScaleZ:
            let b = viewProperties.transform.m33
            let e = animDesc.endValue as! CGFloat
            
            f = { return getScaledValue(b, e, $0) }
            
            viewProperties.transform.m33 = e
            
        case .Scale:
            let b = viewProperties.transform
            let e = (animDesc.endValue as! NSValue).CATransform3DValue
            
            f = {
                var c = b
                c.m11 = getScaledValue(b.m11, e.m11, $0)
                c.m22 = getScaledValue(b.m22, e.m22, $0)
                c.m33 = getScaledValue(b.m33, e.m33, $0)
                
                return NSValue(CATransform3D: c)
            }
            viewProperties.transform = e
            
            // Translation
        case .TranslationX:
            let b = viewProperties.transform
            let e = animDesc.endValue as! CGFloat
            
            f = {
                let scale = getScaledValue(0.0, 1.0, $0)
                let c = CATransform3DTranslate(b, e * scale, 0.0, 0.0)
                
                return NSValue(CATransform3D: c)
            }
            
            viewProperties.transform = CATransform3DTranslate(b, e, 0.0, 0.0)
            
        case .TranslationY:
            let b = viewProperties.transform
            let e = animDesc.endValue as! CGFloat
            
            f = {
                let scale = getScaledValue(0.0, 1.0, $0)
                let c = CATransform3DTranslate(b, 0.0, e * scale, 0.0)
                
                return NSValue(CATransform3D: c)
            }
            
            viewProperties.transform = CATransform3DTranslate(b, 0.0, e, 0.0)
            
        case .TranslationZ:
            let b = viewProperties.transform
            let e = animDesc.endValue as! CGFloat
            
            f = {
                let scale = getScaledValue(0.0, 1.0, $0)
                let c = CATransform3DTranslate(b, 0.0, 0.0, e * scale)
                
                return NSValue(CATransform3D: c)
            }
            
            viewProperties.transform = CATransform3DTranslate(b, 0.0, 0.0, e)
            
        case .Translation:
            let b = viewProperties.transform
            let e = (animDesc.endValue as! NSValue).CGSizeValue()
            
            f = {
                let scale = getScaledValue(0.0, 1.0, $0)
                let c = CATransform3DTranslate(b, e.width * scale, e.height * scale, 0.0)
                
                return NSValue(CATransform3D: c)
            }
            
            viewProperties.transform = CATransform3DTranslate(b, e.width, e.height, 0.0)
            
        case .ZPosition:
            fatalError("INCOMPLETE IMPLEMENTATION")
            
        }
        
        for i in 0 ... Int(totalFrames) {
            var scale: CGFloat!
            let rt = Double(i) / totalFrames
            
            switch animDesc.function {
            case .Linear:
                scale = CGFloat(TimingFunction.Linear(rt: rt, b: 0.0, c: 1.0))
                
            case .EaseInQuad:
                scale = CGFloat(TimingFunction.EaseInQuad(rt: rt, b: 0.0, c: 1.0))
            case .EaseOutQuad:
                scale = CGFloat(TimingFunction.EaseOutQuad(rt: rt, b: 0.0, c: 1.0))
            case .EaseInOutQuad:
                scale = CGFloat(TimingFunction.EaseInOutQuad(rt: rt, b: 0.0, c: 1.0))
                
            case .EaseInCubic:
                scale = CGFloat(TimingFunction.EaseInCubic(rt: rt, b: 0.0, c: 1.0))
            case .EaseOutCubic:
                scale = CGFloat(TimingFunction.EaseOutCubic(rt: rt, b: 0.0, c: 1.0))
            case .EaseInOutCubic:
                scale = CGFloat(TimingFunction.EaseInOutCubic(rt: rt, b: 0.0, c: 1.0))
                
            case .EaseInQuart:
                scale = CGFloat(TimingFunction.EaseInQuart(rt: rt, b: 0.0, c: 1.0))
            case .EaseOutQuart:
                scale = CGFloat(TimingFunction.EaseOutQuart(rt: rt, b: 0.0, c: 1.0))
            case .EaseInOutQuart:
                scale = CGFloat(TimingFunction.EaseInOutQuart(rt: rt, b: 0.0, c: 1.0))
                
            case .EaseInQuint:
                scale = CGFloat(TimingFunction.EaseInQuint(rt: rt, b: 0.0, c: 1.0))
            case .EaseOutQuint:
                scale = CGFloat(TimingFunction.EaseOutQuint(rt: rt, b: 0.0, c: 1.0))
            case .EaseInOutQuint:
                scale = CGFloat(TimingFunction.EaseInOutQuint(rt: rt, b: 0.0, c: 1.0))
                
            case .EaseInSine:
                scale = CGFloat(TimingFunction.EaseInSine(rt: rt, b: 0.0, c: 1.0))
            case .EaseOutSine:
                scale = CGFloat(TimingFunction.EaseOutSine(rt: rt, b: 0.0, c: 1.0))
            case .EaseInOutSine:
                scale = CGFloat(TimingFunction.EaseInOutSine(rt: rt, b: 0.0, c: 1.0))
                
            case .EaseInExpo:
                scale = CGFloat(TimingFunction.EaseInExpo(rt: rt, b: 0.0, c: 1.0))
            case .EaseOutExpo:
                scale = CGFloat(TimingFunction.EaseOutExpo(rt: rt, b: 0.0, c: 1.0))
            case .EaseInOutExpo:
                scale = CGFloat(TimingFunction.EaseInOutExpo(rt: rt, b: 0.0, c: 1.0))
                
            case .EaseInCirc:
                scale = CGFloat(TimingFunction.EaseInCirc(rt: rt, b: 0.0, c: 1.0))
            case .EaseOutCirc:
                scale = CGFloat(TimingFunction.EaseOutCirc(rt: rt, b: 0.0, c: 1.0))
            case .EaseInOutCirc:
                scale = CGFloat(TimingFunction.EaseInOutCirc(rt: rt, b: 0.0, c: 1.0))
                
            case .EaseInElastic:
                scale = CGFloat(TimingFunction.EaseInElastic(rt: rt, b: 0.0, c: 1.0, d: animDesc.duration))
            case .EaseOutElastic:
                scale = CGFloat(TimingFunction.EaseOutElastic(rt: rt, b: 0.0, c: 1.0, d: animDesc.duration))
            case .EaseInOutElastic:
                scale = CGFloat(TimingFunction.EaseInOutElastic(rt: rt, b: 0.0, c: 1.0, d: animDesc.duration))
                
            case .EaseInBack:
                scale = CGFloat(TimingFunction.EaseInBack(rt: rt, b: 0.0, c: 1.0))
            case .EaseOutBack:
                scale = CGFloat(TimingFunction.EaseOutBack(rt: rt, b: 0.0, c: 1.0))
            case .EaseInOutBack:
                scale = CGFloat(TimingFunction.EaseInOutBack(rt: rt, b: 0.0, c: 1.0))
                
            case .EaseInBounce:
                scale = CGFloat(TimingFunction.EaseInBounce(rt: rt, b: 0.0, c: 1.0))
            case .EaseOutBounce:
                scale = CGFloat(TimingFunction.EaseOutBounce(rt: rt, b: 0.0, c: 1.0))
            case .EaseInOutBounce:
                scale = CGFloat(TimingFunction.EaseInOutBounce(rt: rt, b: 0.0, c: 1.0))
            
            }
            
            values.append(f(scale))
        }
        
        return values
    }
}