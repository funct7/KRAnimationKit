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
    
    public func animateX(x: CGFloat, duration: Double, function: FunctionType, reverses: Bool = false, repeatCount: Float = 0.0, nextAnimation: (() -> [CAAnimation])? = nil) {
        KRAnimation.animateView(view, property: .OriginX, endValue: x, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, nextAnimation: nextAnimation)
    }
    
    public func chainX(x: CGFloat, duration: Double, function: FunctionType, nextAnimation: (() -> [CAAnimation])? = nil) -> [CAAnimation] {
        return KRAnimation.chainView(view, property: .OriginX, endValue: x, duration: duration, function: function, nextAnimation: nextAnimation)
    }
}
