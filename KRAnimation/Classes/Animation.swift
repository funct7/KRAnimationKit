//
//  Animation.swift
//  KRAnimation
//
//  Created by Joshua Park on 6/17/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

public enum AnimatableKeyPath {
    case BackgroundColor
    case BorderColor
    case BorderWidth
    case Bounds
    case Hidden
    case Mask
    case MasksToBounds
    case Opacity
    case Position
    case ShadowColor
    case ShadowOffset
    case ShadowOpacity
    case ShadowPath
    case ShadowRadius
    case Transform
    case ZPosition
}

public enum FunctionType {
    case Linear
    case EaseInCubic
    case EaseOutCubic
    case EaseInOutCubic
}

private enum AnimatableProperty {
    case Frame
    
    case Origin
    case OriginX
    case OriginY
    
    case Size
    case SizeWidth
    case SizeHeight
    
    case Center
    case CenterX
    case CenterY
}

private func getScaledValue(_ b: CGFloat, _ e: CGFloat, _ scale: CGFloat) -> CGFloat {
    return b + scale * (e - b)
}

public extension UIView {
    func chainAnimations(animations: [CAPropertyAnimation]..., reverses: Bool = false, repeatCount: Float = 0.0) {
        let animations = animations.flatMap { $0 }
        var totalDuration = 0.0
        
        for anim in animations {
            anim.beginTime += totalDuration
            totalDuration += anim.duration
        }
        
        let animGroup = CAAnimationGroup()
        animGroup.animations = animations
        animGroup.duration = totalDuration
        animGroup.repeatCount = repeatCount
        animGroup.autoreverses = reverses
        
        layer.addAnimation(animGroup, forKey: nil)
    }
    
    func animateX(x: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, nextAnimation: (() -> [CAPropertyAnimation])? = nil) {
        let anim = getKeyframeAnimation(.OriginX, endValue: x, duration: duration, function: function)
        frame.origin.x = x
        
        var totalDuration = duration
        var animations = [anim as! CAPropertyAnimation]
        
        if let _ = nextAnimation {
            for ani in nextAnimation!() {
                ani.beginTime += totalDuration
                totalDuration += ani.duration
                animations.append(ani)
            }
        }
        
        print(animations)
        
        let animGroup = CAAnimationGroup()
        animGroup.animations = animations
        animGroup.duration = totalDuration
        animGroup.repeatCount = repeatCount
        animGroup.autoreverses = reverses
        
        layer.addAnimation(animGroup, forKey: nil)
    }
    
    func chainX(x: CGFloat, duration: Double, function: FunctionType = .Linear, nextAnimation: (() -> [CAPropertyAnimation])? = nil) -> [CAPropertyAnimation] {
        let anim = getKeyframeAnimation(.OriginX, endValue: x, duration: duration, function: function)
        self.frame.origin.x = x
        
        var animations = [anim as! CAPropertyAnimation]
        if let chainedAnimation = nextAnimation { animations += chainedAnimation() }
        
        return animations
    }
    
    func animateY(y: CGFloat, duration: Double, function: FunctionType) {}
    func animateWidth(w: CGFloat, duration: Double, function: FunctionType) {}
    func animateHeight(h: CGFloat, duration: Double, function: FunctionType) {}
    
    func animateFrame(x: CGFloat, _ y: CGFloat, _ w: CGFloat, _ h: CGFloat, duration: Double, function: FunctionType) {}
    func animateFrame(frame: CGRect, duration: Double, function: FunctionType) {}
    
    func after(delay: Double) -> DelayedAnimation {
        return DelayedAnimation(view: self, delay: delay)
    }
    
