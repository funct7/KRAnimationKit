//
//  Animation.swift
//  KRAnimation
//
//  Created by Joshua Park on 6/17/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import KRTimingFunction

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
}

public extension UIView {
    public func chainAnimations(animations: CAKeyframeAnimation...) {
        var totalDuration = 0.0
        for anim in animations {
            anim.beginTime += totalDuration
            totalDuration += anim.duration
        }
        
        let animGroup = CAAnimationGroup()
        animGroup.animations = animations
        animGroup.duration = totalDuration
        
        self.layer.addAnimation(animGroup, forKey: nil)
    }
    
    func animateX(x: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, infinite: Bool = false, nextAnimation: (() -> [CAKeyframeAnimation])? = nil) {
        let anim = getKeyframeAnimation(.OriginX, endValue: x, duration: duration, function: function)
        self.frame.origin.x = x
        
        var totalDuration = duration
        var animations = [anim]
        
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
        
        self.layer.addAnimation(animGroup, forKey: nil)
    }
    
    func chainX(x: CGFloat, duration: Double, function: FunctionType = .Linear, nextAnimation: (() -> [CAKeyframeAnimation])? = nil) -> [CAKeyframeAnimation] {
        let anim = getKeyframeAnimation(.OriginX, endValue: x, duration: duration, function: function)
        self.frame.origin.x = x
        
        var animations = [anim]
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
                anim = CAKeyframeAnimation(keyPath: "position.x")
                
                let b = self.center.x
                let e = (endValue as! CGFloat) + self.frame.width / 2.0
                values.append(b + scale * (e - b))
            case .OriginY:
                anim = CAKeyframeAnimation(keyPath: "position.y")
                
                let b = self.center.y
                let e = (endValue as! CGFloat) + self.frame.height / 2.0
                values.append(b + scale * (e - b))
            case .Origin:
                anim = CAKeyframeAnimation(keyPath: "position")
                
                let e = (endValue as! NSValue).CGPointValue()
                let bX = self.center.x
                let bY = self.center.y
                let eX = e.x + self.frame.width / 2.0
                let eY = e.y + self.frame.height / 2.0
                
                values.append(NSValue(CGPoint: CGPointMake(eX, eY)))
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
    // FIXME: Consider using NSTimer or CATransaction
    public func animateX(x: CGFloat, duration: Double, function: FunctionType, reverses: Bool = false, infinite: Bool = false, nextAnimation: (() -> [CAKeyframeAnimation])? = nil) {
        let anim = getKeyframeAnimation(.OriginX, endValue: x, duration: duration, function: function)
        view.frame.origin.x = x
        
        var totalDuration = duration
        var animations = [anim]
        
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
        
        view.layer.addAnimation(animGroup, forKey: nil)
    }
    
    public func chainX(x: CGFloat, duration: Double, function: FunctionType, nextAnimation: (() -> [CAKeyframeAnimation])? = nil) -> [CAKeyframeAnimation] {
        let anim = getKeyframeAnimation(.OriginX, endValue: x, duration: duration, function: function)
        view.frame.origin.x = x
        
        var animations = [anim]
        if let chainedAnimation = nextAnimation { animations += chainedAnimation() }
        
        return animations
    }
    
    private func getKeyframeAnimation(property: AnimatableProperty, endValue: Any, duration: Double, function: FunctionType) -> CAKeyframeAnimation {
        var anim: CAKeyframeAnimation!
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
                anim = CAKeyframeAnimation(keyPath: "position.x")
                
                let b = view.center.x
                let e = (endValue as! CGFloat) + view.frame.width / 2.0
                values.append(b + scale * (e - b))
            case .OriginY:
                anim = CAKeyframeAnimation(keyPath: "position.y")
                
                let b = view.center.y
                let e = (endValue as! CGFloat) + view.frame.height / 2.0
                values.append(b + scale * (e - b))
            case .Origin:
                anim = CAKeyframeAnimation(keyPath: "position")
                
                let e = (endValue as! NSValue).CGPointValue()
                let bX = view.center.x
                let bY = view.center.y
                let eX = e.x + view.frame.width / 2.0
                let eY = e.y + view.frame.height / 2.0
                
                values.append(NSValue(CGPoint: CGPointMake(eX, eY)))
            default:
                break
            }
        }
        
        anim.beginTime = delay
        anim.duration = duration
        anim.fillMode = kCAFillModeForwards
        anim.removedOnCompletion = false
        anim.values = values
        return anim
    }
}
