//
//  Animation.swift
//  KRAnimation
//
//  Created by Joshua Park on 6/17/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

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

internal struct KRAnimation {
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
            
            let b = CGColorGetComponents(view.layer.backgroundColor ?? UIColor.clearColor().CGColor)
            let e = CGColorGetComponents(endValue as! CGColor)
            
            let bR = b[0]
            let bG = b[1]
            let bB = b[2]
            let bA = b[3]
            
            let eR = e[0]
            let eG = e[1]
            let eB = e[2]
            let eA = e[3]
            
            f = { return CGColorCreate(CGColorSpaceCreateDeviceRGB(), [getScaledValue(bR, eR, $0), getScaledValue(bG, eG, $0), getScaledValue(bB, eB, $0), getScaledValue(bA, eA, $0)])! }
            
            // Border
        case .BorderColor:
            anim = CAKeyframeAnimation(keyPath: "borderColor")
            
            let b = CGColorGetComponents(view.layer.borderColor ?? UIColor.clearColor().CGColor)
            let e = CGColorGetComponents(endValue as! CGColor)
            
            let bR = b[0]
            let bG = b[1]
            let bB = b[2]
            let bA = b[3]
            
            let eR = e[0]
            let eG = e[1]
            let eB = e[2]
            let eA = e[3]
            
            f = { return CGColorCreate(CGColorSpaceCreateDeviceRGB(), [getScaledValue(bR, eR, $0), getScaledValue(bG, eG, $0), getScaledValue(bB, eB, $0), getScaledValue(bA, eA, $0)])! }
            
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
            
            let b = CGColorGetComponents(view.layer.shadowColor ?? UIColor.clearColor().CGColor)
            let e = CGColorGetComponents(endValue as! CGColor)
            
            let bR = b[0]
            let bG = b[1]
            let bB = b[2]
            let bA = b[3]
            
            let eR = e[0]
            let eG = e[1]
            let eB = e[2]
            let eA = e[3]

            f = { return CGColorCreate(CGColorSpaceCreateDeviceRGB(), [getScaledValue(bR, eR, $0), getScaledValue(bG, eG, $0), getScaledValue(bB, eB, $0), getScaledValue(bA, eA, $0)])! }
            
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
}