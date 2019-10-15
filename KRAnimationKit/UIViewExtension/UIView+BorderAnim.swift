//
//  UIView+BorderAnim.swift
//  KRAnimationKit
//
//  Created by Joshua Park on 15/10/2019.
//

import UIKit
import KRTimingFunction

// MARK: - Border

public extension UIView {
    
    // MARK: - Animate
        
    @discardableResult
    func animate(
        borderColor color: CGColor,
        duration: Double,
        function: FunctionType = .linear,
        reverses: Bool = false,
        repeatCount: Float = 0.0,
        completion: (() -> Void)? = nil)
        -> String
    {
        return animate(
            borderColor: color.uiColor,
            duration: duration,
            function: function,
            reverses: reverses,
            repeatCount: repeatCount,
            completion: completion)
    }
    
    @discardableResult
    func animate(
        borderColor color: UIColor,
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
            property: .borderColor,
            endValue: color,
            duration: duration,
            function: function)
        
        return KRAnimation.animate(
            animDesc,
            reverses: reverses,
            repeatCount: repeatCount,
            completion: completion)
    }
    
    @discardableResult
    func animate(
        borderWidth: CGFloat,
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
            property: .borderWidth,
            endValue: borderWidth,
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
        borderColor color: CGColor,
        duration: Double,
        function: FunctionType = .linear)
        -> [AnimationDescriptor]
    {
        return chain(borderColor: color.uiColor, duration: duration, function: function)
    }
    
    func chain(
        borderColor color: UIColor,
        duration: Double,
        function: FunctionType = .linear)
        -> [AnimationDescriptor]
    {
        return [
            AnimationDescriptor(
                view: self,
                delay: 0.0,
                property: .borderColor,
                endValue: color,
                duration: duration,
                function: function),
        ]
    }
    func chain(
        borderWidth: CGFloat,
        duration: Double,
        function: FunctionType = .linear)
        -> [AnimationDescriptor]
    {
        return [
            AnimationDescriptor(
                view: self,
                delay: 0.0,
                property: .borderWidth,
                endValue: borderWidth,
                duration: duration,
                function: function),
        ]
    }

}
