//
//  Animation.swift
//  KRAnimation
//
//  Created by Joshua Park on 6/17/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

public enum AnimatableProperty {
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
//    case ShadowPath
    case ShadowRadius
    
    case Transform
    
    case ScaleX
    case ScaleY
    case ScaleZ
    case Scale
    
    case RotationX
    case RotationY
    case RotationZ
    case Rotation
    
    case TranslationX
    case TranslationY
    case TranslationZ
    case Translation
    
    case ZPosition
}

public struct Animation {
    let view: UIView
    let property: AnimatableProperty
    let endValue: AnyObject
    let duration: Double
    let function: FunctionType
}

public struct KRAnimation {
    public static func chain(animations: [Animation]..., reverses: Bool = false, repeatCount: Double = 1.0, completion: (() -> Void)? = nil) {
        // FIXME: - Remove in multi view support
        /**************************************/
        let view = animations[0][0].view
        guard animations.flatten().reduce(true, combine: { $0.0 && ($0.1.view == view) }) == true else { fatalError() }
        /**************************************/
        
        CATransaction.begin()
        var updatedValues = [AnimatableProperty: AnyObject]()
        var totalDuration = 0.0
        var chainedAnims = [CAAnimation]()
        
        CATransaction.setCompletionBlock {
            updateValues(view, updatedValues: updatedValues)
            view.layer.removeAllAnimations()
            completion?()
        }
        
        for animArray in animations {
            if animArray.count == 1 {
                let anim = animArray[0]
                
                let keyframeAnimation = getKeyframeAnimation(anim)
                keyframeAnimation.beginTime = totalDuration
                keyframeAnimation.values = getValues(updatedValues[anim.property], animation: anim)
                
                totalDuration += anim.duration
                chainedAnims.append(keyframeAnimation)
                
                updatedValues[anim.property] = anim.endValue
            } else {
                var groupedAnimations = [CAKeyframeAnimation]()
                
                let animationGroup = CAAnimationGroup()
                animationGroup.beginTime = totalDuration
                animationGroup.duration = animArray[0].duration
                animationGroup.fillMode = kCAFillModeForwards
                animationGroup.removedOnCompletion = false
                
                for anim in animArray {
                    guard anim.duration == animationGroup.duration else { fatalError("All animations in an animation group must have the same duration.") }
                    
                    let keyframeAnimation = getKeyframeAnimation(anim)
                    keyframeAnimation.duration = anim.duration
                    keyframeAnimation.fillMode = kCAFillModeForwards
                    keyframeAnimation.removedOnCompletion = false
                    keyframeAnimation.values = getValues(updatedValues[anim.property], animation: anim)
                    
                    updatedValues[anim.property] = anim.endValue
                    
                    groupedAnimations.append(keyframeAnimation)
                }
                
                animationGroup.animations = groupedAnimations
                
                totalDuration += animationGroup.duration
                chainedAnims.append(animationGroup)
            }
        }
        
        let animGroup = CAAnimationGroup()
        animGroup.duration = totalDuration
        animGroup.animations = chainedAnims
        animGroup.fillMode = kCAFillModeForwards
        animGroup.removedOnCompletion = false
        
        animations[0][0].view.layer.addAnimation(animGroup, forKey: nil)
        
        CATransaction.commit()
    }
    
    internal static func getScaledValue(_ b: CGFloat, _ e: CGFloat, _ scale: CGFloat) -> CGFloat {
        return b + scale * (e - b)
    }
    
    internal static func getScaledValue(_ b: Float, _ e: Float, _ scale: CGFloat) -> CGFloat {
        return CGFloat(b) + scale * CGFloat(e - b)
    }
    
    internal static func getScaledValue(_ b: Double, _ e: Double, _ scale: CGFloat) -> CGFloat {
        return CGFloat(b) + scale * CGFloat(e - b)
    }

    internal static func animateView(view: UIView, property: AnimatableProperty, endValue: AnyObject, duration: Double, function: FunctionType, reverses: Bool, repeatCount: Float , nextAnimation: (() -> [CAAnimation])?) {
        var anim = getKeyframeAnimationForView(view, property: property, endValue: endValue, duration: duration, function: function)
        view.setProperty(property, withEndValue: endValue)
        
        let animGroup = getAnimGroupWithAnimations([anim as! CAAnimation], duration: duration, reverses: reverses, repeatCount: repeatCount, nextAnimation: nextAnimation)
        view.layer.addAnimation(animGroup, forKey: nil)
    }
    
