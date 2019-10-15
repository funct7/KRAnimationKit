//
//  UIView+ShadowAnim.swift
//  KRAnimationKit
//
//  Created by Joshua Park on 15/10/2019.
//

import UIKit
import KRTimingFunction

// MARK: - Shadow

// TODO: Implementation for shadow path
public extension UIView {
    
    // MARK: - Animate
    
    @discardableResult
    func animate(
        shadowColor: CGColor,
        duration: Double,
        function: FunctionType = .linear,
        reverses: Bool = false,
        repeatCount: Float = 0.0,
        completion: (() -> Void)? = nil)
        -> String
    {
        return animate(
            shadowColor: shadowColor.uiColor,
            duration: duration,
            function: function,
            reverses: reverses,
            repeatCount: repeatCount,
            completion: completion)
    }
    
    @discardableResult
    func animate(
        shadowColor: UIColor,
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
            property: .shadowColor,
            endValue: shadowColor,
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
        shadowOffset: CGSize,
        duration: Double,
        function: FunctionType = .linear,
        reverses: Bool = false,
        repeatCount: Float = 0.0,
        completion: (() -> Void)? = nil)
        -> String
    {
        let endValue = NSValue(cgSize: shadowOffset)
        let animDesc = AnimationDescriptor(
            view: self,
            delay: 0.0,
            property: .shadowOffset,
            endValue: endValue,
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
        shadowOpacity: Float,
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
            property: .shadowOpacity,
            endValue: shadowOpacity,
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
        shadowRadius: CGFloat,
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
            property: .shadowRadius,
            endValue: shadowRadius,
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
        shadowColor: CGColor,
        duration: Double,
        function: FunctionType = .linear)
        -> [AnimationDescriptor]
    {
        return chain(shadowColor: shadowColor.uiColor, duration: duration, function: function)
    }
    
    func chain(
        shadowColor: UIColor,
        duration: Double,
        function: FunctionType = .linear)
        -> [AnimationDescriptor]
    {
        return [
            AnimationDescriptor(
                view: self,
                delay: 0.0,
                property: .shadowColor,
                endValue: shadowColor,
                duration: duration,
                function: function),
        ]
    }
    
    func chain(
        shadowOffset: CGSize,
        duration: Double,
        function: FunctionType = .linear)
        -> [AnimationDescriptor]
    {
        let endValue = NSValue(cgSize: shadowOffset)
        return [
            AnimationDescriptor(
                view: self,
                delay: 0.0,
                property: .shadowOffset,
                endValue: endValue,
                duration: duration,
                function: function),
        ]
    }
    
    func chain(
        shadowOpacity: Float,
        duration: Double,
        function: FunctionType = .linear)
        -> [AnimationDescriptor]
    {
        return [
            AnimationDescriptor(
                view: self,
                delay: 0.0,
                property: .shadowOpacity,
                endValue: shadowOpacity,
                duration: duration,
                function: function),
        ]
    }
    
    func chain(
        shadowRadius: CGFloat,
        duration: Double,
        function: FunctionType = .linear)
        -> [AnimationDescriptor]
    {
        return [
            AnimationDescriptor(
                view: self,
                delay: 0.0,
                property: .shadowRadius,
                endValue: shadowRadius,
                duration: duration,
                function: function),
        ]
    }

}
