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
    
    func animateX(x: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .OriginX, endValue: x, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainX(x: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .OriginX, endValue: x, duration: duration, function: function)]
    }
    
    func animateY(y: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .OriginY, endValue: y, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainY(y: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .OriginY, endValue: y, duration: duration, function: function)]
    }
    
    func animateOrigin(x: CGFloat, _ y: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        animateOrigin(CGPointMake(x, y), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func animateOrigin(origin: CGPoint, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let endValue = NSValue(CGPoint: origin)
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .Origin, endValue: endValue, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainOrigin(x: CGFloat, _ y: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return chainOrigin(CGPointMake(x, y), duration: duration, function: function)
    }
    
    func chainOrigin(origin: CGPoint, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        let endValue = NSValue(CGPoint: origin)
        return [AnimationDescriptor(view: self, delay: 0.0, property: .Origin, endValue: endValue, duration: duration, function: function)]
    }
    
    // MARK: - Size
    
    func animateWidth(width: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .SizeWidth, endValue: width, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainWidth(width: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .SizeWidth, endValue: width, duration: duration, function: function)]
    }
    
    func animateHeight(height: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .SizeHeight, endValue: height, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainHeight(height: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .SizeHeight, endValue: height, duration: duration, function: function)]
    }
    
    func animateSize(width: CGFloat, _ height: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        animateSize(CGSizeMake(width, height), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func animateSize(size: CGSize, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let endValue = NSValue(CGSize: size)
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .Size, endValue: endValue, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainSize(width: CGFloat, _ height: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return chainSize(CGSizeMake(width, height), duration: duration, function: function)
    }
    
    func chainSize(size: CGSize, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        let endValue = NSValue(CGSize: size)
        return [AnimationDescriptor(view: self, delay: 0.0, property: .Size, endValue: endValue, duration: duration, function: function)]
    }
    
    // MARK: - Frame
    
    func animateFrame(x: CGFloat, _ y: CGFloat, _ w: CGFloat, _ h: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        animateFrame(CGRectMake(x, y, w, h), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func animateFrame(origin: CGPoint, _ size: CGSize, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        animateFrame(CGRect(origin: origin, size: size), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func animateFrame(frame: CGRect, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let endValue = NSValue(CGRect: frame)
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .Frame, endValue: endValue, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainFrame(x: CGFloat, _ y: CGFloat, _ w: CGFloat, _ h: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return chainFrame(CGRectMake(x, y, w, h), duration: duration, function: function)
    }
    
    func chainFrame(origin: CGPoint, _ size: CGSize, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return chainFrame(CGRect(origin: origin, size: size), duration: duration, function: function)
    }
    
    func chainFrame(frame: CGRect, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        let endValue = NSValue(CGRect: frame)
        return [AnimationDescriptor(view: self, delay: 0.0, property: .Frame, endValue: endValue, duration: duration, function: function)]
    }
    
    // MARK: - Center
    
    func animateCenterX(x: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .CenterX, endValue: x, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainCenterX(x: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .CenterX, endValue: x, duration: duration, function: function)]
    }
    
    func animateCenterY(y: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .CenterY, endValue: y, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainCenterY(y: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .CenterY, endValue: y, duration: duration, function: function)]
    }
    
    func animateCenter(x: CGFloat, _ y: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        animateCenter(CGPointMake(x, y), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func animateCenter(center: CGPoint, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let endValue = NSValue(CGPoint: center)
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .Center, endValue: endValue, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainCenter(x: CGFloat, _ y: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return chainCenter(CGPointMake(x, y), duration: duration, function: function)
    }
    
    func chainCenter(center: CGPoint, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        let endValue = NSValue(CGPoint: center)
        return [AnimationDescriptor(view: self, delay: 0.0, property: .Center, endValue: endValue, duration: duration, function: function)]
    }
    
    // MARK: - Position
    
    func animatePositionX(x: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .PositionX, endValue: x, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainPositionX(x: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .PositionX, endValue: x, duration: duration, function: function)]
    }
    
    func animatePositionY(y: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .PositionY, endValue: y, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainPositionY(y: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .PositionY, endValue: y, duration: duration, function: function)]
    }
    
    func animatePosition(x: CGFloat, _ y: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        animatePosition(CGPointMake(x, y), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func animatePosition(position: CGPoint, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let endValue = NSValue(CGPoint: position)
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .Position, endValue: endValue, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainPosition(x: CGFloat, _ y: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0) -> [AnimationDescriptor] {
        return chainPosition(CGPointMake(x, y), duration: duration, function: function)
    }
    
    func chainPosition(position: CGPoint, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        let endValue = NSValue(CGPoint: position)
        return [AnimationDescriptor(view: self, delay: 0.0, property: .Position, endValue: endValue, duration: duration, function: function)]
    }
    
    // MARK: - Background color
    
    func animateBackgroundColor(color: CGColor, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        animateBackgroundColor(color.getUIColor(), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func animateBackgroundColor(color: UIColor, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .BackgroundColor, endValue: color, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainBackgroundColor(color: CGColor, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return chainBackgroundColor(color.getUIColor(), duration: duration, function: function)
    }
    
    func chainBackgroundColor(color: UIColor, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .BackgroundColor, endValue: color, duration: duration, function: function)]
    }
    
    // MARK: - Border
    
    func animateBorderColor(color: CGColor, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        animateBorderColor(color.getUIColor(), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func animateBorderColor(color: UIColor, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .BorderColor, endValue: color, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainBorderColor(color: CGColor, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return chainBorderColor(color.getUIColor(), duration: duration, function: function)
    }
    
    func chainBorderColor(color: UIColor, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .BorderColor, endValue: color, duration: duration, function: function)]
    }
    
    func animateBorderWidth(borderWidth: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .BorderWidth, endValue: borderWidth, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainBorderWidth(borderWidth: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .BorderWidth, endValue: borderWidth, duration: duration, function: function)]
    }
    
    // MARK: - Corner radius
    
    func animateCornerRadius(cornerRadius: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .CornerRadius, endValue: cornerRadius, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainCornerRadius(cornerRadius: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .CornerRadius, endValue: cornerRadius, duration: duration, function: function)]
    }
    
    // MARK: - Opacity
    
    func animateOpacity(opacity: Float, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .Opacity, endValue: opacity, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainOpacity(opacity: Float, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .Opacity, endValue: opacity, duration: duration, function: function)]
    }
    
    func animateAlpha(alpha: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .Alpha, endValue: alpha, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainAlpha(alpha: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .Alpha, endValue: alpha, duration: duration, function: function)]
    }
    
    // MARK: - Shadow
    
    func animateShadowColor(shadowColor: CGColor, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        animateShadowColor(shadowColor.getUIColor(), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func animateShadowColor(shadowColor: UIColor, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .ShadowColor, endValue: shadowColor, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainShadowColor(shadowColor: CGColor, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return chainShadowColor(shadowColor.getUIColor(), duration: duration, function: function)
    }
    
    func chainShadowColor(shadowColor: UIColor, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .ShadowColor, endValue: shadowColor, duration: duration, function: function)]
    }
    
    func animateShadowOffset(shadowOffset: CGSize, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let endValue = NSValue(CGSize: shadowOffset)
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .ShadowOffset, endValue: endValue, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }

    func chainShadowOffset(shadowOffset: CGSize, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        let endValue = NSValue(CGSize: shadowOffset)
        return [AnimationDescriptor(view: self, delay: 0.0, property: .ShadowOffset, endValue: endValue, duration: duration, function: function)]
    }
    
    func animateShadowOpacity(shadowOpacity: Float, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .ShadowOpacity, endValue: shadowOpacity, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainShadowOpacity(shadowOpacity: Float, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .ShadowOpacity, endValue: shadowOpacity, duration: duration, function: function)]
    }
    
    // TODO: Implementation for shadow path
    
    func animateShadowRadius(shadowRadius: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .ShadowRadius, endValue: shadowRadius, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainShadowRadius(shadowRadius: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .ShadowRadius, endValue: shadowRadius, duration: duration, function: function)]
    }


    // MARK: - Transform
    
    // TODO: Implement transform animation
    
    // MARK: - Rotation
    
    func animateRotationX(degree degree: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        animateRotationX(radian: degreeToRadian(degree), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func animateRotationX(radian radian: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .RotationX, endValue: radian, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainRotationX(degree degree: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return chainRotationX(radian: degreeToRadian(degree), duration: duration, function: function)
    }
    
    func chainRotationX(radian radian: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .RotationX, endValue: radian, duration: duration, function: function)]
    }
    
    func animateRotationY(degree degree: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        animateRotationY(radian: degreeToRadian(degree), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func animateRotationY(radian radian: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .RotationY, endValue: radian, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainRotationY(degree degree: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return chainRotationY(radian: degreeToRadian(degree), duration: duration, function: function)
    }
    
    func chainRotationY(radian radian: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .RotationY, endValue: radian, duration: duration, function: function)]
    }
    
    func animateRotationZ(degree degree: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        animateRotationZ(radian: degreeToRadian(degree), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func animateRotationZ(radian radian: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .RotationZ, endValue: radian, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainRotationZ(degree degree: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return chainRotationZ(radian: degreeToRadian(degree), duration: duration, function: function)
    }
    
    func chainRotationZ(radian radian: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .RotationZ, endValue: radian, duration: duration, function: function)]
    }
    
    func animateRotation2D(degree degree: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        animateRotationZ(degree: degree, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func animateRotation2D(radian radian: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        animateRotationZ(radian: radian, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainRotation2D(degree degree: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return chainRotationZ(degree: degree, duration: duration, function: function)
    }
    
    func chainRotation2D(radian radian: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return chainRotationZ(radian: radian, duration: duration, function: function)
    }
    
    func animateRotation(degree degree: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        animateRotationZ(degree: degree, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func animateRotation(radian radian: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        animateRotationZ(radian: radian, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainRotation(degree degree: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return chainRotationZ(degree: degree, duration: duration, function: function)
    }
    
    func chainRotation(radian radian: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return chainRotationZ(radian: radian, duration: duration, function: function)
    }
    
    // MARK: - Scale
    
    func animateScaleX(sx: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .ScaleX, endValue: sx, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainScaleX(sx: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .ScaleX, endValue: sx, duration: duration, function: function)]
    }
    
    func animateScaleY(sy: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .ScaleY, endValue: sy, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainScaleY(sy: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .ScaleY, endValue: sy, duration: duration, function: function)]
    }
    
    func animateScale2D(sx: CGFloat, _ sy: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        var transform = self.layer.transform
        (transform.m11, transform.m22) = (sx, sy)
        let endValue = NSValue(CATransform3D: transform)
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .Scale2D, endValue: endValue, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func animateScale2D(scale: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        animateScale2D(scale, scale, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainScale2D(sx: CGFloat, _ sy: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        var transform = self.layer.transform
        (transform.m11, transform.m22) = (sx, sy)
        let endValue = NSValue(CATransform3D: transform)
        
        return [AnimationDescriptor(view: self, delay: 0.0, property: .Scale2D, endValue: endValue, duration: duration, function: function)]
    }
    
    func chainScale2D(scale: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return chainScale2D(scale, scale, duration: duration, function: function)
    }
    
    func animateScaleZ(sz: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .ScaleZ, endValue: sz, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainScaleZ(sz: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .ScaleZ, endValue: sz, duration: duration, function: function)]
    }
    
    func animateScale(sx: CGFloat, _ sy: CGFloat, _ sz: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        var transform = self.layer.transform
        (transform.m11, transform.m22, transform.m33) = (sx, sy, sz)
        let endValue = NSValue(CATransform3D: transform)
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .Scale, endValue: endValue, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func animateScale(scale: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        animateScale(scale, scale, scale, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainScale(sx: CGFloat, _ sy: CGFloat, _ sz: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        var transform = self.layer.transform
        (transform.m11, transform.m22, transform.m33) = (sx, sy, sz)
        let endValue = NSValue(CATransform3D: transform)
        
        return [AnimationDescriptor(view: self, delay: 0.0, property: .Scale, endValue: endValue, duration: duration, function: function)]
    }
    
    func chainScale(scale: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return chainScale(scale, scale, scale, duration: duration, function: function)
    }
    
    // MARK: - Translation
    
    func animateTranslationX(tx: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .TranslationX, endValue: tx, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainTranslationX(tx: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .TranslationX, endValue: tx, duration: duration, function: function)]
    }
    
    func animateTranslationY(ty: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .TranslationY, endValue: ty, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainTranslationY(ty: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .TranslationY, endValue: ty, duration: duration, function: function)]
    }
    
    func animateTranslationZ(tz: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .TranslationZ, endValue: tz, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainTranslationZ(tz: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .TranslationZ, endValue: tz, duration: duration, function: function)]
    }
    
    func animateTranslation2D(tx: CGFloat, ty: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        animateTranslation2D(CGSizeMake(tx, ty), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func animateTranslation2D(translation: CGSize, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let endValue = NSValue(CGSize: translation)
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .Translation, endValue: endValue, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainTranslation2D(tx: CGFloat, ty: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return chainTranslation2D(CGSizeMake(tx, ty), duration: duration, function: function)
    }
    
    func chainTranslation2D(translation: CGSize, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        let endValue = NSValue(CGSize: translation)
        return [AnimationDescriptor(view: self, delay: 0.0, property: .Translation, endValue: endValue, duration: duration, function: function)]
    }
    
    func animateTranslation(tx: CGFloat, ty: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        animateTranslation(CGSizeMake(tx, ty), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func animateTranslation(translation: CGSize, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let endValue = NSValue(CGSize: translation)
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .Translation, endValue: endValue, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainTranslation(tx: CGFloat, ty: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return chainTranslation(CGSizeMake(tx, ty), duration: duration, function: function)
    }
    
    func chainTranslation(translation: CGSize, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        let endValue = NSValue(CGSize: translation)
        return [AnimationDescriptor(view: self, delay: 0.0, property: .Translation, endValue: endValue, duration: duration, function: function)]
    }
    
    // MARK: - Z Position
    
    
    
    
    
    // MARK: - Delayed animation
    
    func after(delay: Double) -> DelayedAnimation {
        return DelayedAnimation(view: self, delay: delay)
    }
    
}
