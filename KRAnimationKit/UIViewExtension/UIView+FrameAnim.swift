//
//  UIView+FrameAnim.swift
//  KRAnimationKit
//
//  Created by Joshua Park on 15/10/2019.
//

import UIKit
import KRTimingFunction

// MARK: - Frame

public extension UIView {
    
    // MARK: - Animate
    
    @discardableResult
    func animate(
        x: CGFloat,
        y: CGFloat,
        w: CGFloat,
        h: CGFloat,
        duration: Double,
        function: FunctionType = .linear,
        reverses: Bool = false,
        repeatCount: Float = 0.0,
        completion: (() -> Void)? = nil)
        -> String
    {
        return animate(
            frame: CGRect(x: x, y: y, width: w, height: h),
            duration: duration,
            function: function,
            reverses: reverses,
            repeatCount: repeatCount,
            completion: completion)
    }
    
    @discardableResult
    func animate(
        origin: CGPoint,
        size: CGSize,
        duration: Double,
        function: FunctionType = .linear,
        reverses: Bool = false,
        repeatCount: Float = 0.0,
        completion: (() -> Void)? = nil)
        -> String
    {
        return animate(
            frame: CGRect(origin: origin, size: size),
            duration: duration,
            function: function,
            reverses: reverses,
            repeatCount: repeatCount,
            completion: completion)
    }
    
    @discardableResult
    func animate(
        frame: CGRect,
        duration: Double,
        function: FunctionType = .linear,
        reverses: Bool = false,
        repeatCount: Float = 0.0,
        completion: (() -> Void)? = nil)
        -> String
    {
        let endValue = NSValue(cgRect: frame)
        let animDesc = AnimationDescriptor(
            view: self,
            delay: 0.0,
            property: .frame,
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
        y: CGFloat,
        w: CGFloat,
        h: CGFloat,
        duration: Double,
        function: FunctionType = .linear)
        -> [AnimationDescriptor]
    {
        return chain(
            frame: CGRect(x: x, y: y, width: w, height: h),
            duration: duration,
            function: function)
    }
    
    func chain(
        origin: CGPoint,
        size: CGSize,
        duration: Double,
        function: FunctionType = .linear)
        -> [AnimationDescriptor]
    {
        return chain(
            frame: CGRect(origin: origin, size: size),
            duration: duration,
            function: function)
    }
    
    func chain(
        frame: CGRect,
        duration: Double,
        function: FunctionType = .linear)
        -> [AnimationDescriptor]
    {
        let endValue = NSValue(cgRect: frame)
        return [
            AnimationDescriptor(
                view: self,
                delay: 0.0,
                property: .frame,
                endValue: endValue,
                duration: duration,
                function: function),
        ]
    }

}
