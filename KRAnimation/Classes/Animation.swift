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

public struct DelayedAnimation {
    let view: UIView
    let delay: Double
    
    func animateX(x: CGFloat, duration: Double, function: FunctionType, reverses: Bool = false, infinite: Bool = false, nextAnimation: (() -> [CAKeyframeAnimation])? = nil) {
        print(nextAnimation?())
    }
    
    func chainX(x: CGFloat, duration: Double, function: FunctionType, nextAnimation: (() -> [CAKeyframeAnimation])? = nil) -> [CAKeyframeAnimation] {
        var animation = [CAKeyframeAnimation()]
        if let chainedAnimation = nextAnimation { animation += chainedAnimation() }
        
        return animation
    }
}

public extension UIView {
    func animateX(x: CGFloat, duration: Double, function: FunctionType, reverses: Bool = false, infinite: Bool = false, nextAnimation: (() -> [CAKeyframeAnimation])? = nil) {
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
            values.append(self.center.x + scale * ((x + self.frame.width / 2.0) - self.center.x))
        }
        
        let anim = CAKeyframeAnimation(keyPath: "position.x")
        anim.duration = duration
        anim.fillMode = kCAFillModeForwards
        anim.removedOnCompletion = false
        anim.values = values
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
    
    func chainX(x: CGFloat, duration: Double, function: FunctionType, nextAnimation: (() -> [CAKeyframeAnimation])? = nil) -> [CAKeyframeAnimation] {
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
            values.append(self.center.x + scale * ((x + self.frame.width / 2.0) - self.center.x))
        }
        
        let anim = CAKeyframeAnimation(keyPath: "position.x")
        anim.duration = duration
        anim.fillMode = kCAFillModeForwards
        anim.removedOnCompletion = false
        anim.values = values
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
}