    internal static func chainView(view: UIView, property: AnimatableProperty, endValue: AnyObject, duration: Double, function: FunctionType, nextAnimation: (() -> [CAAnimation])?) -> [CAAnimation] {
        var animations = [CAAnimation]()
        
        switch property {
        case .Frame:
            let endFrame = (endValue as! NSValue).CGRectValue()
            let endOrigin = NSValue(CGPoint: endFrame.origin)
            let endSize = NSValue(CGSize: endFrame.size)
            
            let animPos = getKeyframeAnimationForView(view, property: .Origin, endValue: endOrigin, duration: duration, function: function)
            let animSize = getKeyframeAnimationForView(view, property: .Size, endValue: endSize, duration: duration, function: function)
            
            let anim = CAAnimationGroup()
            anim.animations = [animPos, animSize]
            anim.duration = duration
            anim.fillMode = kCAFillModeForwards
            anim.removedOnCompletion = false
          
            view.setProperty(.Frame, withEndValue: endValue)
            
            animations.append(anim)
        default:
            let anim = getKeyframeAnimationForView(view, property: property, endValue: endValue, duration: duration, function: function)
            view.setProperty(property, withEndValue: endValue)
            
            animations.append(anim)
        }
        if let chainedAnimation = nextAnimation { animations += chainedAnimation() }
        
        return animations
    }
    
