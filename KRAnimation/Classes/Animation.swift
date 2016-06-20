//
//  Animation.swift
//  KRAnimation
//
//  Created by Joshua Park on 6/17/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

public enum AnimatableKeyPath {
    case BackgroundColor
    case BorderColor
    case BorderWidth
    case Bounds
    case Hidden
    case Mask
    case MasksToBounds
    case Opacity
    case Position
    case ShadowColor
    case ShadowOffset
    case ShadowOpacity
    case ShadowPath
    case ShadowRadius
    case Transform
    case ZPosition
}

public enum FunctionType {
    case Linear
    
    case EaseInCubic
    case EaseOutCubic
    case EaseInOutCubic
}

private enum AnimatableProperty {
    case Origin
    case OriginX
    case OriginY
    
    case Size
    case SizeWidth
    case SizeHeight
    
    case Frame
    
    case Center
    case CenterX
    case CenterY
    
    case ScaleX
    case ScaleY
    case Scale
    case Rotation
}

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
    
    // Origin
    
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
    
    // Size
    
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
    
    
    // Frame
    
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
    
    // Center
    
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
    
    // Scale
    
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
    
    // Rotation
    
    
    
    // Delayed animation
    
    func after(delay: Double) -> DelayedAnimation {
        return DelayedAnimation(view: self, delay: delay)
    }
    
    // Private 
    
    private func setProperty(property: AnimatableProperty, withEndValue endValue: AnyObject) {
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
        case .ScaleX: layer.transform.m11 = endValue as! CGFloat
        case .ScaleY: layer.transform.m22 = endValue as! CGFloat
        default: break
        }
    }
}

public struct DelayedAnimation {
    let view: UIView
    let delay: Double
    let preAnim: CABasicAnimation
    
    init(view: UIView, delay: Double) {
        self.view = view
        self.delay = delay
        
        preAnim = CABasicAnimation(keyPath: "position.x")
        preAnim.duration = delay
        preAnim.fromValue = view.center.x
        preAnim.toValue = view.center.x
        preAnim.fillMode = kCAFillModeForwards
        preAnim.removedOnCompletion = false
        
        view.center.x = view.center.x
    }
    
    public func animateX(x: CGFloat, duration: Double, function: FunctionType, reverses: Bool = false, repeatCount: Float = 0.0, nextAnimation: (() -> [CAAnimation])? = nil) {
        KRAnimation.animateView(view, property: .OriginX, endValue: x, duration: duration, function: function, reverses: reverses, repeatCount: repeatCount, nextAnimation: nextAnimation)
    }
    
    public func chainX(x: CGFloat, duration: Double, function: FunctionType, nextAnimation: (() -> [CAAnimation])? = nil) -> [CAAnimation] {
        return KRAnimation.chainView(view, property: .OriginX, endValue: x, duration: duration, function: function, nextAnimation: nextAnimation)
    }
}

internal struct KRAnimation {
    private static func getScaledValue(_ b: CGFloat, _ e: CGFloat, _ scale: CGFloat) -> CGFloat {
        return b + scale * (e - b)
    }

    private static func animateView(view: UIView, property: AnimatableProperty, endValue: AnyObject, duration: Double, function: FunctionType, reverses: Bool, repeatCount: Float , nextAnimation: (() -> [CAAnimation])?) {
        var anim = getKeyframeAnimationForView(view, property: property, endValue: endValue, duration: duration, function: function)
        view.setProperty(property, withEndValue: endValue)
        
        let animGroup = getAnimGroupWithAnimations([anim as! CAAnimation], duration: duration, reverses: reverses, repeatCount: repeatCount, nextAnimation: nextAnimation)
        view.layer.addAnimation(animGroup, forKey: nil)
    }
    
    private static func chainView(view: UIView, property: AnimatableProperty, endValue: AnyObject, duration: Double, function: FunctionType, nextAnimation: (() -> [CAAnimation])?) -> [CAAnimation] {
        var animations = [CAAnimation]()
        
        switch property {
        case .Frame:
            let endFrame = (endValue as! NSValue).CGRectValue()
            let endOrigin = NSValue(CGPoint: endFrame.origin)
            let endSize = NSValue(CGSize: endFrame.size)
            
            let animPos = getKeyframeAnimationForView(view, property: .Origin, endValue: endOrigin, duration: duration, function: function)
            let animSize = getKeyframeAnimationForView(view, property: .Size, endValue: endSize, duration: duration, function: function)
            
            let anim = CAAnimationGroup()
            anim.animations = [animPos, animSize]
            anim.duration = duration
            anim.fillMode = kCAFillModeForwards
            anim.removedOnCompletion = false
          
            view.setProperty(.Frame, withEndValue: endValue)
            
            animations.append(anim)
        default:
            let anim = getKeyframeAnimationForView(view, property: property, endValue: endValue, duration: duration, function: function)
            view.setProperty(property, withEndValue: endValue)
            
            animations.append(anim)
        }
        if let chainedAnimation = nextAnimation { animations += chainedAnimation() }
        
        return animations
    }
    
