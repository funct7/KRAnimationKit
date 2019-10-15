//
//  UIView+RotationAnim.swift
//  KRAnimationKit
//
//  Created by Joshua Park on 15/10/2019.
//

import UIKit
import KRTimingFunction

// MARK: - Rotation

public extension UIView {
    
    // MARK: - Animate
    
    @discardableResult
    func animate(
        rotationXDeg degrees: CGFloat,
        duration: Double,
        function: FunctionType = .linear,
        reverses: Bool = false,
        repeatCount: Float = 0.0,
        completion: (() -> Void)? = nil)
        -> String
    {
        return animate(
            rotationXRad: radians(from: degrees),
            duration: duration,
            function: function,
            reverses: reverses,
            repeatCount: repeatCount,
            completion: completion)
    }
    
    @discardableResult
    func animate(
        rotationXRad radians: CGFloat,
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
            property: .rotationX,
            endValue: radians,
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
        rotationYDeg degrees: CGFloat,
        duration: Double,
        function: FunctionType = .linear,
        reverses: Bool = false,
        repeatCount: Float = 0.0,
        completion: (() -> Void)? = nil)
        -> String
    {
        return animate(
            rotationYRad: radians(from: degrees),
            duration: duration,
            function: function,
            reverses: reverses,
            repeatCount: repeatCount,
            completion: completion)
    }
    
    @discardableResult
    func animate(
        rotationYRad radians: CGFloat,
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
            property: .rotationY,
            endValue: radians,
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
        rotationZDeg degrees: CGFloat,
        duration: Double,
        function: FunctionType = .linear,
        reverses: Bool = false,
        repeatCount: Float = 0.0,
        completion: (() -> Void)? = nil)
        -> String
    {
        return animate(
            rotationZRad: radians(from: degrees),
            duration: duration,
            function: function,
            reverses: reverses,
            repeatCount: repeatCount,
            completion: completion)
    }
    
    @discardableResult
    func animate(
        rotationZRad radians: CGFloat,
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
            property: .rotationZ,
            endValue: radians,
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
        rotation2DDeg degrees: CGFloat,
        duration: Double,
        function: FunctionType = .linear,
        reverses: Bool = false,
        repeatCount: Float = 0.0,
        completion: (() -> Void)? = nil)
        -> String
    {
        return animate(
            rotationZDeg: degrees,
            duration: duration,
            function: function,
            reverses: reverses,
            repeatCount: repeatCount,
            completion: completion)
    }
    
    @discardableResult
    func animate(
        rotation2DRad radians: CGFloat,
        duration: Double,
        function: FunctionType = .linear,
        reverses: Bool = false,
        repeatCount: Float = 0.0,
        completion: (() -> Void)? = nil)
        -> String
    {
        return animate(
            rotationZRad: radians,
            duration: duration,
            function: function,
            reverses: reverses,
            repeatCount: repeatCount,
            completion: completion)
    }
    
    @discardableResult
    func animate(
        rotationDeg degrees: CGFloat,
        duration: Double,
        function: FunctionType = .linear,
        reverses: Bool = false,
        repeatCount: Float = 0.0,
        completion: (() -> Void)? = nil)
        -> String
    {
        return animate(
            rotationZDeg: degrees,
            duration: duration,
            function: function,
            reverses: reverses,
            repeatCount: repeatCount,
            completion: completion)
    }
    
    @discardableResult
    func animate(
        rotationRad radians: CGFloat,
        duration: Double,
        function: FunctionType = .linear,
        reverses: Bool = false,
        repeatCount: Float = 0.0,
        completion: (() -> Void)? = nil)
        -> String
    {
        return animate(
            rotationZRad: radians,
            duration: duration,
            function: function,
            reverses: reverses,
            repeatCount: repeatCount,
            completion: completion)
    }


    // MARK: - Chain
    
    func chain(
        rotationXDeg degrees: CGFloat,
        duration: Double,
        function: FunctionType = .linear)
        -> [AnimationDescriptor]
    {
        return chain(rotationXRad: radians(from: degrees), duration: duration, function: function)
    }
    
    func chain(
        rotationXRad radians: CGFloat,
        duration: Double,
        function: FunctionType = .linear)
        -> [AnimationDescriptor]
    {
        return [
            AnimationDescriptor(
                view: self,
                delay: 0.0,
                property: .rotationX,
                endValue: radians,
                duration: duration,
                function: function),
        ]
    }
    
    func chain(
        rotationYDeg degrees: CGFloat,
        duration: Double,
        function: FunctionType = .linear)
        -> [AnimationDescriptor]
    {
        return chain(rotationYRad: radians(from: degrees), duration: duration, function: function)
    }
    
    func chain(
        rotationYRad radians: CGFloat,
        duration: Double,
        function: FunctionType = .linear)
        -> [AnimationDescriptor]
    {
        return [
            AnimationDescriptor(
                view: self,
                delay: 0.0,
                property: .rotationY,
                endValue: radians,
                duration: duration,
                function: function),
        ]
    }
    
    func chain(
        rotationZDeg degrees: CGFloat,
        duration: Double,
        function: FunctionType = .linear)
        -> [AnimationDescriptor]
    {
        return chain(
            rotationZRad: radians(from: degrees),
            duration: duration,
            function: function)
    }
    
    func chain(
        rotationZRad radians: CGFloat,
        duration: Double,
        function: FunctionType = .linear)
        -> [AnimationDescriptor]
    {
        return [
            AnimationDescriptor(
                view: self,
                delay: 0.0,
                property: .rotationZ,
                endValue: radians,
                duration: duration,
                function: function),
        ]
    }
    
    func chain(
        rotation2DDeg degrees: CGFloat,
        duration: Double,
        function: FunctionType = .linear)
        -> [AnimationDescriptor]
    {
        return chain(rotationZDeg: degrees, duration: duration, function: function)
    }
    
    func chain(
        rotation2DRad radians: CGFloat,
        duration: Double,
        function: FunctionType = .linear)
        -> [AnimationDescriptor]
    {
        return chain(rotationZRad: radians, duration: duration, function: function)
    }
    
    
    func chain(
        rotationDeg degrees: CGFloat,
        duration: Double,
        function: FunctionType = .linear)
        -> [AnimationDescriptor]
    {
        return chain(rotationZDeg: degrees, duration: duration, function: function)
    }
    
    func chain(
        rotationRad radians: CGFloat,
        duration: Double,
        function: FunctionType = .linear)
        -> [AnimationDescriptor]
    {
        return chain(rotationZRad: radians, duration: duration, function: function)
    }

}
