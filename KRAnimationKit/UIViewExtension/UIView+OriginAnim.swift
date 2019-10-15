//
//  UIView+OriginAnim.swift
//  KRAnimationKit
//
//  Created by Joshua Park on 15/10/2019.
//

import UIKit
import KRTimingFunction

// MARK: - Origin

public extension UIView {
    
    // MARK: - Animate
    
    @discardableResult
    func animate(
        x: CGFloat,
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
            property: .originX,
            endValue: x,
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
        y: CGFloat,
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
            property: .originY,
            endValue: y,
            duration: duration,
            function: function)
        
        return KRAnimation.animate(
            animDesc,
            reverses: reverses,
            repeatCount: repeatCount,
            completion: completion)
    }

    @discardableResult
    func animateOrigin(
        _ x: CGFloat,
        _ y: CGFloat,
        duration: Double,
        function: FunctionType = .linear,
        reverses: Bool = false,
        repeatCount: Float = 0.0,
        completion: (() -> Void)? = nil)
        -> String
    {
        return animate(
            origin: CGPoint(x: x, y: y),
            duration: duration,
            function: function,
            reverses: reverses,
            repeatCount: repeatCount,
            completion: completion)
    }
    
    @discardableResult
    func animate(
        origin: CGPoint,
        duration: Double,
        function: FunctionType = .linear,
        reverses: Bool = false,
        repeatCount: Float = 0.0,
        completion: (() -> Void)? = nil)
        -> String
    {
        let endValue = NSValue(cgPoint: origin)
        let animDesc = AnimationDescriptor(
            view: self,
            delay: 0.0,
            property: .origin,
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
        x: CGFloat,
        duration: Double,
        function: FunctionType = .linear)
        -> [AnimationDescriptor]
    {
        return [
            AnimationDescriptor(
                view: self,
                delay: 0.0,
                property: .originX,
                endValue: x,
                duration: duration,
                function: function),
        ]
    }
    
    func chain(
        y: CGFloat,
        duration: Double,
        function: FunctionType = .linear)
        -> [AnimationDescriptor]
    {
        return [
            AnimationDescriptor(
                view: self,
                delay: 0.0,
                property: .originY,
                endValue: y,
                duration: duration,
                function: function),
        ]
    }
    
    func chain(
        x: CGFloat,
        y: CGFloat,
        duration: Double,
        function: FunctionType = .linear)
        -> [AnimationDescriptor]
    {
        return chain(origin: CGPoint(x: x, y: y), duration: duration, function: function)
    }
    
    func chain(
        origin: CGPoint,
        duration: Double,
        function: FunctionType = .linear)
        -> [AnimationDescriptor]
    {
        let endValue = NSValue(cgPoint: origin)
        return [
            AnimationDescriptor(
                view: self,
                delay: 0.0,
                property: .origin,
                endValue: endValue,
                duration: duration,
                function: function),
        ]
    }
    
}