    internal static func getKeyframeAnimationForView(view: UIView, property: AnimatableProperty, endValue: AnyObject, duration: Double, function: FunctionType) -> CAKeyframeAnimation {
        var anim: CAKeyframeAnimation!
        var f: ((CGFloat) -> AnyObject)!
        
        switch property {
            // Origin
        case .OriginX:
            anim = CAKeyframeAnimation(keyPath: "position.x")
            
            let b = view.center.x
            let e = (endValue as! CGFloat) + view.frame.width / 2.0
            f = { return getScaledValue(b, e, $0) }
        case .OriginY:
            anim = CAKeyframeAnimation(keyPath: "position.y")
            
            let b = view.center.y
            let e = (endValue as! CGFloat) + view.frame.height / 2.0
            f = { return getScaledValue(b, e, $0) }
        case .Origin:
            anim = CAKeyframeAnimation(keyPath: "position")
            
            let e = (endValue as! NSValue).CGPointValue()
            let bX = view.center.x
            let bY = view.center.y
            let eX = e.x + view.frame.width / 2.0
            let eY = e.y + view.frame.height / 2.0
            
            f = { return NSValue(CGPoint: CGPointMake(getScaledValue(bX, eX, $0), getScaledValue(bY, eY, $0))) }
            
            // Size
        case .SizeWidth:
            anim = CAKeyframeAnimation(keyPath: "bounds.size.width")
            
            let b = view.bounds.width
            let e = endValue as! CGFloat
            
            f = { return getScaledValue(b, e, $0) }
        case .SizeHeight:
            anim = CAKeyframeAnimation(keyPath: "bounds.size.height")
            
            let b = view.bounds.height
            let e = endValue as! CGFloat
            
            f = { return getScaledValue(b, e, $0) }
        case .Size:
            anim = CAKeyframeAnimation(keyPath: "bounds.size")
            
            let e = (endValue as! NSValue).CGSizeValue()
            let bW = view.bounds.width
            let bH = view.bounds.height
            let eW = e.width
            let eH = e.height
            
            f = { return NSValue(CGSize: CGSizeMake(getScaledValue(bW, eW, $0), getScaledValue(bH, eH, $0))) }
            
            // Frame
        case .Frame:
            fatalError("Keyframe animation for `frame` unavailable. Get separate animations for origin, size and bind into CAAnimationGroup instead.")
            
            // Center
        case .CenterX, .PositionX:
            anim = CAKeyframeAnimation(keyPath: "position.x")
            
            let b = view.center.x
            let e = endValue as! CGFloat
            
            f = { return getScaledValue(b, e, $0) }
        case .CenterY, .PositionY:
            anim = CAKeyframeAnimation(keyPath: "position.y")
            
            let b = view.center.y
            let e = endValue as! CGFloat
            
            f = { return getScaledValue(b, e, $0) }
        case .Center, .Position:
            anim = CAKeyframeAnimation(keyPath: "position")
            
            let e = (endValue as! NSValue).CGPointValue()
            let bX = view.center.x
            let eX = e.x
            let bY = view.center.y
            let eY = e.y
            
            f = { return NSValue(CGPoint: CGPointMake(getScaledValue(bX, eX, $0), getScaledValue(bY, eY, $0))) }
            
            // Background color
        case .BackgroundColor:
            anim = CAKeyframeAnimation(keyPath: "backgroundColor")
            
            let b = view.layer.backgroundColor != nil ? UIColor(CGColor: view.layer.backgroundColor!) : UIColor.clearColor()
            let e = endValue as! UIColor
            
            var bComp = [CGFloat](count: 4, repeatedValue: 0.0)
            var eComp = [CGFloat](count: 4, repeatedValue: 0.0)
            
            b.getRed(&bComp[0], green: &bComp[1], blue: &bComp[2], alpha: &bComp[3])
            e.getRed(&eComp[0], green: &eComp[1], blue: &eComp[2], alpha: &eComp[3])
            
            f = { return UIColor(red: getScaledValue(bComp[0], eComp[0], $0), green: getScaledValue(bComp[1], eComp[1], $0), blue: getScaledValue(bComp[2], eComp[2], $0), alpha: getScaledValue(bComp[3], eComp[3], $0)).CGColor }
            
            // Border
        case .BorderColor:
            anim = CAKeyframeAnimation(keyPath: "borderColor")
            
            let b = view.layer.borderColor != nil ? UIColor(CGColor: view.layer.backgroundColor!) : UIColor.clearColor()
            let e = endValue as! UIColor
            
            var bComp = [CGFloat](count: 4, repeatedValue: 0.0)
            var eComp = [CGFloat](count: 4, repeatedValue: 0.0)
            
            b.getRed(&bComp[0], green: &bComp[1], blue: &bComp[2], alpha: &bComp[3])
            e.getRed(&eComp[0], green: &eComp[1], blue: &eComp[2], alpha: &eComp[3])
            
            f = { return UIColor(red: getScaledValue(bComp[0], eComp[0], $0), green: getScaledValue(bComp[1], eComp[1], $0), blue: getScaledValue(bComp[2], eComp[2], $0), alpha: getScaledValue(bComp[3], eComp[3], $0)).CGColor }
            
        case .BorderWidth:
            anim = CAKeyframeAnimation(keyPath: "borderWidth")
            
            let b = view.layer.borderWidth
            let e = endValue as! CGFloat
            
            f = { return getScaledValue(b, e, $0) }
            
            // Corner radius
        case .CornerRadius:
            anim = CAKeyframeAnimation(keyPath: "cornerRadius")
            
            let b = view.layer.cornerRadius
            let e = endValue as! CGFloat
            
            f = { return getScaledValue(b, e, $0) }
            
            // Opacity
        case .Opacity, .Alpha:
            anim = CAKeyframeAnimation(keyPath: "opacity")
            
            let b = CGFloat(view.layer.opacity)
            let e = endValue as! CGFloat
            
            f = { return getScaledValue(b, e, $0) }
            
            // Shadow
        case .ShadowColor:
            anim = CAKeyframeAnimation(keyPath: "shadowColor")
            
            let b = view.layer.shadowColor != nil ? UIColor(CGColor: view.layer.backgroundColor!) : UIColor.clearColor()
            let e = endValue as! UIColor
            
            var bComp = [CGFloat](count: 4, repeatedValue: 0.0)
            var eComp = [CGFloat](count: 4, repeatedValue: 0.0)
            
            b.getRed(&bComp[0], green: &bComp[1], blue: &bComp[2], alpha: &bComp[3])
            e.getRed(&eComp[0], green: &eComp[1], blue: &eComp[2], alpha: &eComp[3])
            
            f = { return UIColor(red: getScaledValue(bComp[0], eComp[0], $0), green: getScaledValue(bComp[1], eComp[1], $0), blue: getScaledValue(bComp[2], eComp[2], $0), alpha: getScaledValue(bComp[3], eComp[3], $0)).CGColor }
            
        case .ShadowOffset:
            anim = CAKeyframeAnimation(keyPath: "shadowOffset")
            
            let b = view.layer.shadowOffset
            let e = (endValue as! NSValue).CGSizeValue()
            
            f = { return NSValue(CGSize: CGSizeMake(getScaledValue(b.width, e.width, $0), getScaledValue(b.height, e.height, $0))) }
            
        case .ShadowOpacity:
            anim = CAKeyframeAnimation(keyPath: "shadowOpacity")
            
            let b = view.layer.shadowOpacity
            let e = endValue as! Float
            
            f = { return getScaledValue(b, e, $0) }
            
            // TODO: Implementation for shadow path
            
        case .ShadowRadius:
            anim = CAKeyframeAnimation(keyPath: "shadowRadius")
            
            let b = view.layer.shadowRadius
            let e = endValue as! CGFloat
            
            f = { return getScaledValue(b, e, $0) }
            
            // Scale
        case .ScaleX:
            anim = CAKeyframeAnimation(keyPath: "transform.scale.x")
            
            let b = view.layer.transform.m11
            let e = endValue as! CGFloat
            
            f = { return getScaledValue(b, e, $0) }
            
        case .ScaleY:
            anim = CAKeyframeAnimation(keyPath: "transform.scale.y")
            
            let b = view.layer.transform.m22
            let e = endValue as! CGFloat
            
            f = { return getScaledValue(b, e, $0) }
            
        default:
            fatalError("Check property type: \(property)")
        }
        
        var values = [AnyObject]()
        let steps = 60 * duration
        
        for i in 0 ... Int(steps) {
            var scale: CGFloat!
            switch function {
            case .Linear:
                scale = CGFloat(TimingFunction.Linear(rt: Double(i) / steps, b: 0.0, c: 1.0))
            case .EaseInCubic:
                scale = CGFloat(TimingFunction.EaseInCubic(rt: Double(i) / steps, b: 0.0, c: 1.0))
            case .EaseOutCubic:
                scale = CGFloat(TimingFunction.EaseOutCubic(rt: Double(i) / steps, b: 0.0, c: 1.0))
            case .EaseInOutCubic:
                scale = CGFloat(TimingFunction.EaseInOutCubic(rt: Double(i) / steps, b: 0.0, c: 1.0))
            }
            
            values.append(f(scale))
        }
        
        anim.duration = duration
        anim.fillMode = kCAFillModeForwards
        anim.removedOnCompletion = false
        anim.values = values
        return anim
    }
    
