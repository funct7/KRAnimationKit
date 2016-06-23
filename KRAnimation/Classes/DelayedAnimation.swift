//
//  DelayedAnimation.swift
//  Pods
//
//  Created by Joshua Park on 6/20/16.
//
//

import UIKit

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
    
    public func animateX(x: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .OriginX, endValue: x, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainX(x: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .OriginX, endValue: x, duration: duration, function: function)]
    }
}
