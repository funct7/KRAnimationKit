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
    
    func animateX(x: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, nextAnimation: (() -> [CAAnimation])? = nil) {
        KRAnimation.animateView(self, property: .OriginX, endValue: x, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, nextAnimation: nextAnimation)
    }
    
    func chainX(x: CGFloat, duration: Double, function: FunctionType = .Linear, nextAnimation: (() -> [CAAnimation])? = nil) -> [CAAnimation] {
        return KRAnimation.chainView(self, property: .OriginX, endValue: x, duration: duration, function: function, nextAnimation: nextAnimation)
    }
    
    func animateY(y: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, nextAnimation: (() -> [CAAnimation])? = nil) {
        KRAnimation.animateView(self, property: .OriginY, endValue: y, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, nextAnimation: nextAnimation)
    }
    
    func chainY(y: CGFloat, duration: Double, function: FunctionType = .Linear, nextAnimation: (() -> [CAAnimation])? = nil) -> [CAAnimation] {
        return KRAnimation.chainView(self, property: .OriginY, endValue: y, duration: duration, function: function, nextAnimation: nextAnimation)
    }
    
    func animateOrigin(x: CGFloat, _ y: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, nextAnimation: (() -> [CAAnimation])? = nil) {
        let endValue = NSValue(CGPoint: CGPointMake(x, y))
        KRAnimation.animateView(self, property: .Origin, endValue: endValue, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, nextAnimation: nextAnimation)
    }
    
    func chainOrigin(origin: CGPoint, duration: Double, function: FunctionType = .Linear, nextAnimation: (() -> [CAAnimation])? = nil) -> [CAAnimation] {
        let endValue = NSValue(CGPoint: origin)
        return KRAnimation.chainView(self, property: .Origin, endValue: endValue, duration: duration, function: function, nextAnimation: nextAnimation)
    }
    
    // MARK: - Size
    
    func animateWidth(width: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, nextAnimation: (() -> [CAAnimation])? = nil) {
        KRAnimation.animateView(self, property: .SizeWidth, endValue: width, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, nextAnimation: nextAnimation)
    }
    
    func chainWidth(width: CGFloat, duration: Double, function: FunctionType = .Linear, nextAnimation: (() -> [CAAnimation])? = nil) -> [CAAnimation] {
        return KRAnimation.chainView(self, property: .SizeWidth, endValue: width, duration: duration, function: function, nextAnimation: nextAnimation)
    }
    
    func animateHeight(height: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, nextAnimation: (() -> [CAAnimation])? = nil) {
        KRAnimation.animateView(self, property: .SizeHeight, endValue: height, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, nextAnimation: nextAnimation)
    }
    
    func chainHeight(height: CGFloat, duration: Double, function: FunctionType = .Linear, nextAnimation: (() -> [CAAnimation])? = nil) -> [CAAnimation] {
        return KRAnimation.chainView(self, property: .SizeHeight, endValue: height, duration: duration, function: function, nextAnimation: nextAnimation)
    }
    
    func animateSize(width: CGFloat, _ height: CGFloat, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, nextAnimation: (() -> [CAAnimation])? = nil) {
        let endValue = NSValue(CGSize: CGSizeMake(width, height))
        KRAnimation.animateView(self, property: .Size, endValue: endValue, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, nextAnimation: nextAnimation)
    }
    
    func chainSize(size: CGSize, duration: Double, function: FunctionType = .Linear, nextAnimation: (() -> [CAAnimation])? = nil) -> [CAAnimation] {
        let endValue = NSValue(CGSize: size)
        return KRAnimation.chainView(self, property: .Size, endValue: endValue, duration: duration, function: function, nextAnimation: nextAnimation)
    }
    
    
    // MARK: - Frame
    
    func animateFrame(x: CGFloat, _ y: CGFloat, _ w: CGFloat, _ h: CGFloat, duration: Double, function: FunctionType, reverses: Bool = false, repeatCount: Float = 0.0, nextAnimation: (() -> [CAAnimation])? = nil) {
        let endValue = NSValue(CGRect: CGRectMake(x, y, w, h))
        KRAnimation.animateView(self, property: .Frame, endValue: endValue, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, nextAnimation: nextAnimation)
    }
    
    func animateFrame(origin: CGPoint, _ size: CGSize, duration: Double, function: FunctionType, reverses: Bool = false, repeatCount: Float = 0.0, nextAnimation: (() -> [CAAnimation])? = nil) {
        let endValue = NSValue(CGRect: CGRect(origin: origin, size: size))
        KRAnimation.animateView(self, property: .Frame, endValue: endValue, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, nextAnimation: nextAnimation)
    }
    
    func animateFrame(frame: CGRect, duration: Double, function: FunctionType, reverses: Bool = false, repeatCount: Float = 0.0, nextAnimation: (() -> [CAAnimation])? = nil) {
        let endValue = NSValue(CGRect: frame)
        KRAnimation.animateView(self, property: .Frame, endValue: endValue, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, nextAnimation: nextAnimation)
    }
    
    func chainFrame(x: CGFloat, _ y: CGFloat, _ w: CGFloat, _ h: CGFloat, duration: Double, function: FunctionType = .Linear, nextAnimation: (() -> [CAAnimation])? = nil) -> [CAAnimation] {
        let endValue = NSValue(CGRect: CGRectMake(x, y, w, h))
        return KRAnimation.chainView(self, property: .Frame, endValue: endValue, duration: duration, function: function, nextAnimation: nextAnimation)
    }
    
    func chainFrame(origin: CGPoint, _ size: CGSize, duration: Double, function: FunctionType = .Linear, nextAnimation: (() -> [CAAnimation])? = nil) -> [CAAnimation] {
        let endValue = NSValue(CGRect: CGRect(origin: origin, size: size))
        return KRAnimation.chainView(self, property: .Frame, endValue: endValue, duration: duration, function: function, nextAnimation: nextAnimation)
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
        KRAnimation.animateView(self, property: .BackgroundColor, endValue: color.CGColor, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, nextAnimation: nextAnimation)
    }
    
    func animateBackgroundColor(color: CGColor, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, nextAnimation: (() -> [CAAnimation])? = nil) {
        KRAnimation.animateView(self, property: .BackgroundColor, endValue: color, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, nextAnimation: nextAnimation)
    }
    
    func chainBackgroundColor(color: UIColor, duration: Double, function: FunctionType = .Linear, nextAnimation: (() -> [CAAnimation])? = nil) -> [CAAnimation] {
        return KRAnimation.chainView(self, property: .BackgroundColor, endValue: color.CGColor, duration: duration, function: function, nextAnimation: nextAnimation)
    }
    
    func chainBackgroundColor(color: CGColor, duration: Double, function: FunctionType = .Linear, nextAnimation: (() -> [CAAnimation])? = nil) -> [CAAnimation] {
        return KRAnimation.chainView(self, property: .BackgroundColor, endValue: color, duration: duration, function: function, nextAnimation: nextAnimation)
    }
    
    // MARK: - Border
    
    func animateBorderColor(color: UIColor, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, nextAnimation: (() -> [CAAnimation])? = nil) {
        KRAnimation.animateView(self, property: .BorderColor, endValue: color.CGColor, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, nextAnimation: nextAnimation)
    }
    
    func animateBorderColor(color: CGColor, duration: Double, function: FunctionType = .Linear, reverses: Bool = false, repeatCount: Float = 0.0, nextAnimation: (() -> [CAAnimation])? = nil) {
        KRAnimation.animateView(self, property: .BorderColor, endValue: color, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, nextAnimation: nextAnimation)
    }
    
    func chainBorderColor(color: UIColor, duration: Double, function: FunctionType = .Linear, nextAnimation: (() -> [CAAnimation])? = nil) -> [CAAnimation] {
        return KRAnimation.chainView(self, property: .BorderColor, endValue: color.CGColor, duration: duration, function: function, nextAnimation: nextAnimation)
    }
    
    func chainBorderColor(color: CGColor, duration: Double, function: FunctionType = .Linear, nextAnimation: (() -> [CAAnimation])? = nil) -> [CAAnimation] {
        return KRAnimation.chainView(self, property: .BorderColor, endValue: color, duration: duration, function: function, nextAnimation: nextAnimation)
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
    
    // MARK: - Internal
    
    internal func setProperty(property: AnimatableProperty, withEndValue endValue: AnyObject) {
        switch property {
        case .OriginX: frame.origin.x = endValue as! CGFloat
        case .OriginY: frame.origin.y = endValue as! CGFloat
        case .Origin: frame.origin = (endValue as! NSValue).CGPointValue()
        case .SizeWidth: frame.size.width = endValue as! CGFloat
        case .SizeHeight: frame.size.height = endValue as! CGFloat
        case .Size: frame.size = (endValue as! NSValue).CGSizeValue()
        case .Frame: frame = (endValue as! NSValue).CGRectValue()
        case .CenterX: center.x = endValue as! CGFloat
        case .CenterY: center.y = endValue as! CGFloat
        case .Center: center = (endValue as! NSValue).CGPointValue()
        case .PositionX: layer.position.x = endValue as! CGFloat
        case .PositionY: layer.position.y = endValue as! CGFloat
        case .Position: layer.position = (endValue as! NSValue).CGPointValue()
        case .ScaleX: layer.transform.m11 = endValue as! CGFloat
        case .ScaleY: layer.transform.m22 = endValue as! CGFloat
        case .BackgroundColor: backgroundColor = UIColor(CGColor: (endValue as! CGColor))
        case .BorderColor: layer.borderColor = endValue as! CGColor
        case .BorderWidth: layer.borderWidth = endValue as! CGFloat
        case .CornerRadius: layer.cornerRadius = endValue as! CGFloat
        case .Opacity: layer.opacity = endValue as! Float
        case .Alpha: alpha = endValue as! CGFloat
        default: break
        }
    }
}
