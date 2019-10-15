//
//  UIView+TranslationAnim.swift
//  KRAnimationKit
//
//  Created by Joshua Park on 15/10/2019.
//

import UIKit
import KRTimingFunction

// MARK: - Translation

public extension UIView {
    
    // MARK: - Animate
    
    @discardableResult
    func animate(
        translationX tx: CGFloat,
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
            property: .translationX,
            endValue: tx,
            duration: duration,
            function: function)
        
        return KRAnimation.animate(
            animDesc,
            reverses: reverses,
            repeatCount: repeatCount,
            completion: completion)
    }
    @discardableResult func animate(translationY ty: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .translationY, endValue: ty, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    @discardableResult func animate(translationZ tz: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .translationZ, endValue: tz, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    @discardableResult func animate(translationX tx: CGFloat, translationY ty: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animate(translation2D: CGSize(width: tx, height: ty), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    @discardableResult func animate(translation2D translation: CGSize, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animate(translation: translation, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }

    @discardableResult func animate(translation: CGSize, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let endValue = NSValue(cgSize: translation)
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .translation, endValue: endValue, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    // MARK: - Chain
    
    func chain(
        translationX tx: CGFloat,
        duration: Double,
        function: FunctionType = .linear)
        -> [AnimationDescriptor]
    {
        return [
            AnimationDescriptor(
                view: self,
                delay: 0.0,
                property: .translationX,
                endValue: tx,
                duration: duration,
                function: function),
        ]
    }
    
    func chain(translationY ty: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .translationY, endValue: ty, duration: duration, function: function)]
    }
    
    func chain(translationZ tz: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .translationZ, endValue: tz, duration: duration, function: function)]
    }
    
    
    func chain(translationX tx: CGFloat, translationY ty: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chain(translation2D: CGSize(width: tx, height: ty), duration: duration, function: function)
    }
    
    func chain(translation2D translation: CGSize, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chain(translation: translation, duration: duration, function: function)
    }
    
    func chain(translation: CGSize, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        let endValue = NSValue(cgSize: translation)
        return [AnimationDescriptor(view: self, delay: 0.0, property: .translation, endValue: endValue, duration: duration, function: function)]
    }
    
}