    private func getKeyframeAnimation(property: AnimatableProperty, endValue: Any, duration: Double, function: FunctionType) -> CAKeyframeAnimation {
        var anim: CAKeyframeAnimation!
        var f: ((CGFloat) -> Any)!
        
        switch property {
        case .OriginX:
            anim = CAKeyframeAnimation(keyPath: "position.x")
            
            let b = center.x
            let e = (endValue as! CGFloat) + frame.width / 2.0
            f = { return getScaledValue(b, e, $0) }
        case .OriginY:
            anim = CAKeyframeAnimation(keyPath: "position.y")
            
            let b = center.y
            let e = (endValue as! CGFloat) + frame.height / 2.0
            f = { return getScaledValue(b, e, $0) }
        case .Origin:
            anim = CAKeyframeAnimation(keyPath: "position")
            
            let e = (endValue as! NSValue).CGPointValue()
            let bX = center.x
            let bY = center.y
            let eX = e.x + frame.width / 2.0
            let eY = e.y + frame.height / 2.0
            
            f = { return NSValue(CGPoint: CGPointMake(getScaledValue(bX, eX, $0), getScaledValue(bX, eX, $0))) }
            
        case .CenterX:
            anim = CAKeyframeAnimation(keyPath: "position.x")
            
            let b = center.x
            let e = endValue as! CGFloat
            
            f = { return getScaledValue(b, e, $0) }
        default:
            break
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
            
            switch property {
            case .OriginX:
                values.append(f(scale) as! CGFloat)
            case .OriginY:
                values.append(f(scale) as! CGFloat)
            case .Origin:
                values.append(f(scale) as! NSValue)
            default:
                break
            }
        }
        
        anim.duration = duration
        anim.fillMode = kCAFillModeForwards
        anim.removedOnCompletion = false
        anim.values = values
        return anim
    }
}

public struct DelayedAnimation {
    let view: UIView
    let delay: Double
    let preAnim: CABasicAnimation
    
    init(view: UIView, delay: Double) {
        self.view = view
        self.delay = delay
        
        preAnim = CABasicAnimation(keyPath: "position.x")
        preAnim.duration = delay
        preAnim.fromValue = view.center.x
        preAnim.toValue = view.center.x
        preAnim.fillMode = kCAFillModeForwards
        preAnim.removedOnCompletion = false
        
        view.center.x = view.center.x
    }
    
    public func animateX(x: CGFloat, duration: Double, function: FunctionType, reverses: Bool = false, repeatCount: Float = 0.0, nextAnimation: (() -> [CAPropertyAnimation])? = nil) {
        let anim = getKeyframeAnimation(.OriginX, endValue: x, duration: duration, function: function)
        view.frame.origin.x = x
        
        var totalDuration = 0.0
        var animations = [preAnim, anim]
        
        if let _ = nextAnimation { animations += nextAnimation!() }
        
        for anim in animations {
            anim.beginTime += totalDuration
            totalDuration += anim.duration
        }
        
        let animGroup = CAAnimationGroup()
        animGroup.animations = animations
        animGroup.duration = totalDuration
        animGroup.repeatCount = repeatCount
        animGroup.autoreverses = reverses
        
        view.layer.addAnimation(animGroup, forKey: nil)
    }
    
    public func chainX(x: CGFloat, duration: Double, function: FunctionType, nextAnimation: (() -> [CAPropertyAnimation])? = nil) -> [CAPropertyAnimation] {
        let anim = getKeyframeAnimation(.OriginX, endValue: x, duration: duration, function: function)
        view.frame.origin.x = x
        
        var animations = [preAnim, anim]
        if let chainedAnimation = nextAnimation { animations += chainedAnimation() }
        
        return animations
    }

    private func getKeyframeAnimation(property: AnimatableProperty, endValue: AnyObject, duration: Double, function: FunctionType) -> CAKeyframeAnimation {
        var anim: CAKeyframeAnimation!
        var f: ((CGFloat) -> Any)!
        
        switch property {
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
            
            f = { return NSValue(CGPoint: CGPointMake(getScaledValue(bX, eX, $0), getScaledValue(bX, eX, $0))) }
        default:
            break
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
            
            switch property {
            case .OriginX:
                values.append(f(scale) as! CGFloat)
            case .OriginY:
                values.append(f(scale) as! CGFloat)
            case .Origin:
                values.append(f(scale) as! NSValue)
            default:
                break
            }
        }

        anim.duration = duration
        anim.fillMode = kCAFillModeForwards
        anim.removedOnCompletion = false
        anim.values = values
        
        return anim
    }
}
