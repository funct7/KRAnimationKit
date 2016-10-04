//
//  DelayedAnimation.swift
//  Pods
//
//  Created by Joshua Park on 6/20/16.
//
//

import UIKit

public struct DelayedAnimation {
    let view: UIView
    let delay: Double
    
    // MARK: - Origin
    
    public func animateX(_ x: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .originX, endValue: x as AnyObject, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainX(_ x: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .originX, endValue: x as AnyObject, duration: duration, function: function)]
    }
    
    public func animateY(_ y: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .originY, endValue: y as AnyObject, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainY(_ y: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .originY, endValue: y as AnyObject, duration: duration, function: function)]
    }
    
    public func animateOrigin(_ x: CGFloat, _ y: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animateOrigin(CGPoint(x: x, y: y), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func animateOrigin(_ origin: CGPoint, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let endValue = NSValue(cgPoint: origin)
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .origin, endValue: endValue, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainOrigin(_ x: CGFloat, _ y: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chainOrigin(CGPoint(x: x, y: y), duration: duration, function: function)
    }
    
    public func chainOrigin(_ origin: CGPoint, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        let endValue = NSValue(cgPoint: origin)
        return [AnimationDescriptor(view: view, delay: delay, property: .origin, endValue: endValue, duration: duration, function: function)]
    }
    
    // MARK: - Size
    
    public func animateWidth(_ width: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .sizeWidth, endValue: width as AnyObject, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainWidth(_ width: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .sizeWidth, endValue: width as AnyObject, duration: duration, function: function)]
    }
    
    public func animateHeight(_ height: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .sizeHeight, endValue: height as AnyObject, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainHeight(_ height: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .sizeHeight, endValue: height as AnyObject, duration: duration, function: function)]
    }
    
    public func animateSize(_ width: CGFloat, _ height: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animateSize(CGSize(width: width, height: height), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func animateSize(_ size: CGSize, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let endValue = NSValue(cgSize: size)
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .size, endValue: endValue, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainSize(_ width: CGFloat, _ height: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chainSize(CGSize(width: width, height: height), duration: duration, function: function)
    }
    
    public func chainSize(_ size: CGSize, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        let endValue = NSValue(cgSize: size)
        return [AnimationDescriptor(view: view, delay: delay, property: .size, endValue: endValue, duration: duration, function: function)]
    }
    
    // MARK: - Frame
    
    public func animateFrame(_ x: CGFloat, _ y: CGFloat, _ w: CGFloat, _ h: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animateFrame(CGRect(x: x, y: y, width: w, height: h), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func animateFrame(_ origin: CGPoint, _ size: CGSize, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animateFrame(CGRect(origin: origin, size: size), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func animateFrame(_ frame: CGRect, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let endValue = NSValue(cgRect: frame)
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .frame, endValue: endValue, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainFrame(_ x: CGFloat, _ y: CGFloat, _ w: CGFloat, _ h: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chainFrame(CGRect(x: x, y: y, width: w, height: h), duration: duration, function: function)
    }
    
    public func chainFrame(_ origin: CGPoint, _ size: CGSize, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chainFrame(CGRect(origin: origin, size: size), duration: duration, function: function)
    }
    
    public func chainFrame(_ frame: CGRect, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        let endValue = NSValue(cgRect: frame)
        return [AnimationDescriptor(view: view, delay: delay, property: .frame, endValue: endValue, duration: duration, function: function)]
    }
    
    // MARK: - Center
    
    public func animateCenterX(_ x: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .centerX, endValue: x as AnyObject, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainCenterX(_ x: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .centerX, endValue: x as AnyObject, duration: duration, function: function)]
    }
    
    public func animateCenterY(_ y: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .centerY, endValue: y as AnyObject, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainCenterY(_ y: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .centerY, endValue: y as AnyObject, duration: duration, function: function)]
    }
    
    public func animateCenter(_ x: CGFloat, _ y: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animateCenter(CGPoint(x: x, y: y), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func animateCenter(_ center: CGPoint, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let endValue = NSValue(cgPoint: center)
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .center, endValue: endValue, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainCenter(_ x: CGFloat, _ y: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chainCenter(CGPoint(x: x, y: y), duration: duration, function: function)
    }
    
    public func chainCenter(_ center: CGPoint, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        let endValue = NSValue(cgPoint: center)
        return [AnimationDescriptor(view: view, delay: delay, property: .center, endValue: endValue, duration: duration, function: function)]
    }
    
    // MARK: - Position
    
    public func animatePositionX(_ x: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .positionX, endValue: x as AnyObject, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainPositionX(_ x: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .positionX, endValue: x as AnyObject, duration: duration, function: function)]
    }
    
    public func animatePositionY(_ y: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .positionY, endValue: y as AnyObject, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainPositionY(_ y: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .positionY, endValue: y as AnyObject, duration: duration, function: function)]
    }
    
    public func animatePosition(_ x: CGFloat, _ y: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animatePosition(CGPoint(x: x, y: y), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func animatePosition(_ position: CGPoint, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let endValue = NSValue(cgPoint: position)
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .position, endValue: endValue, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainPosition(_ x: CGFloat, _ y: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0) -> [AnimationDescriptor] {
        return chainPosition(CGPoint(x: x, y: y), duration: duration, function: function)
    }
    
    public func chainPosition(_ position: CGPoint, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        let endValue = NSValue(cgPoint: position)
        return [AnimationDescriptor(view: view, delay: delay, property: .position, endValue: endValue, duration: duration, function: function)]
    }
    
    // MARK: - Background color
    
    public func animateBackgroundColor(_ color: CGColor, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animateBackgroundColor(color.getUIColor(), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func animateBackgroundColor(_ color: UIColor, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .backgroundColor, endValue: color, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainBackgroundColor(_ color: CGColor, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chainBackgroundColor(color.getUIColor(), duration: duration, function: function)
    }
    
    public func chainBackgroundColor(_ color: UIColor, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .backgroundColor, endValue: color, duration: duration, function: function)]
    }
    
    // MARK: - Border
    
    public func animateBorderColor(_ color: CGColor, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animateBorderColor(color.getUIColor(), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func animateBorderColor(_ color: UIColor, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .borderColor, endValue: color, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainBorderColor(_ color: CGColor, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chainBorderColor(color.getUIColor(), duration: duration, function: function)
    }
    
    public func chainBorderColor(_ color: UIColor, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .borderColor, endValue: color, duration: duration, function: function)]
    }
    
    public func animateBorderWidth(_ borderWidth: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .borderWidth, endValue: borderWidth as AnyObject, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainBorderWidth(_ borderWidth: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .borderWidth, endValue: borderWidth as AnyObject, duration: duration, function: function)]
    }
    
    // MARK: - Corner radius
    
    public func animateCornerRadius(_ cornerRadius: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .cornerRadius, endValue: cornerRadius as AnyObject, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainCornerRadius(_ cornerRadius: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .cornerRadius, endValue: cornerRadius as AnyObject, duration: duration, function: function)]
    }
    
    // MARK: - Opacity
    
    public func animateOpacity(_ opacity: Float, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .opacity, endValue: opacity as AnyObject, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainOpacity(_ opacity: Float, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .opacity, endValue: opacity as AnyObject, duration: duration, function: function)]
    }
    
    public func animateAlpha(_ alpha: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .alpha, endValue: alpha as AnyObject, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainAlpha(_ alpha: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .alpha, endValue: alpha as AnyObject, duration: duration, function: function)]
    }
    
    // MARK: - Shadow
    
    public func animateShadowColor(_ shadowColor: CGColor, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animateShadowColor(shadowColor.getUIColor(), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func animateShadowColor(_ shadowColor: UIColor, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .shadowColor, endValue: shadowColor, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainShadowColor(_ shadowColor: CGColor, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chainShadowColor(shadowColor.getUIColor(), duration: duration, function: function)
    }
    
    public func chainShadowColor(_ shadowColor: UIColor, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .shadowColor, endValue: shadowColor, duration: duration, function: function)]
    }
    
    public func animateShadowOffset(_ shadowOffset: CGSize, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let endValue = NSValue(cgSize: shadowOffset)
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .shadowOffset, endValue: endValue, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainShadowOffset(_ shadowOffset: CGSize, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        let endValue = NSValue(cgSize: shadowOffset)
        return [AnimationDescriptor(view: view, delay: delay, property: .shadowOffset, endValue: endValue, duration: duration, function: function)]
    }
    
    public func animateShadowOpacity(_ shadowOpacity: Float, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .shadowOpacity, endValue: shadowOpacity as AnyObject, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainShadowOpacity(_ shadowOpacity: Float, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .shadowOpacity, endValue: shadowOpacity as AnyObject, duration: duration, function: function)]
    }
    
    // TODO: Implementation for shadow path
    
    public func animateShadowRadius(_ shadowRadius: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .shadowRadius, endValue: shadowRadius as AnyObject, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainShadowRadius(_ shadowRadius: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .shadowRadius, endValue: shadowRadius as AnyObject, duration: duration, function: function)]
    }
    
    
    // MARK: - Transform
    
    // TODO: Implement transform animation
    
    // MARK: - Rotation
    
    public func animateRotationX(degree: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animateRotationX(radian: degreeToRadian(degree), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func animateRotationX(radian: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .rotationX, endValue: radian as AnyObject, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainRotationX(degree: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chainRotationX(radian: degreeToRadian(degree), duration: duration, function: function)
    }
    
    public func chainRotationX(radian: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .rotationX, endValue: radian as AnyObject, duration: duration, function: function)]
    }
    
    public func animateRotationY(degree: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animateRotationY(radian: degreeToRadian(degree), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func animateRotationY(radian: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .rotationY, endValue: radian as AnyObject, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainRotationY(degree: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chainRotationY(radian: degreeToRadian(degree), duration: duration, function: function)
    }
    
    public func chainRotationY(radian: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .rotationY, endValue: radian as AnyObject, duration: duration, function: function)]
    }
    
    public func animateRotationZ(degree: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animateRotationZ(radian: degreeToRadian(degree), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func animateRotationZ(radian: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .rotationZ, endValue: radian as AnyObject, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainRotationZ(degree: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chainRotationZ(radian: degreeToRadian(degree), duration: duration, function: function)
    }
    
    public func chainRotationZ(radian: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .rotationZ, endValue: radian as AnyObject, duration: duration, function: function)]
    }
    
    public func animateRotation2D(degree: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animateRotationZ(degree: degree, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func animateRotation2D(radian: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animateRotationZ(radian: radian, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainRotation2D(degree: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chainRotationZ(degree: degree, duration: duration, function: function)
    }
    
    public func chainRotation2D(radian: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chainRotationZ(radian: radian, duration: duration, function: function)
    }
    
    public func animateRotation(degree: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animateRotationZ(degree: degree, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func animateRotation(radian: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animateRotationZ(radian: radian, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainRotation(degree: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chainRotationZ(degree: degree, duration: duration, function: function)
    }
    
    public func chainRotation(radian: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chainRotationZ(radian: radian, duration: duration, function: function)
    }
    
    // MARK: - Scale
    
    public func animateScaleX(_ sx: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .scaleX, endValue: sx as AnyObject, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainScaleX(_ sx: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .scaleX, endValue: sx as AnyObject, duration: duration, function: function)]
    }
    
    public func animateScaleY(_ sy: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .scaleY, endValue: sy as AnyObject, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainScaleY(_ sy: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .scaleY, endValue: sy as AnyObject, duration: duration, function: function)]
    }
    
    public func animateScale2D(_ sx: CGFloat, _ sy: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        var transform = view.layer.transform
        (transform.m11, transform.m22) = (sx, sy)
        let endValue = NSValue(caTransform3D: transform)
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .scale2D, endValue: endValue, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func animateScale2D(_ scale: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animateScale2D(scale, scale, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainScale2D(_ sx: CGFloat, _ sy: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        var transform = view.layer.transform
        (transform.m11, transform.m22) = (sx, sy)
        let endValue = NSValue(caTransform3D: transform)
        
        return [AnimationDescriptor(view: view, delay: delay, property: .scale2D, endValue: endValue, duration: duration, function: function)]
    }
    
    public func chainScale2D(_ scale: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chainScale2D(scale, scale, duration: duration, function: function)
    }
    
    public func animateScaleZ(_ sz: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .scaleZ, endValue: sz as AnyObject, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainScaleZ(_ sz: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .scaleZ, endValue: sz as AnyObject, duration: duration, function: function)]
    }
    
    public func animateScale(_ sx: CGFloat, _ sy: CGFloat, _ sz: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        var transform = view.layer.transform
        (transform.m11, transform.m22, transform.m33) = (sx, sy, sz)
        let endValue = NSValue(caTransform3D: transform)
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .scale, endValue: endValue, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func animateScale(_ scale: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animateScale(scale, scale, scale, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainScale(_ sx: CGFloat, _ sy: CGFloat, _ sz: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        var transform = view.layer.transform
        (transform.m11, transform.m22, transform.m33) = (sx, sy, sz)
        let endValue = NSValue(caTransform3D: transform)
        
        return [AnimationDescriptor(view: view, delay: delay, property: .scale, endValue: endValue, duration: duration, function: function)]
    }
    
    public func chainScale(_ scale: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chainScale(scale, scale, scale, duration: duration, function: function)
    }
    
    // MARK: - Translation
    
    public func animateTranslationX(_ tx: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .translationX, endValue: tx as AnyObject, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainTranslationX(_ tx: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .translationX, endValue: tx as AnyObject, duration: duration, function: function)]
    }
    
    public func animateTranslationY(_ ty: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .translationY, endValue: ty as AnyObject, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainTranslationY(_ ty: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .translationY, endValue: ty as AnyObject, duration: duration, function: function)]
    }
    
    public func animateTranslationZ(_ tz: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .translationZ, endValue: tz as AnyObject, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainTranslationZ(_ tz: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .translationZ, endValue: tz as AnyObject, duration: duration, function: function)]
    }
    
    public func animateTranslation2D(_ tx: CGFloat, ty: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animateTranslation2D(CGSize(width: tx, height: ty), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func animateTranslation2D(_ translation: CGSize, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let endValue = NSValue(cgSize: translation)
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .translation, endValue: endValue, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainTranslation2D(_ tx: CGFloat, ty: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chainTranslation2D(CGSize(width: tx, height: ty), duration: duration, function: function)
    }
    
    public func chainTranslation2D(_ translation: CGSize, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        let endValue = NSValue(cgSize: translation)
        return [AnimationDescriptor(view: view, delay: delay, property: .translation, endValue: endValue, duration: duration, function: function)]
    }
    
    public func animateTranslation(_ tx: CGFloat, ty: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animateTranslation(CGSize(width: tx, height: ty), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func animateTranslation(_ translation: CGSize, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let endValue = NSValue(cgSize: translation)
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .translation, endValue: endValue, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainTranslation(_ tx: CGFloat, ty: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chainTranslation(CGSize(width: tx, height: ty), duration: duration, function: function)
    }
    
    public func chainTranslation(_ translation: CGSize, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        let endValue = NSValue(cgSize: translation)
        return [AnimationDescriptor(view: view, delay: delay, property: .translation, endValue: endValue, duration: duration, function: function)]
    }
    
    // MARK: - Z Position
    
    
}
