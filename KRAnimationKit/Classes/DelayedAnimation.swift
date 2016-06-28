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
    
    public func animateX(x: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .OriginX, endValue: x, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainX(x: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .OriginX, endValue: x, duration: duration, function: function)]
    }
    
    public func animateY(y: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .OriginY, endValue: y, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainY(y: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .OriginY, endValue: y, duration: duration, function: function)]
    }
    
    public func animateOrigin(x: CGFloat, _ y: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        animateOrigin(CGPointMake(x, y), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func animateOrigin(origin: CGPoint, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let endValue = NSValue(CGPoint: origin)
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .Origin, endValue: endValue, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainOrigin(x: CGFloat, _ y: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return chainOrigin(CGPointMake(x, y), duration: duration, function: function)
    }
    
    public func chainOrigin(origin: CGPoint, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        let endValue = NSValue(CGPoint: origin)
        return [AnimationDescriptor(view: view, delay: delay, property: .Origin, endValue: endValue, duration: duration, function: function)]
    }
    
    // MARK: - Size
    
    public func animateWidth(width: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .SizeWidth, endValue: width, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainWidth(width: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .SizeWidth, endValue: width, duration: duration, function: function)]
    }
    
    public func animateHeight(height: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .SizeHeight, endValue: height, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainHeight(height: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .SizeHeight, endValue: height, duration: duration, function: function)]
    }
    
    public func animateSize(width: CGFloat, _ height: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        animateSize(CGSizeMake(width, height), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func animateSize(size: CGSize, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let endValue = NSValue(CGSize: size)
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .Size, endValue: endValue, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainSize(width: CGFloat, _ height: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return chainSize(CGSizeMake(width, height), duration: duration, function: function)
    }
    
    public func chainSize(size: CGSize, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        let endValue = NSValue(CGSize: size)
        return [AnimationDescriptor(view: view, delay: delay, property: .Size, endValue: endValue, duration: duration, function: function)]
    }
    
    // MARK: - Frame
    
    public func animateFrame(x: CGFloat, _ y: CGFloat, _ w: CGFloat, _ h: CGFloat, duration: Double, function: FunctionType, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        animateFrame(CGRectMake(x, y, w, h), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func animateFrame(origin: CGPoint, _ size: CGSize, duration: Double, function: FunctionType, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        animateFrame(CGRect(origin: origin, size: size), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func animateFrame(frame: CGRect, duration: Double, function: FunctionType, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let endValue = NSValue(CGRect: frame)
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .Frame, endValue: endValue, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainFrame(x: CGFloat, _ y: CGFloat, _ w: CGFloat, _ h: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return chainFrame(CGRectMake(x, y, w, h), duration: duration, function: function)
    }
    
    public func chainFrame(origin: CGPoint, _ size: CGSize, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return chainFrame(CGRect(origin: origin, size: size), duration: duration, function: function)
    }
    
    public func chainFrame(frame: CGRect, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        let endValue = NSValue(CGRect: frame)
        return [AnimationDescriptor(view: view, delay: delay, property: .Frame, endValue: endValue, duration: duration, function: function)]
    }
    
    // MARK: - Center
    
    public func animateCenterX(x: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .CenterX, endValue: x, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainCenterX(x: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .CenterX, endValue: x, duration: duration, function: function)]
    }
    
    public func animateCenterY(y: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .CenterY, endValue: y, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainCenterY(y: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .CenterY, endValue: y, duration: duration, function: function)]
    }
    
    public func animateCenter(x: CGFloat, _ y: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        animateCenter(CGPointMake(x, y), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func animateCenter(center: CGPoint, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let endValue = NSValue(CGPoint: center)
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .Center, endValue: endValue, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainCenter(x: CGFloat, _ y: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return chainCenter(CGPointMake(x, y), duration: duration, function: function)
    }
    
    public func chainCenter(center: CGPoint, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        let endValue = NSValue(CGPoint: center)
        return [AnimationDescriptor(view: view, delay: delay, property: .Center, endValue: endValue, duration: duration, function: function)]
    }
    
    // MARK: - Position
    
    public func animatePositionX(x: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .PositionX, endValue: x, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainPositionX(x: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .PositionX, endValue: x, duration: duration, function: function)]
    }
    
    public func animatePositionY(y: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .PositionY, endValue: y, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainPositionY(y: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .PositionY, endValue: y, duration: duration, function: function)]
    }
    
    public func animatePosition(x: CGFloat, _ y: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        animatePosition(CGPointMake(x, y), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func animatePosition(position: CGPoint, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let endValue = NSValue(CGPoint: position)
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .Position, endValue: endValue, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainPosition(x: CGFloat, _ y: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0) -> [AnimationDescriptor] {
        return chainPosition(CGPointMake(x, y), duration: duration, function: function)
    }
    
    public func chainPosition(position: CGPoint, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        let endValue = NSValue(CGPoint: position)
        return [AnimationDescriptor(view: view, delay: delay, property: .Position, endValue: endValue, duration: duration, function: function)]
    }
    
    // MARK: - Background color
    
    public func animateBackgroundColor(color: CGColor, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        animateBackgroundColor(color.getUIColor(), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func animateBackgroundColor(color: UIColor, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .BackgroundColor, endValue: color, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainBackgroundColor(color: CGColor, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return chainBackgroundColor(color.getUIColor(), duration: duration, function: function)
    }
    
    public func chainBackgroundColor(color: UIColor, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .BackgroundColor, endValue: color, duration: duration, function: function)]
    }
    
    // MARK: - Border
    
    public func animateBorderColor(color: CGColor, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        animateBorderColor(color.getUIColor(), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func animateBorderColor(color: UIColor, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .BorderColor, endValue: color, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainBorderColor(color: CGColor, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return chainBorderColor(color.getUIColor(), duration: duration, function: function)
    }
    
    public func chainBorderColor(color: UIColor, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .BorderColor, endValue: color, duration: duration, function: function)]
    }
    
    public func animateBorderWidth(borderWidth: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .BorderWidth, endValue: borderWidth, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainBorderWidth(borderWidth: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .BorderWidth, endValue: borderWidth, duration: duration, function: function)]
    }
    
    // MARK: - Corner radius
    
    public func animateCornerRadius(cornerRadius: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .CornerRadius, endValue: cornerRadius, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainCornerRadius(cornerRadius: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .CornerRadius, endValue: cornerRadius, duration: duration, function: function)]
    }
    
    // MARK: - Opacity
    
    public func animateOpacity(opacity: Float, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .Opacity, endValue: opacity, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainOpacity(opacity: Float, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .Opacity, endValue: opacity, duration: duration, function: function)]
    }
    
    public func animateAlpha(alpha: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .Alpha, endValue: alpha, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainAlpha(alpha: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .Alpha, endValue: alpha, duration: duration, function: function)]
    }
    
    // MARK: - Shadow
    
    public func animateShadowColor(shadowColor: CGColor, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        animateShadowColor(shadowColor.getUIColor(), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func animateShadowColor(shadowColor: UIColor, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .ShadowColor, endValue: shadowColor, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainShadowColor(shadowColor: CGColor, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return chainShadowColor(shadowColor.getUIColor(), duration: duration, function: function)
    }
    
    public func chainShadowColor(shadowColor: UIColor, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .ShadowColor, endValue: shadowColor, duration: duration, function: function)]
    }
    
    public func animateShadowOffset(shadowOffset: CGSize, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let endValue = NSValue(CGSize: shadowOffset)
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .ShadowOffset, endValue: endValue, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainShadowOffset(shadowOffset: CGSize, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        let endValue = NSValue(CGSize: shadowOffset)
        return [AnimationDescriptor(view: view, delay: delay, property: .ShadowOffset, endValue: endValue, duration: duration, function: function)]
    }
    
    public func animateShadowOpacity(shadowOpacity: Float, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .ShadowOpacity, endValue: shadowOpacity, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainShadowOpacity(shadowOpacity: Float, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .ShadowOpacity, endValue: shadowOpacity, duration: duration, function: function)]
    }
    
    // TODO: Implementation for shadow path
    
    public func animateShadowRadius(shadowRadius: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .ShadowRadius, endValue: shadowRadius, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainShadowRadius(shadowRadius: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .ShadowRadius, endValue: shadowRadius, duration: duration, function: function)]
    }
    
    
    // MARK: - Transform
    
    // TODO: Implement transform animation
    
    // MARK: - Rotation
    
    public func animateRotationX(degree degree: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        animateRotationX(radian: degreeToRadian(degree), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func animateRotationX(radian radian: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .RotationX, endValue: radian, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainRotationX(degree degree: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return chainRotationX(radian: degreeToRadian(degree), duration: duration, function: function)
    }
    
    public func chainRotationX(radian radian: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .RotationX, endValue: radian, duration: duration, function: function)]
    }
    
    public func animateRotationY(degree degree: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        animateRotationY(radian: degreeToRadian(degree), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func animateRotationY(radian radian: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .RotationY, endValue: radian, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainRotationY(degree degree: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return chainRotationY(radian: degreeToRadian(degree), duration: duration, function: function)
    }
    
    public func chainRotationY(radian radian: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .RotationY, endValue: radian, duration: duration, function: function)]
    }
    
    public func animateRotationZ(degree degree: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        animateRotationZ(radian: degreeToRadian(degree), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func animateRotationZ(radian radian: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .RotationZ, endValue: radian, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainRotationZ(degree degree: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return chainRotationZ(radian: degreeToRadian(degree), duration: duration, function: function)
    }
    
    public func chainRotationZ(radian radian: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .RotationZ, endValue: radian, duration: duration, function: function)]
    }
    
    public func animateRotation2D(degree degree: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        animateRotationZ(degree: degree, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func animateRotation2D(radian radian: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        animateRotationZ(radian: radian, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainRotation2D(degree degree: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return chainRotationZ(degree: degree, duration: duration, function: function)
    }
    
    public func chainRotation2D(radian radian: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return chainRotationZ(radian: radian, duration: duration, function: function)
    }
    
    public func animateRotation(degree degree: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        animateRotationZ(degree: degree, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func animateRotation(radian radian: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        animateRotationZ(radian: radian, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainRotation(degree degree: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return chainRotationZ(degree: degree, duration: duration, function: function)
    }
    
    public func chainRotation(radian radian: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return chainRotationZ(radian: radian, duration: duration, function: function)
    }
    
    // MARK: - Scale
    
    public func animateScaleX(sx: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .ScaleX, endValue: sx, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainScaleX(sx: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .ScaleX, endValue: sx, duration: duration, function: function)]
    }
    
    public func animateScaleY(sy: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .ScaleY, endValue: sy, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainScaleY(sy: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .ScaleY, endValue: sy, duration: duration, function: function)]
    }
    
    public func animateScale2D(sx: CGFloat, _ sy: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        var transform = view.layer.transform
        (transform.m11, transform.m22) = (sx, sy)
        let endValue = NSValue(CATransform3D: transform)
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .Scale2D, endValue: endValue, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func animateScale2D(scale: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        animateScale2D(scale, scale, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainScale2D(sx: CGFloat, _ sy: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        var transform = view.layer.transform
        (transform.m11, transform.m22) = (sx, sy)
        let endValue = NSValue(CATransform3D: transform)
        
        return [AnimationDescriptor(view: view, delay: delay, property: .Scale2D, endValue: endValue, duration: duration, function: function)]
    }
    
    public func chainScale2D(scale: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return chainScale2D(scale, scale, duration: duration, function: function)
    }
    
    public func animateScaleZ(sz: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .ScaleZ, endValue: sz, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainScaleZ(sz: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .ScaleZ, endValue: sz, duration: duration, function: function)]
    }
    
    public func animateScale(sx: CGFloat, _ sy: CGFloat, _ sz: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        var transform = view.layer.transform
        (transform.m11, transform.m22, transform.m33) = (sx, sy, sz)
        let endValue = NSValue(CATransform3D: transform)
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .Scale, endValue: endValue, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func animateScale(scale: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        animateScale(scale, scale, scale, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainScale(sx: CGFloat, _ sy: CGFloat, _ sz: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        var transform = view.layer.transform
        (transform.m11, transform.m22, transform.m33) = (sx, sy, sz)
        let endValue = NSValue(CATransform3D: transform)
        
        return [AnimationDescriptor(view: view, delay: delay, property: .Scale, endValue: endValue, duration: duration, function: function)]
    }
    
    public func chainScale(scale: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return chainScale(scale, scale, scale, duration: duration, function: function)
    }
    
    // MARK: - Translation
    
    public func animateTranslationX(tx: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .TranslationX, endValue: tx, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainTranslationX(tx: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .TranslationX, endValue: tx, duration: duration, function: function)]
    }
    
    public func animateTranslationY(ty: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .TranslationY, endValue: ty, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainTranslationY(ty: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .TranslationY, endValue: ty, duration: duration, function: function)]
    }
    
    public func animateTranslationZ(tz: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .TranslationZ, endValue: tz, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainTranslationZ(tz: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: view, delay: delay, property: .TranslationZ, endValue: tz, duration: duration, function: function)]
    }
    
    public func animateTranslation2D(tx: CGFloat, ty: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        animateTranslation2D(CGSizeMake(tx, ty), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func animateTranslation2D(translation: CGSize, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let endValue = NSValue(CGSize: translation)
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .Translation, endValue: endValue, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainTranslation2D(tx: CGFloat, ty: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return chainTranslation2D(CGSizeMake(tx, ty), duration: duration, function: function)
    }
    
    public func chainTranslation2D(translation: CGSize, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        let endValue = NSValue(CGSize: translation)
        return [AnimationDescriptor(view: view, delay: delay, property: .Translation, endValue: endValue, duration: duration, function: function)]
    }
    
    public func animateTranslation(tx: CGFloat, ty: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        animateTranslation(CGSizeMake(tx, ty), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func animateTranslation(translation: CGSize, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let endValue = NSValue(CGSize: translation)
        let animDesc = AnimationDescriptor(view: view, delay: delay, property: .Translation, endValue: endValue, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    public func chainTranslation(tx: CGFloat, ty: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return chainTranslation(CGSizeMake(tx, ty), duration: duration, function: function)
    }
    
    public func chainTranslation(translation: CGSize, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        let endValue = NSValue(CGSize: translation)
        return [AnimationDescriptor(view: view, delay: delay, property: .Translation, endValue: endValue, duration: duration, function: function)]
    }
    
    // MARK: - Z Position
    
    
}
