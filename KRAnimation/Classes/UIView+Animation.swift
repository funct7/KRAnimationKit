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
        let endValue = NSValue(CGPoint: CGPointMake(x, y))
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .Origin, endValue: endValue, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func animateOrigin(origin: CGPoint, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let endValue = NSValue(CGPoint: origin)
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .Origin, endValue: endValue, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainOrigin(x: CGFloat, _ y: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        let endValue = NSValue(CGPoint: CGPointMake(x, y))
        return [AnimationDescriptor(view: self, delay: 0.0, property: .Origin, endValue: endValue, duration: duration, function: function)]
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
        let endValue = NSValue(CGSize: CGSizeMake(width, height))
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .Size, endValue: endValue, duration: duration, function: function)
        KRAnimation.animate(animDesc)
    }
    
    func animateSize(size: CGSize, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let endValue = NSValue(CGSize: size)
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .Size, endValue: endValue, duration: duration, function: function)
        KRAnimation.animate(animDesc)
    }
    
    func chainSize(width: CGFloat, _ height: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        let endValue = NSValue(CGSize: CGSizeMake(width, height))
        return [AnimationDescriptor(view: self, delay: 0.0, property: .Size, endValue: endValue, duration: duration, function: function)]
    }
    
    func chainSize(size: CGSize, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        let endValue = NSValue(CGSize: size)
        return [AnimationDescriptor(view: self, delay: 0.0, property: .Size, endValue: endValue, duration: duration, function: function)]
    }
    
    // MARK: - Frame
    
    func animateFrame(x: CGFloat, _ y: CGFloat, _ w: CGFloat, _ h: CGFloat, duration: Double, function: FunctionType, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let endValue = NSValue(CGRect: CGRectMake(x, y, w, h))
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .Frame, endValue: endValue, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func animateFrame(origin: CGPoint, _ size: CGSize, duration: Double, function: FunctionType, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let endValue = NSValue(CGRect: CGRect(origin: origin, size: size))
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .Frame, endValue: endValue, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func animateFrame(frame: CGRect, duration: Double, function: FunctionType, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let endValue = NSValue(CGRect: frame)
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .Frame, endValue: endValue, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainFrame(x: CGFloat, _ y: CGFloat, _ w: CGFloat, _ h: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        let endValue = NSValue(CGRect: CGRectMake(x, y, w, h))
        return [AnimationDescriptor(view: self, delay: 0.0, property: .Frame, endValue: endValue, duration: duration, function: function)]
    }
    
    func chainFrame(origin: CGPoint, _ size: CGSize, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        let endValue = NSValue(CGRect: CGRect(origin: origin, size: size))
        return [AnimationDescriptor(view: self, delay: 0.0, property: .Frame, endValue: endValue, duration: duration, function: function)]
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
        let endValue = NSValue(CGPoint: CGPointMake(x, y))
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .Center, endValue: endValue, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
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
        let endValue = NSValue(CGPoint: CGPointMake(x, y))
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .Position, endValue: endValue, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func animatePosition(position: CGPoint, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let endValue = NSValue(CGPoint: position)
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .Position, endValue: endValue, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainPosition(x: CGFloat, _ y: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0) -> [AnimationDescriptor] {
        let endValue = NSValue(CGPoint: CGPointMake(x, y))
        return [AnimationDescriptor(view: self, delay: 0.0, property: .Position, endValue: endValue, duration: duration, function: function)]
    }
    
    func chainPosition(position: CGPoint, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        let endValue = NSValue(CGPoint: center)
        return [AnimationDescriptor(view: self, delay: 0.0, property: .Position, endValue: endValue, duration: duration, function: function)]
    }
    
    // MARK: - Background color
    
    func animateBackgroundColor(color: UIColor, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .BackgroundColor, endValue: color, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func animateBackgroundColor(color: CGColor, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .BackgroundColor, endValue: color.getUIColor(), duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainBackgroundColor(color: UIColor, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .BackgroundColor, endValue: color, duration: duration, function: function)]
    }
    
    func chainBackgroundColor(color: CGColor, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .BackgroundColor, endValue: color.getUIColor(), duration: duration, function: function)]
    }
    
    // MARK: - Border
    
    func animateBorderColor(color: UIColor, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .BorderColor, endValue: color, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func animateBorderColor(color: CGColor, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .BorderColor, endValue: color.getUIColor(), duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainBorderColor(color: UIColor, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .BorderColor, endValue: color, duration: duration, function: function)]
    }
    
    func chainBorderColor(color: CGColor, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .BorderColor, endValue: color.getUIColor(), duration: duration, function: function)]
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
    
    func animateShadowColor(shadowColor: UIColor, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .ShadowColor, endValue: shadowColor, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func animateShadowColor(shadowColor: CGColor, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .ShadowColor, endValue: shadowColor.getUIColor(), duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainShadowColor(shadowColor: UIColor, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .ShadowColor, endValue: shadowColor, duration: duration, function: function)]
    }
    
    func chainShadowColor(shadowColor: CGColor, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .ShadowColor, endValue: shadowColor.getUIColor(), duration: duration, function: function)]
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
    
    // MARK: - Scale
    
    func animateScaleX(scaleX: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .ScaleX, endValue: scaleX, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainScaleX(scaleX: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .ScaleX, endValue: scaleX, duration: duration, function: function)]
    }
    
    func animateScaleY(scaleY: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, completion: (() -> Void)? = nil) {
        let animDesc = AnimationDescriptor(view: self, delay: 0.0, property: .ScaleY, endValue: scaleY, duration: duration, function: function)
        KRAnimation.animate(animDesc, reverses: reverses, repeatCount: repeatCount, completion: completion)
    }
    
    func chainScaleY(scaleY: CGFloat, duration: Double, function: FunctionType = .Linear) -> [AnimationDescriptor] {
        return [AnimationDescriptor(view: self, delay: 0.0, property: .ScaleY, endValue: scaleY, duration: duration, function: function)]
    }
    
    // MARK: - Rotation
    
    // MARK: - Translation
    
    // MARK: - Z Position
    
    
    
    
    
    // MARK: - Delayed animation
    
    func after(delay: Double) -> DelayedAnimation {
        return DelayedAnimation(view: self, delay: delay)
    }
    
}
