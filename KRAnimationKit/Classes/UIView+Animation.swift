//
//  UIView+Animation.swift
//  Pods
//
//  Created by Joshua Park on 6/20/16.
//
//

import UIKit

public extension UIView {
    // MARK: - Origin
    
    func animateX(_ x: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .originX, endValue: x as AnyObject, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainX(_ x: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .originX, endValue: x as AnyObject, duration: duration, function: function)]
    }
    
    func animateY(_ y: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .originY, endValue: y as AnyObject, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainY(_ y: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .originY, endValue: y as AnyObject, duration: duration, function: function)]
    }
    
    func animateOrigin(_ x: CGFloat, _ y: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animateOrigin(CGPoint(x: x, y: y), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func animateOrigin(_ origin: CGPoint, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let endValue = NSValue(cgPoint: origin)
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .origin, endValue: endValue, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainOrigin(_ x: CGFloat, _ y: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chainOrigin(CGPoint(x: x, y: y), duration: duration, function: function)
    }
    
    func chainOrigin(_ origin: CGPoint, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        let endValue = NSValue(cgPoint: origin)
        return [AnimationDescriptor(view: self, delay: 0.0, property: .origin, endValue: endValue, duration: duration, function: function)]
    }
    
    // MARK: - Size
    
    func animateWidth(_ width: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .sizeWidth, endValue: width as AnyObject, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainWidth(_ width: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .sizeWidth, endValue: width as AnyObject, duration: duration, function: function)]
    }
    
    func animateHeight(_ height: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .sizeHeight, endValue: height as AnyObject, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainHeight(_ height: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .sizeHeight, endValue: height as AnyObject, duration: duration, function: function)]
    }
    
    func animateSize(_ width: CGFloat, _ height: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animateSize(CGSize(width: width, height: height), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func animateSize(_ size: CGSize, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let endValue = NSValue(cgSize: size)
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .size, endValue: endValue, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainSize(_ width: CGFloat, _ height: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chainSize(CGSize(width: width, height: height), duration: duration, function: function)
    }
    
    func chainSize(_ size: CGSize, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        let endValue = NSValue(cgSize: size)
        return [AnimationDescriptor(view: self, delay: 0.0, property: .size, endValue: endValue, duration: duration, function: function)]
    }
    
    // MARK: - Frame
    
    func animateFrame(_ x: CGFloat, _ y: CGFloat, _ w: CGFloat, _ h: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animateFrame(CGRect(x: x, y: y, width: w, height: h), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func animateFrame(_ origin: CGPoint, _ size: CGSize, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animateFrame(CGRect(origin: origin, size: size), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func animateFrame(_ frame: CGRect, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let endValue = NSValue(cgRect: frame)
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .frame, endValue: endValue, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainFrame(_ x: CGFloat, _ y: CGFloat, _ w: CGFloat, _ h: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chainFrame(CGRect(x: x, y: y, width: w, height: h), duration: duration, function: function)
    }
    
    func chainFrame(_ origin: CGPoint, _ size: CGSize, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chainFrame(CGRect(origin: origin, size: size), duration: duration, function: function)
    }
    
    func chainFrame(_ frame: CGRect, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        let endValue = NSValue(cgRect: frame)
        return [AnimationDescriptor(view: self, delay: 0.0, property: .frame, endValue: endValue, duration: duration, function: function)]
    }
    
    // MARK: - Center
    
    func animateCenterX(_ x: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .centerX, endValue: x as AnyObject, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainCenterX(_ x: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .centerX, endValue: x as AnyObject, duration: duration, function: function)]
    }
    
    func animateCenterY(_ y: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .centerY, endValue: y as AnyObject, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainCenterY(_ y: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .centerY, endValue: y as AnyObject, duration: duration, function: function)]
    }
    
    func animateCenter(_ x: CGFloat, _ y: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animateCenter(CGPoint(x: x, y: y), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func animateCenter(_ center: CGPoint, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let endValue = NSValue(cgPoint: center)
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .center, endValue: endValue, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainCenter(_ x: CGFloat, _ y: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chainCenter(CGPoint(x: x, y: y), duration: duration, function: function)
    }
    
    func chainCenter(_ center: CGPoint, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        let endValue = NSValue(cgPoint: center)
        return [AnimationDescriptor(view: self, delay: 0.0, property: .center, endValue: endValue, duration: duration, function: function)]
    }
    
    // MARK: - Position
    
    func animatePositionX(_ x: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .positionX, endValue: x as AnyObject, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainPositionX(_ x: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .positionX, endValue: x as AnyObject, duration: duration, function: function)]
    }
    
    func animatePositionY(_ y: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .positionY, endValue: y as AnyObject, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainPositionY(_ y: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .positionY, endValue: y as AnyObject, duration: duration, function: function)]
    }
    
    func animatePosition(_ x: CGFloat, _ y: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animatePosition(CGPoint(x: x, y: y), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func animatePosition(_ position: CGPoint, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let endValue = NSValue(cgPoint: position)
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .position, endValue: endValue, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainPosition(_ x: CGFloat, _ y: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0) -> [AnimationDescriptor] {
        return chainPosition(CGPoint(x: x, y: y), duration: duration, function: function)
    }
    
    func chainPosition(_ position: CGPoint, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        let endValue = NSValue(cgPoint: position)
        return [AnimationDescriptor(view: self, delay: 0.0, property: .position, endValue: endValue, duration: duration, function: function)]
    }
    
    // MARK: - Background color
    
    func animateBackgroundColor(_ color: CGColor, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animateBackgroundColor(color.getUIColor(), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func animateBackgroundColor(_ color: UIColor, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .backgroundColor, endValue: color, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainBackgroundColor(_ color: CGColor, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chainBackgroundColor(color.getUIColor(), duration: duration, function: function)
    }
    
    func chainBackgroundColor(_ color: UIColor, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .backgroundColor, endValue: color, duration: duration, function: function)]
    }
    
    // MARK: - Border
    
    func animateBorderColor(_ color: CGColor, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animateBorderColor(color.getUIColor(), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func animateBorderColor(_ color: UIColor, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .borderColor, endValue: color, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainBorderColor(_ color: CGColor, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chainBorderColor(color.getUIColor(), duration: duration, function: function)
    }
    
    func chainBorderColor(_ color: UIColor, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .borderColor, endValue: color, duration: duration, function: function)]
    }
    
    func animateBorderWidth(_ borderWidth: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .borderWidth, endValue: borderWidth as AnyObject, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainBorderWidth(_ borderWidth: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .borderWidth, endValue: borderWidth as AnyObject, duration: duration, function: function)]
    }
    
    // MARK: - Corner radius
    
    func animateCornerRadius(_ cornerRadius: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .cornerRadius, endValue: cornerRadius as AnyObject, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainCornerRadius(_ cornerRadius: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .cornerRadius, endValue: cornerRadius as AnyObject, duration: duration, function: function)]
    }
    
    // MARK: - Opacity
    
    func animateOpacity(_ opacity: Float, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .opacity, endValue: opacity as AnyObject, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainOpacity(_ opacity: Float, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .opacity, endValue: opacity as AnyObject, duration: duration, function: function)]
    }
    
    func animateAlpha(_ alpha: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .alpha, endValue: alpha as AnyObject, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainAlpha(_ alpha: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .alpha, endValue: alpha as AnyObject, duration: duration, function: function)]
    }
    
    // MARK: - Shadow
    
    func animateShadowColor(_ shadowColor: CGColor, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animateShadowColor(shadowColor.getUIColor(), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func animateShadowColor(_ shadowColor: UIColor, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .shadowColor, endValue: shadowColor, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainShadowColor(_ shadowColor: CGColor, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chainShadowColor(shadowColor.getUIColor(), duration: duration, function: function)
    }
    
    func chainShadowColor(_ shadowColor: UIColor, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .shadowColor, endValue: shadowColor, duration: duration, function: function)]
    }
    
    func animateShadowOffset(_ shadowOffset: CGSize, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let endValue = NSValue(cgSize: shadowOffset)
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .shadowOffset, endValue: endValue, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }

    func chainShadowOffset(_ shadowOffset: CGSize, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        let endValue = NSValue(cgSize: shadowOffset)
        return [AnimationDescriptor(view: self, delay: 0.0, property: .shadowOffset, endValue: endValue, duration: duration, function: function)]
    }
    
    func animateShadowOpacity(_ shadowOpacity: Float, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .shadowOpacity, endValue: shadowOpacity as AnyObject, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainShadowOpacity(_ shadowOpacity: Float, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .shadowOpacity, endValue: shadowOpacity as AnyObject, duration: duration, function: function)]
    }
    
    // TODO: Implementation for shadow path
    
    func animateShadowRadius(_ shadowRadius: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .shadowRadius, endValue: shadowRadius as AnyObject, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainShadowRadius(_ shadowRadius: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .shadowRadius, endValue: shadowRadius as AnyObject, duration: duration, function: function)]
    }


    // MARK: - Transform
    
    // TODO: Implement transform animation
    
    // MARK: - Rotation
    
    func animateRotationX(degree: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animateRotationX(radian: degreeToRadian(degree), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func animateRotationX(radian: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .rotationX, endValue: radian as AnyObject, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainRotationX(degree: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chainRotationX(radian: degreeToRadian(degree), duration: duration, function: function)
    }
    
    func chainRotationX(radian: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .rotationX, endValue: radian as AnyObject, duration: duration, function: function)]
    }
    
    func animateRotationY(degree: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animateRotationY(radian: degreeToRadian(degree), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func animateRotationY(radian: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .rotationY, endValue: radian as AnyObject, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainRotationY(degree: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chainRotationY(radian: degreeToRadian(degree), duration: duration, function: function)
    }
    
    func chainRotationY(radian: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .rotationY, endValue: radian as AnyObject, duration: duration, function: function)]
    }
    
    func animateRotationZ(degree: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animateRotationZ(radian: degreeToRadian(degree), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func animateRotationZ(radian: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .rotationZ, endValue: radian as AnyObject, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainRotationZ(degree: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chainRotationZ(radian: degreeToRadian(degree), duration: duration, function: function)
    }
    
    func chainRotationZ(radian: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .rotationZ, endValue: radian as AnyObject, duration: duration, function: function)]
    }
    
    func animateRotation2D(degree: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animateRotationZ(degree: degree, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func animateRotation2D(radian: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animateRotationZ(radian: radian, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainRotation2D(degree: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chainRotationZ(degree: degree, duration: duration, function: function)
    }
    
    func chainRotation2D(radian: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chainRotationZ(radian: radian, duration: duration, function: function)
    }
    
    func animateRotation(degree: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animateRotationZ(degree: degree, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func animateRotation(radian: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animateRotationZ(radian: radian, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainRotation(degree: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chainRotationZ(degree: degree, duration: duration, function: function)
    }
    
    func chainRotation(radian: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chainRotationZ(radian: radian, duration: duration, function: function)
    }
    
    // MARK: - Scale
    
    func animateScaleX(_ sx: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .scaleX, endValue: sx as AnyObject, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainScaleX(_ sx: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .scaleX, endValue: sx as AnyObject, duration: duration, function: function)]
    }
    
    func animateScaleY(_ sy: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .scaleY, endValue: sy as AnyObject, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainScaleY(_ sy: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .scaleY, endValue: sy as AnyObject, duration: duration, function: function)]
    }
    
    func animateScale2D(_ sx: CGFloat, _ sy: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        var transform = self.layer.transform
        (transform.m11, transform.m22) = (sx, sy)
        let endValue = NSValue(caTransform3D: transform)
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .scale2D, endValue: endValue, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func animateScale2D(_ scale: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animateScale2D(scale, scale, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainScale2D(_ sx: CGFloat, _ sy: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        var transform = self.layer.transform
        (transform.m11, transform.m22) = (sx, sy)
        let endValue = NSValue(caTransform3D: transform)
        
        return [AnimationDescriptor(view: self, delay: 0.0, property: .scale2D, endValue: endValue, duration: duration, function: function)]
    }
    
    func chainScale2D(_ scale: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chainScale2D(scale, scale, duration: duration, function: function)
    }
    
    func animateScaleZ(_ sz: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .scaleZ, endValue: sz as AnyObject, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainScaleZ(_ sz: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .scaleZ, endValue: sz as AnyObject, duration: duration, function: function)]
    }
    
    func animateScale(_ sx: CGFloat, _ sy: CGFloat, _ sz: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        var transform = self.layer.transform
        (transform.m11, transform.m22, transform.m33) = (sx, sy, sz)
        let endValue = NSValue(caTransform3D: transform)
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .scale, endValue: endValue, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func animateScale(_ scale: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animateScale(scale, scale, scale, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainScale(_ sx: CGFloat, _ sy: CGFloat, _ sz: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        var transform = self.layer.transform
        (transform.m11, transform.m22, transform.m33) = (sx, sy, sz)
        let endValue = NSValue(caTransform3D: transform)
        
        return [AnimationDescriptor(view: self, delay: 0.0, property: .scale, endValue: endValue, duration: duration, function: function)]
    }
    
    func chainScale(_ scale: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chainScale(scale, scale, scale, duration: duration, function: function)
    }
    
    // MARK: - Translation
    
    func animateTranslationX(_ tx: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .translationX, endValue: tx as AnyObject, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainTranslationX(_ tx: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .translationX, endValue: tx as AnyObject, duration: duration, function: function)]
    }
    
    func animateTranslationY(_ ty: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .translationY, endValue: ty as AnyObject, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainTranslationY(_ ty: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .translationY, endValue: ty as AnyObject, duration: duration, function: function)]
    }
    
    func animateTranslationZ(_ tz: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .translationZ, endValue: tz as AnyObject, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainTranslationZ(_ tz: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .translationZ, endValue: tz as AnyObject, duration: duration, function: function)]
    }
    
    func animateTranslation2D(_ tx: CGFloat, ty: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animateTranslation2D(CGSize(width: tx, height: ty), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func animateTranslation2D(_ translation: CGSize, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let endValue = NSValue(cgSize: translation)
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .translation, endValue: endValue, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainTranslation2D(_ tx: CGFloat, ty: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chainTranslation2D(CGSize(width: tx, height: ty), duration: duration, function: function)
    }
    
    func chainTranslation2D(_ translation: CGSize, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        let endValue = NSValue(cgSize: translation)
        return [AnimationDescriptor(view: self, delay: 0.0, property: .translation, endValue: endValue, duration: duration, function: function)]
    }
    
    func animateTranslation(_ tx: CGFloat, ty: CGFloat, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        return animateTranslation(CGSize(width: tx, height: ty), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func animateTranslation(_ translation: CGSize, duration: Double, function: FunctionType = .linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) -> String {
        let endValue = NSValue(cgSize: translation)
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .translation, endValue: endValue, duration: duration, function: function)
        return KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainTranslation(_ tx: CGFloat, ty: CGFloat, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        return chainTranslation(CGSize(width: tx, height: ty), duration: duration, function: function)
    }
    
    func chainTranslation(_ translation: CGSize, duration: Double, function: FunctionType = .linear) -> [AnimationDescriptor] {
        let endValue = NSValue(cgSize: translation)
        return [AnimationDescriptor(view: self, delay: 0.0, property: .translation, endValue: endValue, duration: duration, function: function)]
    }
    
    // MARK: - Z Position
    
    
    
    
    
    // MARK: - Delayed animation
    
    func after(_ delay: Double) -> DelayedAnimation {
        return DelayedAnimation(view: self, delay: delay)
    }
    
}
