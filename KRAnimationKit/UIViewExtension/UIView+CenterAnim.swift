//
//  UIView+CenterAnim.swift
//  KRAnimationKit
//
//  Created by Joshua Park on 15/10/2019.
//

import UIKit
import KRTimingFunction

// MARK: - Center

public extension UIView {
    
    // MARK: - Animate
    
    @discardableResult
    func animate(
        centerX: CGFloat,
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
            property: .centerX,
            endValue: centerX,
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
        centerY: CGFloat,
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
            property: .centerY,
            endValue: centerY,
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
        centerX: CGFloat,
        centerY: CGFloat,
        duration: Double,
        function: FunctionType = .linear,
        reverses: Bool = false,
        repeatCount: Float = 0.0,
        completion: (() -> Void)? = nil)
        -> String
    {
        return animate(
            center: CGPoint(x: centerX, y: centerY),
            duration: duration,
            function: function,
            reverses: reverses,
            repeatCount: repeatCount,
            completion: completion)
    }
    
    @discardableResult
    func animate(
        center: CGPoint,
        duration: Double,
        function: FunctionType = .linear,
        reverses: Bool = false,
        repeatCount: Float = 0.0,
        completion: (() -> Void)? = nil)
        -> String
    {
        let endValue = NSValue(cgPoint: center)
        let animDesc = AnimationDescriptor(
            view: self,
            delay: 0.0,
            property: .center,
            endValue: endValue,
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
        centerX: CGFloat,
        duration: Double,
        function: FunctionType = .linear)
        -> [AnimationDescriptor]
    {
        return [
            AnimationDescriptor(
                view: self,
                delay: 0.0,
                property: .centerX,
                endValue: centerX,
                duration: duration,
                function: function),
        ]
    }
    
    func chain(
        centerY: CGFloat,
        duration: Double,
        function: FunctionType = .linear)
        -> [AnimationDescriptor]
    {
        return [
            AnimationDescriptor(
                view: self,
                delay: 0.0,
                property: .centerY,
                endValue: centerY,
                duration: duration,
                function: function),
        ]
    }
    
    func chain(
        centerX: CGFloat,
        centerY: CGFloat,
        duration: Double,
        function: FunctionType = .linear)
        -> [AnimationDescriptor]
    {
        return chain(
            center: CGPoint(x: centerX, y: centerY),
            duration: duration,
            function: function)
    }
    
    func chain(
        center: CGPoint,
        duration: Double,
        function: FunctionType = .linear)
        -> [AnimationDescriptor]
    {
        let endValue = NSValue(cgPoint: center)
        return [
            AnimationDescriptor(
                view: self,
                delay: 0.0,
                property: .center,
                endValue: endValue,
                duration: duration,
                function: function),
        ]
    }
    
}
