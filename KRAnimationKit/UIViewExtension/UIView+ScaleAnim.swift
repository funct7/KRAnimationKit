//
//  UIView+ScaleAnim.swift
//  KRAnimationKit
//
//  Created by Joshua Park on 15/10/2019.
//

import UIKit
import KRTimingFunction

// MARK: - Scale

public extension UIView {
    
    // MARK: - Animate
    
    @discardableResult
    func animate(
        scaleX sx: CGFloat,
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
            property: .scaleX,
            endValue: sx,
            duration: duration,
            function: function)
        
        return KRAnimation.animate(
            animDesc,
            reverses: reverses,
            repeatCount: repeatCount,
            completion: completion)
    }
    
    @discardableResult func animate(scaleY sy: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .scaleY, endValue: sy, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    @discardableResult func animate(scaleX sx: CGFloat, scaleY sy: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        var transform = self.layer.transform
        (transform.m11, transform.m22) = (sx, sy)
        let endValue = NSValue(caTransform3D: transform)
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .scale2D, endValue: endValue, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    @discardableResult func animate(scale2D scale: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animate(scaleX: scale, scaleY: scale, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    @discardableResult func animate(scaleZ sz: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .scaleZ, endValue: sz, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    @discardableResult func animate(scaleX sx: CGFloat, scaleY sy: CGFloat, scaleZ sz: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        var transform = self.layer.transform
        (transform.m11, transform.m22, transform.m33) = (sx, sy, sz)
        let endValue = NSValue(caTransform3D: transform)
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .scale, endValue: endValue, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    @discardableResult func animate(scale: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animate(scaleX: scale, scaleY: scale, scaleZ: scale, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    

    // MARK: - Chain
    
    func chain(
        scaleX sx: CGFloat,
        duration: Double,
        function: FunctionType = .linear)
        -> [AnimationDescriptor]
    {
        return [
            AnimationDescriptor(
                view: self,
                delay: 0.0,
                property: .scaleX,
                endValue: sx,
                duration: duration,
                function: function),
        ]
    }
    
    func chain(scaleY sy: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .scaleY, endValue: sy, duration: duration, function: function)]
    }
    
    func chain(scaleX sx: CGFloat, scaleY sy: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        var transform = self.layer.transform
        (transform.m11, transform.m22) = (sx, sy)
        let endValue = NSValue(caTransform3D: transform)
        
        return [AnimationDescriptor(view: self, delay: 0.0, property: .scale2D, endValue: endValue, duration: duration, function: function)]
    }
    
    func chain(scale2D scale: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chain(scaleX: scale, scaleY: scale, duration: duration, function: function)
    }
    
    func chain(scaleZ sz: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .scaleZ, endValue: sz, duration: duration, function: function)]
    }
    
    func chain(scaleX sx: CGFloat, scaleY sy: CGFloat, scaleZ sz: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        var transform = self.layer.transform
        (transform.m11, transform.m22, transform.m33) = (sx, sy, sz)
        let endValue = NSValue(caTransform3D: transform)
        
        return [AnimationDescriptor(view: self, delay: 0.0, property: .scale, endValue: endValue, duration: duration, function: function)]
    }
    
    func chain(scale: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chain(scaleX: scale, scaleY: scale, scaleZ: scale, duration: duration, function: function)
    }

}