    private static func getKeyframeAnimationForView(view: UIView, property: AnimatableProperty, endValue: AnyObject, duration: Double, function: FunctionType) -> CAKeyframeAnimation {
        var anim: CAKeyframeAnimation!
        var f: ((CGFloat) -> Any)!
        
        switch property {
            // Origin
        case .OriginX:
            anim = CAKeyframeAnimation(keyPath: "position.x")
            
            let b = view.center.x
            let e = (endValue as! CGFloat) + view.frame.width / 2.0
            f = { return getScaledValue(b, e, $0) }
        case .OriginY:
            anim = CAKeyframeAnimation(keyPath: "position.y")
            
            let b = view.center.y
            let e = (endValue as! CGFloat) + view.frame.height / 2.0
            f = { return getScaledValue(b, e, $0) }
        case .Origin:
            anim = CAKeyframeAnimation(keyPath: "position")
            
            let e = (endValue as! NSValue).CGPointValue()
            let bX = view.center.x
            let bY = view.center.y
            let eX = e.x + view.frame.width / 2.0
            let eY = e.y + view.frame.height / 2.0
            
            f = { return NSValue(CGPoint: CGPointMake(getScaledValue(bX, eX, $0), getScaledValue(bY, eY, $0))) }
            
            // Size
        case .SizeWidth:
            anim = CAKeyframeAnimation(keyPath: "bounds.size.width")
            
            let b = view.bounds.width
            let e = endValue as! CGFloat
            
            f = { return getScaledValue(b, e, $0) }
        case .SizeHeight:
            anim = CAKeyframeAnimation(keyPath: "bounds.size.height")
            
            let b = view.bounds.height
            let e = endValue as! CGFloat
            
            f = { return getScaledValue(b, e, $0) }
        case .Size:
            anim = CAKeyframeAnimation(keyPath: "bounds.size")
            
            let e = (endValue as! NSValue).CGSizeValue()
            let bW = view.bounds.width
            let bH = view.bounds.height
            let eW = e.width
            let eH = e.height
            
            f = { return NSValue(CGSize: CGSizeMake(getScaledValue(bW, eW, $0), getScaledValue(bH, eH, $0))) }
            
            // Frame
        case .Frame:
            fatalError("Keyframe animation for `frame` unavailable. Get separate animations for origin, size and bind into CAAnimationGroup instead.")
            
            // Center
        case .CenterX:
            anim = CAKeyframeAnimation(keyPath: "position.x")
            
            let b = view.center.x
            let e = endValue as! CGFloat
            
            f = { return getScaledValue(b, e, $0) }
        case .CenterY:
            anim = CAKeyframeAnimation(keyPath: "position.y")
            
            let b = view.center.y
            let e = endValue as! CGFloat
            
            f = { return getScaledValue(b, e, $0) }
        case .Center:
            anim = CAKeyframeAnimation(keyPath: "position")
            
            let e = (endValue as! NSValue).CGPointValue()
            let bX = view.center.x
            let eX = e.x
            let bY = view.center.y
            let eY = e.y
            
            f = { return NSValue(CGPoint: CGPointMake(getScaledValue(bX, eX, $0), getScaledValue(bY, eY, $0))) }
            
            // Scale
        case .ScaleX:
            anim = CAKeyframeAnimation(keyPath: "transform.scale.x")
            
            let b = view.layer.transform.m11
            let e = endValue as! CGFloat
            
            f = { return getScaledValue(b, e, $0) }
            
        case .ScaleY:
            anim = CAKeyframeAnimation(keyPath: "transform.scale.y")
            
            let b = view.layer.transform.m22
            let e = endValue as! CGFloat
            
            f = { return getScaledValue(b, e, $0) }
        default:
            fatalError("Check property type: \(property)")
        }
        
        var values = [AnyObject]()
        let steps = 60 * duration
        
        for i in 0 ... Int(steps) {
            var scale: CGFloat!
            switch function {
            case .Linear:
                scale = CGFloat(TimingFunction.Linear(rt: Double(i) / steps, b: 0.0, c: 1.0))
            case .EaseInCubic:
                scale = CGFloat(TimingFunction.EaseInCubic(rt: Double(i) / steps, b: 0.0, c: 1.0))
            case .EaseOutCubic:
                scale = CGFloat(TimingFunction.EaseOutCubic(rt: Double(i) / steps, b: 0.0, c: 1.0))
            case .EaseInOutCubic:
                scale = CGFloat(TimingFunction.EaseInOutCubic(rt: Double(i) / steps, b: 0.0, c: 1.0))
            }
            
            switch property {
            case .OriginX, .OriginY, .SizeWidth, .SizeHeight, .CenterX, .CenterY, .ScaleX, .ScaleY:
                values.append(f(scale) as! CGFloat)
            case .Origin, .Size, .Center:
                values.append(f(scale) as! NSValue)
            default:
                break
            }
        }
        
        anim.duration = duration
        anim.fillMode = kCAFillModeForwards
        anim.removedOnCompletion = false
        anim.values = values
        return anim
    }
    
    private static func getAnimGroupWithAnimations(animations: [CAAnimation], duration: Double, reverses: Bool, repeatCount: Float, nextAnimation: (() -> [CAAnimation])?) -> CAAnimationGroup {
        var totalDuration = duration
        var animations = animations
        
        if let _ = nextAnimation {
            for ani in nextAnimation!() {
                ani.beginTime += totalDuration
                totalDuration += ani.duration
                animations.append(ani)
            }
        }
        
        let animGroup = CAAnimationGroup()
        animGroup.animations = animations
        animGroup.duration = totalDuration
        animGroup.repeatCount = repeatCount
        animGroup.autoreverses = reverses
        
        return animGroup
    }
}