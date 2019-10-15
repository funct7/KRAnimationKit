//
//  UIView+CornerRadiusAnim.swift
//  KRAnimationKit
//
//  Created by Joshua Park on 15/10/2019.
//

import UIKit
import KRTimingFunction

// MARK: - Corner radius

public extension UIView {
    
    // MARK: - Animate

    @discardableResult
    func animate(
        cornerRadius: CGFloat,
        duration: Double,
        function: FunctionType = .linear,
        reverses: Bool = false,
        repeatCount: Float = 0.0,
        completion: (() -> Void)? = nil)
        -> String
    {
        let animDesc = AnimationDescriptor(
            view: self,
            delay: 0.0,
            property: .cornerRadius,
            endValue: cornerRadius,
            duration: duration,
            function: function)
        
        return KRAnimation.animate(
            animDesc,
            reverses: reverses,
            repeatCount: repeatCount,
            completion: completion)
    }
    
    // MARK: - Chain
    
    func chain(
        cornerRadius: CGFloat,
        duration: Double,
        function: FunctionType = .linear)
        -> [AnimationDescriptor]
    {
        return [
            AnimationDescriptor(
                view: self,
                delay: 0.0,
                property: .cornerRadius,
                endValue: cornerRadius,
                duration: duration,
                function: function),
        ]
    }
    
}
