//
//  UIView+Animation.swift
//  Pods
//
//  Created by Joshua Park on 6/20/16.
//
//

import UIKit

public extension UIView {
    func chainAnimations(animations: [CAAnimation]..., reverses: Bool = false, repeatCount: Float = 0.0) {
        let animations = animations.flatMap { $0 }
        var totalDuration = 0.0
        
        for anim in animations {
            anim.beginTime += totalDuration
            totalDuration += anim.duration
        }
        
        let animGroup = CAAnimationGroup()
        animGroup.animations = animations
        animGroup.duration = totalDuration
        animGroup.repeatCount = repeatCount
        animGroup.autoreverses = reverses
        
        layer.addAnimation(animGroup, forKey: nil)
    }
    
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
    
    func chainOrigin(x: CGFloat, _ y: CGFloat, duration: Double, function: FunctionType = .Linear, nextAnimation: (() -> [CAAnimation])? = nil) -> [AnimationDescriptor] {
        let endValue = NSValue(CGPoint: CGPointMake(x, y))
        return [AnimationDescriptor(view: self, delay: 0.0, property: .Origin, endValue: endValue, duration: duration, function: function)]
    }
    
    func chainOrigin(origin: CGPoint, duration: Double, function: FunctionType = .Linear, nextAnimation: (() -> [CAAnimation])? = nil) -> [AnimationDescriptor] {
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
    
    func chainFrame(frame: CGRect, duration: Double, function: FunctionType = .Linear, nextAnimation: (() -> [CAAnimation])? = nil) -> [CAAnimation] {
        let endValue = NSValue(CGRect: frame)
        return KRAnimation.chainView(self, property: .Frame, endValue: endValue, duration: duration, function: function, nextAnimation: nextAnimation)
    }
    
    // MARK: - Center
    
    func animateCenterX(x: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, nextAnimation: (() -> [CAAnimation])? = nil) {
        KRAnimation.animateView(self, property: .CenterX, endValue: x, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, nextAnimation: nextAnimation)
    }
    
    func chainCenterX(x: CGFloat, duration: Double, function: FunctionType = .Linear, nextAnimation: (() -> [CAAnimation])? = nil) -> [CAAnimation] {
        return KRAnimation.chainView(self, property: .CenterX, endValue: x, duration: duration, function: function, nextAnimation: nextAnimation)
    }
    
    func animateCenterY(y: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, nextAnimation: (() -> [CAAnimation])? = nil) {
        KRAnimation.animateView(self, property: .CenterY, endValue: y, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, nextAnimation: nextAnimation)
    }
    
    func chainCenterY(y: CGFloat, duration: Double, function: FunctionType = .Linear, nextAnimation: (() -> [CAAnimation])? = nil) -> [CAAnimation] {
        return KRAnimation.chainView(self, property: .CenterY, endValue: y, duration: duration, function: function, nextAnimation: nextAnimation)
    }
    
    func animateCenter(x: CGFloat, _ y: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, nextAnimation: (() -> [CAAnimation])? = nil) {
        let endValue = NSValue(CGPoint: CGPointMake(x, y))
        KRAnimation.animateView(self, property: .Center, endValue: endValue, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, nextAnimation: nextAnimation)
    }
    
    func chainCenter(center: CGPoint, duration: Double, function: FunctionType = .Linear, nextAnimation: (() -> [CAAnimation])? = nil) -> [CAAnimation] {
        let endValue = NSValue(CGPoint: center)
        return KRAnimation.chainView(self, property: .Center, endValue: endValue, duration: duration, function: function, nextAnimation: nextAnimation)
    }
    
    // MARK: - Position
    
    func animatePositionX(x: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, nextAnimation: (() -> [CAAnimation])? = nil) {
        KRAnimation.animateView(self, property: .PositionX, endValue: x, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, nextAnimation: nextAnimation)
    }
    
    func chainPositionX(x: CGFloat, duration: Double, function: FunctionType = .Linear, nextAnimation: (() -> [CAAnimation])? = nil) -> [CAAnimation] {
        return KRAnimation.chainView(self, property: .PositionX, endValue: x, duration: duration, function: function, nextAnimation: nextAnimation)
    }
    
    func animatePositionY(y: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, nextAnimation: (() -> [CAAnimation])? = nil) {
        KRAnimation.animateView(self, property: .PositionY, endValue: y, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, nextAnimation: nextAnimation)
    }
    
    func chainPositionY(y: CGFloat, duration: Double, function: FunctionType = .Linear, nextAnimation: (() -> [CAAnimation])? = nil) -> [CAAnimation] {
        return KRAnimation.chainView(self, property: .PositionY, endValue: y, duration: duration, function: function, nextAnimation: nextAnimation)
    }
    
    func animatePosition(x: CGFloat, _ y: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, nextAnimation: (() -> [CAAnimation])? = nil) {
        let endValue = NSValue(CGPoint: CGPointMake(x, y))
        KRAnimation.animateView(self, property: .Position, endValue: endValue, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, nextAnimation: nextAnimation)
    }
    
    func chainPosition(position: CGPoint, duration: Double, function: FunctionType = .Linear, nextAnimation: (() -> [CAAnimation])? = nil) -> [CAAnimation] {
        let endValue = NSValue(CGPoint: center)
        return KRAnimation.chainView(self, property: .Position, endValue: endValue, duration: duration, function: function, nextAnimation: nextAnimation)
    }
    
    // MARK: - Background color
    
    func animateBackgroundColor(color: UIColor, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, nextAnimation: (() -> [CAAnimation])? = nil) {
        KRAnimation.animateView(self, property: .BackgroundColor, endValue: color, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, nextAnimation: nextAnimation)
    }
    
    func animateBackgroundColor(color: CGColor, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, nextAnimation: (() -> [CAAnimation])? = nil) {
        KRAnimation.animateView(self, property: .BackgroundColor, endValue: UIColor(CGColor: color), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, nextAnimation: nextAnimation)
    }
    
    func chainBackgroundColor(color: UIColor, duration: Double, function: FunctionType = .Linear, nextAnimation: (() -> [CAAnimation])? = nil) -> [CAAnimation] {
        return KRAnimation.chainView(self, property: .BackgroundColor, endValue: color, duration: duration, function: function, nextAnimation: nextAnimation)
    }
    
    func chainBackgroundColor(color: CGColor, duration: Double, function: FunctionType = .Linear, nextAnimation: (() -> [CAAnimation])? = nil) -> [CAAnimation] {
        return KRAnimation.chainView(self, property: .BackgroundColor, endValue: UIColor(CGColor: color), duration: duration, function: function, nextAnimation: nextAnimation)
    }
    
    // MARK: - Border
    
    func animateBorderColor(color: UIColor, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, nextAnimation: (() -> [CAAnimation])? = nil) {
        KRAnimation.animateView(self, property: .BorderColor, endValue: color, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, nextAnimation: nextAnimation)
    }
    
    func animateBorderColor(color: CGColor, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, nextAnimation: (() -> [CAAnimation])? = nil) {
        KRAnimation.animateView(self, property: .BorderColor, endValue: UIColor(CGColor: color), duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, nextAnimation: nextAnimation)
    }
    
    func chainBorderColor(color: UIColor, duration: Double, function: FunctionType = .Linear, nextAnimation: (() -> [CAAnimation])? = nil) -> [CAAnimation] {
        return KRAnimation.chainView(self, property: .BorderColor, endValue: color, duration: duration, function: function, nextAnimation: nextAnimation)
    }
    
    func chainBorderColor(color: CGColor, duration: Double, function: FunctionType = .Linear, nextAnimation: (() -> [CAAnimation])? = nil) -> [CAAnimation] {
        return KRAnimation.chainView(self, property: .BorderColor, endValue: UIColor(CGColor: color), duration: duration, function: function, nextAnimation: nextAnimation)
    }
    
    func animateBorderWidth(borderWidth: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, nextAnimation: (() -> [CAAnimation])? = nil) {
        KRAnimation.animateView(self, property: .BorderWidth, endValue: borderWidth, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, nextAnimation: nextAnimation)
    }
    
    func chainBorderWidth(borderWidth: CGFloat, duration: Double, function: FunctionType = .Linear, nextAnimation: (() -> [CAAnimation])? = nil) -> [CAAnimation] {
        return KRAnimation.chainView(self, property: .BorderWidth, endValue: borderWidth, duration: duration, function: function, nextAnimation: nextAnimation)
    }
    
    // MARK: - Corner radius
    
    func animateCornerRadius(cornerRadius: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, nextAnimation: (() -> [CAAnimation])? = nil) {
        KRAnimation.animateView(self, property: .CornerRadius, endValue: cornerRadius, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, nextAnimation: nextAnimation)
    }
    
    func chainCornerRadius(cornerRadius: CGFloat, duration: Double, function: FunctionType = .Linear, nextAnimation: (() -> [CAAnimation])? = nil) -> [CAAnimation] {
        return KRAnimation.chainView(self, property: .CornerRadius, endValue: cornerRadius, duration: duration, function: function, nextAnimation: nextAnimation)
    }
    
    // MARK: - Opacity
    
    func animateOpacity(opacity: Float, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, nextAnimation: (() -> [CAAnimation])? = nil) {
        KRAnimation.animateView(self, property: .Opacity, endValue: opacity, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, nextAnimation: nextAnimation)
    }
    
    func chainOpacity(opacity: Float, duration: Double, function: FunctionType = .Linear, nextAnimation: (() -> [CAAnimation])? = nil) -> [CAAnimation] {
        return KRAnimation.chainView(self, property: .Opacity, endValue: opacity, duration: duration, function: function, nextAnimation: nextAnimation)
    }
    
    func animateAlpha(alpha: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, nextAnimation: (() -> [CAAnimation])? = nil) {
        KRAnimation.animateView(self, property: .Alpha, endValue: alpha, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, nextAnimation: nextAnimation)
    }
    
    func chainAlpha(alpha: CGFloat, duration: Double, function: FunctionType = .Linear, nextAnimation: (() -> [CAAnimation])? = nil) -> [CAAnimation] {
        return KRAnimation.chainView(self, property: .Alpha, endValue: alpha, duration: duration, function: function, nextAnimation: nextAnimation)
    }
    
    // MARK: - Shadow
    
    func animateShadowColor(shadowColor: UIColor, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, nextAnimation: (() -> [CAAnimation])? = nil) {
        KRAnimation.animateView(self, property: .ShadowColor, endValue: shadowColor.CGColor, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, nextAnimation: nextAnimation)
    }
    
    func animateShadowColor(shadowColor: CGColor, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, nextAnimation: (() -> [CAAnimation])? = nil) {
        KRAnimation.animateView(self, property: .ShadowColor, endValue: shadowColor, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, nextAnimation: nextAnimation)
    }
    
    func chainShadowColor(shadowColor: UIColor, duration: Double, function: FunctionType = .Linear, nextAnimation: (() -> [CAAnimation])? = nil) -> [CAAnimation] {
        return KRAnimation.chainView(self, property: .ShadowColor, endValue: shadowColor.CGColor, duration: duration, function: function, nextAnimation: nextAnimation)
    }
    
    func chainShadowColor(shadowColor: CGColor, duration: Double, function: FunctionType = .Linear, nextAnimation: (() -> [CAAnimation])? = nil) -> [CAAnimation] {
        return KRAnimation.chainView(self, property: .ShadowColor, endValue: shadowColor, duration: duration, function: function, nextAnimation: nextAnimation)
    }
    
    func animateShadowOffset(shadowOffset: CGSize, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, nextAnimation: (() -> [CAAnimation])? = nil) {
        let endValue = NSValue(CGSize: shadowOffset)
        KRAnimation.animateView(self, property: .ShadowOffset, endValue: endValue, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, nextAnimation: nextAnimation)
    }

    func chainShadowOffset(shadowOffset: CGSize, duration: Double, function: FunctionType = .Linear, nextAnimation: (() -> [CAAnimation])? = nil) -> [CAAnimation] {
        let endValue = NSValue(CGSize: shadowOffset)
        return KRAnimation.chainView(self, property: .ShadowOffset, endValue: endValue, duration: duration, function: function, nextAnimation: nextAnimation)
    }
    
    func animateShadowOpacity(shadowOpacity: Float, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, nextAnimation: (() -> [CAAnimation])? = nil) {
        KRAnimation.animateView(self, property: .ShadowOpacity, endValue: shadowOpacity, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, nextAnimation: nextAnimation)
    }
    
    func chainShadowOpacity(shadowOpacity: Float, duration: Double, function: FunctionType = .Linear, nextAnimation: (() -> [CAAnimation])? = nil) -> [CAAnimation] {
        return KRAnimation.chainView(self, property: .ShadowOpacity, endValue: shadowOpacity, duration: duration, function: function, nextAnimation: nextAnimation)
    }
    
    // TODO: Implementation for shadow path
    
    func animateShadowRadius(shadowRadius: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, nextAnimation: (() -> [CAAnimation])? = nil) {
        KRAnimation.animateView(self, property: .ShadowRadius, endValue: shadowRadius, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, nextAnimation: nextAnimation)
    }
    
    func chainShadowRadius(shadowRadius: CGFloat, duration: Double, function: FunctionType = .Linear, nextAnimation: (() -> [CAAnimation])? = nil) -> [CAAnimation] {
        return KRAnimation.chainView(self, property: .ShadowRadius, endValue: shadowRadius, duration: duration, function: function, nextAnimation: nextAnimation)
    }


    // MARK: - Transform
    
    // MARK: - Scale
    
    func animateScaleX(x: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, nextAnimation: (() -> [CAAnimation])? = nil) {
        KRAnimation.animateView(self, property: .ScaleX, endValue: x, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, nextAnimation: nextAnimation)
    }
    
    func chainScaleX(x: CGFloat, duration: Double, function: FunctionType = .Linear, nextAnimation: (() -> [CAAnimation])? = nil) -> [CAAnimation] {
        return KRAnimation.chainView(self, property: .ScaleX, endValue: x, duration: duration, function: function, nextAnimation: nextAnimation)
    }
    
    func animateScaleY(y: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, nextAnimation: (() -> [CAAnimation])? = nil) {
        KRAnimation.animateView(self, property: .ScaleY, endValue: y, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, nextAnimation: nextAnimation)
    }
    
    func chainScaleY(y: CGFloat, duration: Double, function: FunctionType = .Linear, nextAnimation: (() -> [CAAnimation])? = nil) -> [CAAnimation] {
        return KRAnimation.chainView(self, property: .ScaleY, endValue: y, duration: duration, function: function, nextAnimation: nextAnimation)
    }
    
    // MARK: - Rotation
    
    // MARK: - Translation
    
    // MARK: - Z Position
    
    
    
    
    
    // MARK: - Delayed animation
    
    func after(delay: Double) -> DelayedAnimation {
        return DelayedAnimation(view: self, delay: delay)
    }
    
}
