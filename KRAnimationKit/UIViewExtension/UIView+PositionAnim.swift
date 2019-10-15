//
//  UIView+PositionAnim.swift
//  KRAnimationKit
//
//  Created by Joshua Park on 15/10/2019.
//

import UIKit
import KRTimingFunction

// MARK: - Position

public extension UIView {
    
    // MARK: - Animate
    
    @discardableResult
    func animate(
        positionX: CGFloat,
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
            property: .positionX,
            endValue: positionX,
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
        positionY: CGFloat,
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
            property: .positionY,
            endValue: positionY,
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
        positionX: CGFloat,
        positionY: CGFloat,
        duration: Double,
        function: FunctionType = .linear,
        reverses: Bool = false,
        repeatCount: Float = 0.0,
        completion: (() -> Void)? = nil)
        -> String
    {
        return animate(
            position: CGPoint(x: positionX, y: positionY),
            duration: duration,
            function: function,
            reverses: reverses,
            repeatCount: repeatCount,
            completion: completion)
    }
    
    @discardableResult
    func animate(
        position: CGPoint,
        duration: Double,
        function: FunctionType = .linear,
        reverses: Bool = false,
        repeatCount: Float = 0.0,
        completion: (() -> Void)? = nil)
        -> String
    {
        let endValue = NSValue(cgPoint: position)
        let animDesc = AnimationDescriptor(
            view: self,
            delay: 0.0,
            property: .position,
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
        positionX: CGFloat,
        duration: Double,
        function: FunctionType = .linear)
        -> [AnimationDescriptor]
    {
        return [
            AnimationDescriptor(
                view: self,
                delay: 0.0,
                property: .positionX,
                endValue: positionX,
                duration: duration,
                function: function),
        ]
    }
    
    func chain(
        positionY: CGFloat,
        duration: Double,
        function: FunctionType = .linear)
        -> [AnimationDescriptor]
    {
        return [
            AnimationDescriptor(
                view: self,
                delay: 0.0,
                property: .positionY,
                endValue: positionY,
                duration: duration,
                function: function),
        ]
    }
    
    
    func chain(
        positionX: CGFloat,
        positionY: CGFloat,
        duration: Double,
        function: FunctionType = .linear,
        reverses: Bool = false,
        repeatCount: Float = 0.0)
        -> [AnimationDescriptor]
    {
        return chain(
            position: CGPoint(x: positionX, y: positionY),
            duration: duration,
            function: function)
    }
    
    func chain(
        position: CGPoint,
        duration: Double,
        function: FunctionType = .linear)
        -> [AnimationDescriptor]
    {
        let endValue = NSValue(cgPoint: position)
        return [
            AnimationDescriptor(
                view: self,
                delay: 0.0,
                property: .position,
                endValue: endValue,
                duration: duration,
                function: function),
        ]
    }

}
