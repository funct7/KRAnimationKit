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
        case .Linear(animation: let animation, duration: let duration, completion: let completion):
            
            animateWithDuration(duration, animations: { 
                for anim in animation { anim.set() }
                }, completion: completion)
            
        case .EaseInCubic(animation: let animation, duration: let duration, completion: let completion):
            
            animateKeyframesWithDuration(duration, delay: 0.0, options: [.AllowUserInteraction, .CalculationModeLinear], animations: {
                for anim in animation { anim.setWithDuration(duration, function: TimingFunction.EaseInCubic) }
                }, completion: completion)
            
        default:
            fatalError("")
        }
    }
}

public extension CAKeyframeAnimation {
    convenience init(animator: Animator) {
        let properties = animator.getProperties()
        
        self.init(keyPath: properties.keyPath)
        
        self.beginTime = CACurrentMediaTime() + properties.beginTime
        self.duration = properties.duration
        self.values = properties.values
    }
}

public extension CALayer {
    func addKeyFrameAnimation(animator: Animator, forKey key: String?) {
        addAnimation(CAKeyframeAnimation(animator: animator), forKey: key)
    }
}
