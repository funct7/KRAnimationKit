//
//  UIView+Animation.swift
//  Pods
//
//  Created by Joshua Park on 6/20/16.
//
//

import UIKit
import KRTimingFunction

public extension UIView {
    
    // MARK: - Origin
    
    @discardableResult public func animate(x: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .originX, endValue: x, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chain(x: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .originX, endValue: x, duration: duration, function: function)]
    }
    
    @discardableResult public func animate(y: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .originY, endValue: y, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chain(y: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .originY, endValue: y, duration: duration, function: function)]
    }
    
    @discardableResult public func animateOrigin(_ x: CGFloat, _ y: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animate(origin: CGPoint(x: x, y: y), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    @discardableResult public func animate(origin: CGPoint, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let endValue = NSValue(cgPoint: origin)
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .origin, endValue: endValue, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chain(x: CGFloat, y: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chain(origin: CGPoint(x: x, y: y), duration: duration, function: function)
    }
    
    public func chain(origin: CGPoint, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        let endValue = NSValue(cgPoint: origin)
        return [AnimationDescriptor(view: self, delay: 0.0, property: .origin, endValue: endValue, duration: duration, function: function)]
    }
    
    // MARK: - Size
    
    @discardableResult public func animate(width: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .sizeWidth, endValue: width, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chain(width: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .sizeWidth, endValue: width, duration: duration, function: function)]
    }
    
    @discardableResult public func animate(height: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .sizeHeight, endValue: height, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chain(height: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .sizeHeight, endValue: height, duration: duration, function: function)]
    }
    
    @discardableResult public func animate(width: CGFloat, height: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animate(size: CGSize(width: width, height: height), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    @discardableResult public func animate(size: CGSize, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let endValue = NSValue(cgSize: size)
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .size, endValue: endValue, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chain(width: CGFloat, height: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chain(size: CGSize(width: width, height: height), duration: duration, function: function)
    }
    
    public func chain(size: CGSize, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        let endValue = NSValue(cgSize: size)
        return [AnimationDescriptor(view: self, delay: 0.0, property: .size, endValue: endValue, duration: duration, function: function)]
    }
    
    // MARK: - Frame
    
    @discardableResult public func animate(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animate(frame: CGRect(x: x, y: y, width: w, height: h), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    @discardableResult public func animate(origin: CGPoint, size: CGSize, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animate(frame: CGRect(origin: origin, size: size), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    @discardableResult public func animate(frame: CGRect, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let endValue = NSValue(cgRect: frame)
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .frame, endValue: endValue, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chain(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chain(frame: CGRect(x: x, y: y, width: w, height: h), duration: duration, function: function)
    }
    
    public func chain(origin: CGPoint, size: CGSize, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chain(frame: CGRect(origin: origin, size: size), duration: duration, function: function)
    }
    
    public func chain(frame: CGRect, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        let endValue = NSValue(cgRect: frame)
        return [AnimationDescriptor(view: self, delay: 0.0, property: .frame, endValue: endValue, duration: duration, function: function)]
    }
    
    // MARK: - Center
    
    @discardableResult public func animate(centerX: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .centerX, endValue: centerX, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chain(centerX: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .centerX, endValue: centerX, duration: duration, function: function)]
    }
    
    @discardableResult public func animate(centerY: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .centerY, endValue: centerY, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chain(centerY: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .centerY, endValue: centerY, duration: duration, function: function)]
    }
    
    @discardableResult public func animate(centerX: CGFloat, centerY: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animate(center: CGPoint(x: centerX, y: centerY), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    @discardableResult public func animate(center: CGPoint, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let endValue = NSValue(cgPoint: center)
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .center, endValue: endValue, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chain(centerX: CGFloat, centerY: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chain(center: CGPoint(x: centerX, y: centerY), duration: duration, function: function)
    }
    
    public func chain(center: CGPoint, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        let endValue = NSValue(cgPoint: center)
        return [AnimationDescriptor(view: self, delay: 0.0, property: .center, endValue: endValue, duration: duration, function: function)]
    }
    
    // MARK: - Position
    
    @discardableResult public func animate(positionX: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .positionX, endValue: positionX, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chain(positionX: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .positionX, endValue: positionX, duration: duration, function: function)]
    }
    
    @discardableResult public func animate(positionY: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .positionY, endValue: positionY, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chain(positionY: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .positionY, endValue: positionY, duration: duration, function: function)]
    }
    
    @discardableResult public func animate(positionX: CGFloat, positionY: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animate(position: CGPoint(x: positionX, y: positionY), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    @discardableResult public func animate(position: CGPoint, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let endValue = NSValue(cgPoint: position)
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .position, endValue: endValue, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chain(positionX: CGFloat, positionY: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0) -> [AnimationDescriptor] {
        return chain(position: CGPoint(x: positionX, y: positionY), duration: duration, function: function)
    }
    
    public func chain(position: CGPoint, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        let endValue = NSValue(cgPoint: position)
        return [AnimationDescriptor(view: self, delay: 0.0, property: .position, endValue: endValue, duration: duration, function: function)]
    }
    
    // MARK: - Background color
    
    @discardableResult public func animate(backgroundColor color: CGColor, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animate(backgroundColor: color.uiColor, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    @discardableResult public func animate(backgroundColor color: UIColor, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .backgroundColor, endValue: color, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chain(backgroundColor color: CGColor, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chain(backgroundColor: color.uiColor, duration: duration, function: function)
    }
    
    public func chain(backgroundColor color: UIColor, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .backgroundColor, endValue: color, duration: duration, function: function)]
    }
    
    // MARK: - Border
    
    @discardableResult public func animate(borderColor color: CGColor, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animate(borderColor: color.uiColor, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    @discardableResult public func animate(borderColor color: UIColor, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .borderColor, endValue: color, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chain(borderColor color: CGColor, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chain(borderColor: color.uiColor, duration: duration, function: function)
    }
    
    public func chain(borderColor color: UIColor, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .borderColor, endValue: color, duration: duration, function: function)]
    }
    
    @discardableResult public func animate(borderWidth: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .borderWidth, endValue: borderWidth, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chain(borderWidth: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .borderWidth, endValue: borderWidth, duration: duration, function: function)]
    }
    
    // MARK: - Corner radius
    
    @discardableResult public func animate(cornerRadius: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .cornerRadius, endValue: cornerRadius, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chain(cornerRadius: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .cornerRadius, endValue: cornerRadius, duration: duration, function: function)]
    }
    
    // MARK: - Opacity
    
    @discardableResult public func animate(opacity: Float, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .opacity, endValue: opacity, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chain(opacity: Float, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .opacity, endValue: opacity, duration: duration, function: function)]
    }
    
    @discardableResult public func animate(alpha: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .alpha, endValue: alpha, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chain(alpha: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .alpha, endValue: alpha, duration: duration, function: function)]
    }
    
    // MARK: - Shadow
    
    @discardableResult public func animate(shadowColor: CGColor, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animate(shadowColor: shadowColor.uiColor, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    @discardableResult public func animate(shadowColor: UIColor, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .shadowColor, endValue: shadowColor, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chain(shadowColor: CGColor, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chain(shadowColor: shadowColor.uiColor, duration: duration, function: function)
    }
    
    public func chain(shadowColor: UIColor, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .shadowColor, endValue: shadowColor, duration: duration, function: function)]
    }
    
    @discardableResult public func animate(shadowOffset: CGSize, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let endValue = NSValue(cgSize: shadowOffset)
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .shadowOffset, endValue: endValue, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }

    public func chain(shadowOffset: CGSize, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        let endValue = NSValue(cgSize: shadowOffset)
        return [AnimationDescriptor(view: self, delay: 0.0, property: .shadowOffset, endValue: endValue, duration: duration, function: function)]
    }
    
    @discardableResult public func animate(shadowOpacity: Float, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .shadowOpacity, endValue: shadowOpacity, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chain(shadowOpacity: Float, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .shadowOpacity, endValue: shadowOpacity, duration: duration, function: function)]
    }
    
    // TODO: Implementation for shadow path
    
    @discardableResult public func animate(shadowRadius: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .shadowRadius, endValue: shadowRadius, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chain(shadowRadius: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .shadowRadius, endValue: shadowRadius, duration: duration, function: function)]
    }


    // MARK: - Transform
    
    // TODO: Implement transform animation
    
    // MARK: - Rotation
    
    @discardableResult public func animate(rotationXDeg degrees: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animate(rotationXRad: radians(from: degrees), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    @discardableResult public func animate(rotationXRad radians: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .rotationX, endValue: radians, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chain(rotationXDeg degrees: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chain(rotationXRad: radians(from: degrees), duration: duration, function: function)
    }
    
    public func chain(rotationXRad radians: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .rotationX, endValue: radians, duration: duration, function: function)]
    }
    
    @discardableResult public func animate(rotationYDeg degrees: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animate(rotationYRad: radians(from: degrees), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    @discardableResult public func animate(rotationYRad radians: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .rotationY, endValue: radians, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chain(rotationYDeg degrees: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chain(rotationYRad: radians(from: degrees), duration: duration, function: function)
    }
    
    public func chain(rotationYRad radians: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .rotationY, endValue: radians, duration: duration, function: function)]
    }
    
    @discardableResult public func animate(rotationZDeg degrees: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animate(rotationZRad: radians(from: degrees), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    @discardableResult public func animate(rotationZRad radians: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .rotationZ, endValue: radians, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chain(rotationZDeg degrees: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chain(rotationZRad: radians(from: degrees), duration: duration, function: function)
    }
    
    public func chain(rotationZRad radians: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .rotationZ, endValue: radians, duration: duration, function: function)]
    }
    
    @discardableResult public func animate(rotation2DDeg degrees: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animate(rotationZDeg: degrees, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    @discardableResult public func animate(rotation2DRad radians: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animate(rotationZRad: radians, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chain(rotation2DDeg degrees: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chain(rotationZDeg: degrees, duration: duration, function: function)
    }
    
    public func chain(rotation2DRad radians: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chain(rotationZRad: radians, duration: duration, function: function)
    }
    
    @discardableResult public func animate(rotationDeg degrees: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animate(rotationZDeg: degrees, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    @discardableResult public func animate(rotationRad radians: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animate(rotationZRad: radians, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chain(rotationDeg degrees: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chain(rotationZDeg: degrees, duration: duration, function: function)
    }
    
    public func chain(rotationRad radians: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chain(rotationZRad: radians, duration: duration, function: function)
    }
    
    // MARK: - Scale
    
    @discardableResult public func animate(scaleX sx: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .scaleX, endValue: sx, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chain(scaleX sx: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .scaleX, endValue: sx, duration: duration, function: function)]
    }
    
    @discardableResult public func animate(scaleY sy: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .scaleY, endValue: sy, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chain(scaleY sy: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .scaleY, endValue: sy, duration: duration, function: function)]
    }
    
    @discardableResult public func animate(scaleX sx: CGFloat, scaleY sy: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        var transform = self.layer.transform
        (transform.m11, transform.m22) = (sx, sy)
        let endValue = NSValue(caTransform3D: transform)
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .scale2D, endValue: endValue, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    @discardableResult public func animate(scale2D scale: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animate(scaleX: scale, scaleY: scale, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chain(scaleX sx: CGFloat, scaleY sy: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        var transform = self.layer.transform
        (transform.m11, transform.m22) = (sx, sy)
        let endValue = NSValue(caTransform3D: transform)
        
        return [AnimationDescriptor(view: self, delay: 0.0, property: .scale2D, endValue: endValue, duration: duration, function: function)]
    }
    
    public func chain(scale2D scale: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chain(scaleX: scale, scaleY: scale, duration: duration, function: function)
    }
    
    @discardableResult public func animate(scaleZ sz: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .scaleZ, endValue: sz, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chain(scaleZ sz: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .scaleZ, endValue: sz, duration: duration, function: function)]
    }
    
    @discardableResult public func animate(scaleX sx: CGFloat, scaleY sy: CGFloat, scaleZ sz: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        var transform = self.layer.transform
        (transform.m11, transform.m22, transform.m33) = (sx, sy, sz)
        let endValue = NSValue(caTransform3D: transform)
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .scale, endValue: endValue, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    @discardableResult public func animate(scale: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animate(scaleX: scale, scaleY: scale, scaleZ: scale, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chain(scaleX sx: CGFloat, scaleY sy: CGFloat, scaleZ sz: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        var transform = self.layer.transform
        (transform.m11, transform.m22, transform.m33) = (sx, sy, sz)
        let endValue = NSValue(caTransform3D: transform)
        
        return [AnimationDescriptor(view: self, delay: 0.0, property: .scale, endValue: endValue, duration: duration, function: function)]
    }
    
    public func chain(scale: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chain(scaleX: scale, scaleY: scale, scaleZ: scale, duration: duration, function: function)
    }
    
    // MARK: - Translation
    
    @discardableResult public func animate(translationX tx: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .translationX, endValue: tx, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chain(translationX tx: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .translationX, endValue: tx, duration: duration, function: function)]
    }
    
    @discardableResult public func animate(translationY ty: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .translationY, endValue: ty, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chain(translationY ty: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .translationY, endValue: ty, duration: duration, function: function)]
    }
    
    @discardableResult public func animate(translationZ tz: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .translationZ, endValue: tz, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chain(translationZ tz: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .translationZ, endValue: tz, duration: duration, function: function)]
    }
    
    @discardableResult public func animate(translationX tx: CGFloat, translationY ty: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animate(translation2D: CGSize(width: tx, height: ty), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    @discardableResult public func animate(translation2D translation: CGSize, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animate(translation: translation, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chain(translationX tx: CGFloat, translationY ty: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chain(translation2D: CGSize(width: tx, height: ty), duration: duration, function: function)
    }
    
    public func chain(translation2D translation: CGSize, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chain(translation: translation, duration: duration, function: function)
    }
    
    @discardableResult public func animate(translation: CGSize, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let endValue = NSValue(cgSize: translation)
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .translation, endValue: endValue, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chain(translation: CGSize, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        let endValue = NSValue(cgSize: translation)
        return [AnimationDescriptor(view: self, delay: 0.0, property: .translation, endValue: endValue, duration: duration, function: function)]
    }
    
    // MARK: - Z Position
    
    
    
    
    
    // MARK: - Delayed animation
    
    public func after(_ delay: Double) -> DelayedAnimation {
        return DelayedAnimation(view: self, delay: delay)
    }
    
}
