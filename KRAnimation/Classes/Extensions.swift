//
//  Extensions.swift
//  Pods
//
//  Created by Joshua Park on 6/16/16.
//
//

import UIKit
import KRTimingFunction

public extension UIView {
    public class func animateWithAnimator(animator: Animator) {
        switch animator {
        case .Linear(let begin, let end, let duration, let completion):
            if let begin = begin { for anim in begin { anim.set() } }
            
            animateKeyframesWithDuration(duration, delay: 0.0, options: [.AllowUserInteraction, .CalculationModeLinear], animations: {
                // TODO: Add keyframes
                for anim in end { addKeyFrameAnimation(anim, duration: duration, function: TimingFunction.Linear) }
                }, completion: completion)
        case .EaseInCubic(animation: let animation, duration: let duration, completion: let completion):
            animateKeyframesWithDuration(duration, delay: 0.0, options: [.AllowUserInteraction, .CalculationModeLinear], animations: {
                // TODO: Add keyframes
                for anim in animation { addKeyFrameAnimation(anim, duration: duration, function: TimingFunction.EaseInCubic) }
                }, completion: completion)
        default:
            fatalError("")
        }
    }
    
    private class func addKeyFrameAnimation(animation: Animation, duration: Double, function: Any) {
        let totalSteps = 60 * duration * 10
        
        for i in 0 ..< Int(totalSteps) {
            let startTime = Double(i) / (totalSteps - 1.0)
            
            addKeyframeWithRelativeStartTime(startTime, relativeDuration: 1.0 / totalSteps, animations: {
                animation.setWithRelativeTime(startTime, duration: duration, function: function)
            })
        }
    }
}

extension CALayer {
    private func getProperties(animator: Animator) -> (String, Double, AnyObject?, AnyObject, Double) {
        switch animator {
        case .LinearKeyPath(keyPath: let k, time: let t, begin: let b, end: let e, duration: let d):
            return (k, t, b, e, d)
//        case .CubicKeyPath(keyPath: let k, time: let t, begin: let b, end: let e, duration: let d):
//            return (k, t, b, e, d)
        default:
            fatalError("Use function with key path")
        }
    }
    
    func getKeyFrameAnimation(animator: Animator) -> CAAnimation {
        let properties = getProperties(animator)
        let anim = CABasicAnimation(keyPath: properties.0)
        anim.beginTime = CACurrentMediaTime() + properties.1
        anim.fromValue = properties.2
        anim.toValue = properties.3
        anim.duration = properties.4
        
        return anim
    }
    
    func addKeyFrameAnimation(animator: Animator, forKey key: String?) {
        addAnimation(getKeyFrameAnimation(animator), forKey: key)
    }
}