    internal static func getAnimGroupWithAnimations(animations: [CAAnimation], duration: Double, reverses: Bool, repeatCount: Float, nextAnimation: (() -> [CAAnimation])?) -> CAAnimationGroup {
        var totalDuration = duration
        var animations = animations
        
        if let _ = nextAnimation {
            for ani in nextAnimation!() {
                ani.beginTime += totalDuration
                totalDuration += ani.duration
                animations.append(ani)
            }
        }
        
        let animGroup = CAAnimationGroup()
        animGroup.animations = animations
        animGroup.duration = totalDuration
        animGroup.repeatCount = repeatCount
        animGroup.autoreverses = reverses
        
        return animGroup
    }
    
    
    
    
    
    
    
    internal static func getKeyframeAnimation(animation: Animation) -> CAKeyframeAnimation {
        var anim: CAKeyframeAnimation!
        switch animation.property {
        case .OriginX: anim = CAKeyframeAnimation(keyPath: "position.x")
        case .BackgroundColor: anim = CAKeyframeAnimation(keyPath: "backgroundColor")
        default: return CAKeyframeAnimation()
        }
        
        anim.duration = animation.duration
        anim.fillMode = kCAFillModeForwards
        anim.removedOnCompletion = false
        
        return anim
    }
    
    internal static func getValues(beginValue: AnyObject?, animation: Animation) -> [AnyObject] {
        var values = [AnyObject]()
        let totalFrames = 60 * animation.duration
        var f: ((CGFloat) -> AnyObject)!
        
        switch animation.property {
        case .OriginX:
            let b = beginValue as? CGFloat ?? animation.view.center.x
            let e = animation.endValue as! CGFloat
            
            f = { return getScaledValue(b, e, $0) }
        case .BackgroundColor:
            let b = beginValue as? UIColor ?? (animation.view.backgroundColor ?? UIColor.clearColor())
            let e = animation.endValue as! UIColor
            
            var bComp = [CGFloat](count: 4, repeatedValue: 0.0)
            var eComp = [CGFloat](count: 4, repeatedValue: 0.0)
            
            b.getRed(&bComp[0], green: &bComp[1], blue: &bComp[2], alpha: &bComp[3])
            e.getRed(&eComp[0], green: &eComp[1], blue: &eComp[2], alpha: &eComp[3])
            f = { return UIColor(red: getScaledValue(bComp[0], eComp[0], $0), green: getScaledValue(bComp[1], eComp[1], $0), blue: getScaledValue(bComp[2], eComp[2], $0), alpha: getScaledValue(bComp[3], eComp[3], $0)).CGColor }
        default:
            break
        }
        
        for i in 0 ... Int(totalFrames) {
            let scale = CGFloat(TimingFunction.Linear(rt: Double(i) / totalFrames, b: 0.0, c: 1.0))
            
            values.append(f(scale))
        }
        
        return values
    }
    
    internal static func updateValues(view: UIView, updatedValues: [AnimatableProperty: AnyObject]) {
        for (property, value) in updatedValues {
            switch property {
            case .OriginX:
                view.frame.origin.x = value as! CGFloat
            case .BackgroundColor:
                view.backgroundColor = value as? UIColor
            default: break
            }
        }
    }
}