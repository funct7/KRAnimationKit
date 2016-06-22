//
//  AnimationDescriptor.swift
//  KRAnimation
//
//  Created by Joshua Park on 6/17/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

public enum AnimatableProperty {
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
    
    case PositionX
    case PositionY
    case Position
    
    case BackgroundColor
    
    case BorderColor
    case BorderWidth
    
    case CornerRadius
    
    case Opacity
    case Alpha
    
    case ShadowColor
    case ShadowOffset
    case ShadowOpacity
    case ShadowPath
    case ShadowRadius
    
    case Transform
    
    case RotationX
    case RotationY
    case RotationZ
    case Rotation
    
    case ScaleX
    case ScaleY
    case ScaleZ
    case Scale
    
    case TranslationX
    case TranslationY
    case TranslationZ
    case Translation
    
    case ZPosition
}

public struct AnimationDescriptor {
    let view: UIView
    let delay: Double
    let property: AnimatableProperty
    let endValue: AnyObject
    let duration: Double
    let function: FunctionType
    
    public func getFrameAnimations() -> (origin: AnimationDescriptor, size: AnimationDescriptor) {
        let frame = (endValue as! NSValue).CGRectValue()
        let animOrigin = AnimationDescriptor(view: view, delay: delay, property: .Origin, endValue: NSValue(CGPoint: frame.origin), duration: duration, function: function)
        let animSize = AnimationDescriptor(view: view, delay: delay, property: .Size, endValue: NSValue(CGSize: frame.size), duration: duration, function: function)
        
        return (origin: animOrigin, size: animSize)
    }
}

internal extension CGColor {
    func getUIColor() -> UIColor {
        return UIColor(CGColor: self)
    }
}

internal extension UIView {
    func update(properties: ViewProperties) {
        frame = properties.frame
        backgroundColor = properties.backgroundColor
        layer.borderColor = properties.borderColor?.CGColor
        layer.borderWidth = properties.borderWidth
        layer.cornerRadius = properties.cornerRadius
        layer.opacity = properties.opacity
        layer.shadowColor = properties.shadowColor?.CGColor
        layer.shadowOffset = properties.shadowOffset
        layer.shadowOpacity = properties.shadowOpacity
        layer.shadowPath = properties.shadowPath
        layer.shadowRadius = properties.shadowRadius
        layer.transform = properties.transform
    }
}

internal class ViewProperties: NSObject {
    var origin: CGPoint
    var size: CGSize
    var frame: CGRect {
        get {
            return CGRect(origin: origin, size: size)
        }
        set {
            origin = newValue.origin
            size = newValue.size
        }
    }
    
    var center: CGPoint {
        get {
            return position
        }
        set {
            position = newValue
        }
    }
    var position:CGPoint

    var backgroundColor: UIColor?
    
    var borderColor: UIColor?
    var borderWidth: CGFloat
    var cornerRadius: CGFloat
    
    var opacity: Float
    var alpha: CGFloat {
        get {
            return CGFloat(opacity)
        }
        set {
            opacity = Float(newValue)
        }
    }
    
    var shadowColor: UIColor?
    var shadowOffset: CGSize
    var shadowOpacity: Float
    var shadowPath: CGPath?
    var shadowRadius: CGFloat
    
    var transform: CATransform3D
    
    init(view: UIView) {
        frame = view.frame
        position = view.layer.position
        backgroundColor = view.layer.backgroundColor?.getUIColor()
        borderColor = view.layer.borderColor?.getUIColor()
        borderWidth = view.layer.borderWidth
        cornerRadius = view.layer.cornerRadius
        opacity = view.layer.opacity
        
        shadowColor = view.layer.shadowColor?.getUIColor()
        shadowOffset = view.layer.shadowOffset
        shadowOpacity = view.layer.shadowOpacity
        shadowPath = view.layer.shadowPath
        shadowRadius = view.layer.shadowRadius
        
        transform = view.layer.transform
    }
}

public struct KRAnimation {
    public static func chain(animDescriptors: [AnimationDescriptor]..., reverses: Bool = false, repeatCount: Double = 1.0, completion: (() -> Void)? = nil) {
        // FIXME: - Change in multi view support
        /**************************************/
        let view = animDescriptors[0][0].view
        guard animDescriptors.flatten().reduce(true, combine: { $0.0 && ($0.1.view == view) }) == true else { fatalError() }
        
        var updatedProperties = ViewProperties(view: view)
        var totalDuration = 0.0
        var chainedAnims = [CAAnimation]()
        /**************************************/
        
        CATransaction.begin()
        CATransaction.setCompletionBlock {
            view.update(updatedProperties)
            view.layer.removeAllAnimations()
            completion?()
        }
        
        for animDescArray in animDescriptors {
            if animDescArray.count == 1 {
                let animDesc = animDescArray[0]
                
                let anim = getAnimation(animDesc, viewProperties: updatedProperties, setDelay: true)
                anim.beginTime += totalDuration
                totalDuration = anim.beginTime + anim.duration
                
                chainedAnims.append(anim)
            } else {
                var groupedAnimations = [CAKeyframeAnimation]()
                
                let animationGroup = CAAnimationGroup()
                animationGroup.beginTime = totalDuration + animArray[0].delay
                animationGroup.duration = animArray[0].duration
                animationGroup.fillMode = kCAFillModeForwards
                animationGroup.removedOnCompletion = false
                
                for anim in animArray {
                    guard anim.duration == animationGroup.duration else { fatalError("All animations in an animation group must have the same duration.") }
                    
                    let keyframeAnimation = getKeyframeAnimation(anim)
                    keyframeAnimation.values = getValues(updatedValues, animation: anim)
                    
                    groupedAnimations.append(keyframeAnimation)

                    updateValues(updatedValues, animation: anim)
                }
                
                animationGroup.animations = groupedAnimations
                
                totalDuration = animationGroup.beginTime + animationGroup.duration
                chainedAnims.append(animationGroup)
            }
        }
        
        let animGroup = CAAnimationGroup()
        animGroup.duration = totalDuration
        animGroup.animations = chainedAnims
        animGroup.fillMode = kCAFillModeForwards
        animGroup.removedOnCompletion = false
        
        view.layer.addAnimation(animGroup, forKey: nil)
        
        CATransaction.commit()
    }
    
    internal static func getScaledValue(_ b: CGFloat, _ e: CGFloat, _ scale: CGFloat) -> CGFloat {
        return b + scale * (e - b)
    }
    
    internal static func getScaledValue(_ b: Float, _ e: Float, _ scale: CGFloat) -> CGFloat {
        return CGFloat(b) + scale * CGFloat(e - b)
    }
    
    internal static func getScaledValue(_ b: Double, _ e: Double, _ scale: CGFloat) -> CGFloat {
        return CGFloat(b) + scale * CGFloat(e - b)
    }

//    internal static func animateView(view: UIView, property: AnimatableProperty, endValue: AnyObject, duration: Double, function: FunctionType, reverses: Bool, repeatCount: Float , nextAnimation: (() -> [CAAnimation])?) {
//        var anim = getKeyframeAnimationForView(view, property: property, endValue: endValue, duration: duration, function: function)
//        view.setProperty(property, withEndValue: endValue)
//        
//        let animGroup = getAnimGroupWithAnimations([anim as! CAAnimation], duration: duration, reverses: reverses, repeatCount: repeatCount, nextAnimation: nextAnimation)
//        view.layer.addAnimation(animGroup, forKey: nil)
//    }
//    
//    internal static func chainView(view: UIView, property: AnimatableProperty, endValue: AnyObject, duration: Double, function: FunctionType, nextAnimation: (() -> [CAAnimation])?) -> [CAAnimation] {
//        var animations = [CAAnimation]()
//        
//        switch property {
//        case .Frame:
//            let endFrame = (endValue as! NSValue).CGRectValue()
//            let endOrigin = NSValue(CGPoint: endFrame.origin)
//            let endSize = NSValue(CGSize: endFrame.size)
//            
//            let animPos = getKeyframeAnimationForView(view, property: .Origin, endValue: endOrigin, duration: duration, function: function)
//            let animSize = getKeyframeAnimationForView(view, property: .Size, endValue: endSize, duration: duration, function: function)
//            
//            let anim = CAAnimationGroup()
//            anim.animations = [animPos, animSize]
//            anim.duration = duration
//            anim.fillMode = kCAFillModeForwards
//            anim.removedOnCompletion = false
//          
//            view.setProperty(.Frame, withEndValue: endValue)
//            
//            animations.append(anim)
//        default:
//            let anim = getKeyframeAnimationForView(view, property: property, endValue: endValue, duration: duration, function: function)
//            view.setProperty(property, withEndValue: endValue)
//            
//            animations.append(anim)
//        }
//        if let chainedAnimation = nextAnimation { animations += chainedAnimation() }
//        
//        return animations
//    }
    
    private static func getAnimation(animDesc: AnimationDescriptor, viewProperties: ViewProperties, setDelay: Bool) -> CAAnimation {
        if animDesc.property == .Frame {
            var frameAnimations = animDesc.getFrameAnimations()
            
            let animOrigin = getKeyframeAnimation(frameAnimations.origin, viewProperties: viewProperties, setDelay: false)
            let animSize = getKeyframeAnimation(frameAnimations.size, viewProperties: viewProperties, setDelay: false)
            
            let anim = CAAnimationGroup()
            anim.animations = [animOrigin, animSize]
            anim.duration = animDesc.duration
            anim.fillMode = kCAFillModeForwards
            anim.removedOnCompletion = false
            
            if setDelay { anim.beginTime = animDesc.delay }
            
            return anim
        } else {
            let anim = getKeyframeAnimation(animDesc, viewProperties: viewProperties, setDelay: setDelay)
            
            return anim
        }
    }
    
    private static func getKeyframeAnimation(animDesc: AnimationDescriptor, viewProperties: ViewProperties, setDelay: Bool) -> CAKeyframeAnimation {
        var anim: CAKeyframeAnimation!
        switch animDesc.property {
            // Origin
        case .OriginX:
            anim = CAKeyframeAnimation(keyPath: "position.x")
        case .OriginY:
            anim = CAKeyframeAnimation(keyPath: "position.y")
        case .Origin:
            anim = CAKeyframeAnimation(keyPath: "position")
            
            // Size
        case .SizeWidth:
            anim = CAKeyframeAnimation(keyPath: "bounds.size.width")
        case .SizeHeight:
            anim = CAKeyframeAnimation(keyPath: "bounds.size.height")
        case .Size:
            anim = CAKeyframeAnimation(keyPath: "bounds.size")

            // Frame
        case .Frame:
            fatalError("Keyframe animation for `frame` unavailable. Get separate animations for origin, size and bind into CAAnimationGroup instead.")

            // Center & Position
        case .CenterX, .PositionX:
            anim = CAKeyframeAnimation(keyPath: "position.x")
        case .CenterY, .PositionY:
            anim = CAKeyframeAnimation(keyPath: "position.y")
        case .Center, .Position:
            anim = CAKeyframeAnimation(keyPath: "position")

            // Background color
        case .BackgroundColor:
            anim = CAKeyframeAnimation(keyPath: "backgroundColor")
        
            // Border
        case .BorderColor:
            anim = CAKeyframeAnimation(keyPath: "borderColor")
        case .BorderWidth:
            anim = CAKeyframeAnimation(keyPath: "borderWidth")
            
            // Corner radius
        case .CornerRadius:
            anim = CAKeyframeAnimation(keyPath: "cornerRadius")
            
            // Opacity
        case .Opacity, .Alpha:
            anim = CAKeyframeAnimation(keyPath: "opacity")

            // Shadow
        case .ShadowColor:
            anim = CAKeyframeAnimation(keyPath: "shadowColor")
        case .ShadowOffset:
            anim = CAKeyframeAnimation(keyPath: "shadowOffset")
        case .ShadowOpacity:
            anim = CAKeyframeAnimation(keyPath: "shadowOpacity")
        case .ShadowRadius:
            anim = CAKeyframeAnimation(keyPath: "shadowRadius")
        case .ShadowPath:
            fatalError("INCOMPLETE IMPLEMENTATION")
            
            // Transform
        case.Transform:
            fatalError("INCOMPLETE IMPLEMENTATION")
        
            // Rotation
        case .RotationX, .RotationY, .RotationZ, .Rotation:
            fatalError("INCOMPLETE IMPLEMENTATION")
            
            // Scale
        case .ScaleX:
            anim = CAKeyframeAnimation(keyPath: "transform.scale.x")
        case .ScaleY:
            anim = CAKeyframeAnimation(keyPath: "transform.scale.y")
        case .ScaleZ, .Scale:
            fatalError("INCOMPLETE IMPLEMENTATION")
            
            // Translation
        case .TranslationX, .TranslationY, .TranslationZ, .Translation:
            fatalError("INCOMPLETE IMPLEMENTATION")
            
            // Z Position
        case .ZPosition:
            fatalError("INCOMPLETE IMPLEMENTATION")
        }
        
        anim.duration = animDesc.duration
        anim.fillMode = kCAFillModeForwards
        anim.removedOnCompletion = false
        anim.values = getValues(animDesc, viewProperties: viewProperties)
        
        if setDelay { anim.beginTime = animDesc.delay }
        
        return anim
    }
    
    // FIXME: Update values here
    private static func getValues(animDesc: AnimationDescriptor, viewProperties: ViewProperties) -> [AnyObject] {
        var values = [AnyObject]()
        let totalFrames = 60 * animDesc.duration
        var f: ((CGFloat) -> AnyObject)!
        
        switch animDesc.property {
            // Origin
            
        case .OriginX:
            let b = viewProperties.position.x
            let e = (animDesc.endValue as! CGFloat) + viewProperties.size.width / 2.0
            
            f = { return getScaledValue(b, e, $0) }
            
        case .OriginY:
            let b = viewProperties.position.y
            let e = (animDesc.endValue as! CGFloat) + viewProperties.size.height / 2.0
            f = { return getScaledValue(b, e, $0) }
            
        case .Origin:
            let e = (animDesc.endValue as! NSValue).CGPointValue()
            
            let bX = viewProperties.position.x
            let bY = viewProperties.position.y
            
            let eX = e.x + viewProperties.size.width / 2.0
            let eY = e.y + viewProperties.size.height / 2.0
            
            f = { return NSValue(CGPoint: CGPointMake(getScaledValue(bX, eX, $0), getScaledValue(bY, eY, $0))) }

            // Size
            
        case .SizeWidth:
            let b = viewProperties.size.width
            let e = animDesc.endValue as! CGFloat
            
            f = { return getScaledValue(b, e, $0) }

            
        case .SizeHeight:
            let b = viewProperties.size.height
            let e = animDesc.endValue as! CGFloat
            
            f = { return getScaledValue(b, e, $0) }

        case .Size:
            let e = (animDesc.endValue as! NSValue).CGSizeValue()
            
            let bW = viewProperties.size.width
            let bH = viewProperties.size.height
            let eW = e.width
            let eH = e.height
            
            f = { return NSValue(CGSize: CGSizeMake(getScaledValue(bW, eW, $0), getScaledValue(bH, eH, $0))) }
        
            // Frame
            
        case .Frame:
            fatalError("Unable to get values for `frame` directly. Set values for `origin` and `size` separately instead.")
         
            // Center, Position
            
        case .CenterX, .PositionX:
            let b = viewProperties.position.x
            let e = animDesc.endValue as! CGFloat
            
            f = { return getScaledValue(b, e, $0) }
        case .CenterY, .PositionY:
            let b = viewProperties.position.y
            let e = animDesc.endValue as! CGFloat
            
            f = { return getScaledValue(b, e, $0) }
        case .Center, .Position:
            let e = (animDesc.endValue as! NSValue).CGPointValue()
            let bX = viewProperties.position.x
            let eX = e.x
            let bY = viewProperties.position.y
            let eY = e.y
            
            f = { return NSValue(CGPoint: CGPointMake(getScaledValue(bX, eX, $0), getScaledValue(bY, eY, $0))) }
            
            // Background color
            
        case .BackgroundColor:
            let b = viewProperties.backgroundColor ?? UIColor.clearColor()
            let e = animDesc.endValue as! UIColor
            
            var bComp = [CGFloat](count: 4, repeatedValue: 0.0)
            var eComp = [CGFloat](count: 4, repeatedValue: 0.0)
            
            b.getRed(&bComp[0], green: &bComp[1], blue: &bComp[2], alpha: &bComp[3])
            e.getRed(&eComp[0], green: &eComp[1], blue: &eComp[2], alpha: &eComp[3])
            f = { return UIColor(red: getScaledValue(bComp[0], eComp[0], $0), green: getScaledValue(bComp[1], eComp[1], $0), blue: getScaledValue(bComp[2], eComp[2], $0), alpha: getScaledValue(bComp[3], eComp[3], $0)).CGColor }
            
            // Border
            
        case .BorderColor:
            let b = viewProperties.borderColor ?? UIColor.clearColor()
            let e = animDesc.endValue as! UIColor
            
            var bComp = [CGFloat](count: 4, repeatedValue: 0.0)
            var eComp = [CGFloat](count: 4, repeatedValue: 0.0)
            
            b.getRed(&bComp[0], green: &bComp[1], blue: &bComp[2], alpha: &bComp[3])
            e.getRed(&eComp[0], green: &eComp[1], blue: &eComp[2], alpha: &eComp[3])
            
            f = { return UIColor(red: getScaledValue(bComp[0], eComp[0], $0), green: getScaledValue(bComp[1], eComp[1], $0), blue: getScaledValue(bComp[2], eComp[2], $0), alpha: getScaledValue(bComp[3], eComp[3], $0)).CGColor }
        case .BorderWidth:
            let b = viewProperties.borderWidth
            let e = animDesc.endValue as! CGFloat
            
            f = { return getScaledValue(b, e, $0) }

            // Corner radius
            
        case .CornerRadius:
            let b = viewProperties.cornerRadius
            let e = animDesc.endValue as! CGFloat
            
            f = { return getScaledValue(b, e, $0) }

            // Opacity
            
        case .Opacity, .Alpha:
            let b = viewProperties.opacity
            let e = animDesc.endValue as! Float
            
            f = { return getScaledValue(b, e, $0) }
            
            // Shadow
            
        case .ShadowColor:
            let b = viewProperties.shadowColor ?? UIColor.clearColor()
            let e = animDesc.endValue as! UIColor
            
            var bComp = [CGFloat](count: 4, repeatedValue: 0.0)
            var eComp = [CGFloat](count: 4, repeatedValue: 0.0)
            
            b.getRed(&bComp[0], green: &bComp[1], blue: &bComp[2], alpha: &bComp[3])
            e.getRed(&eComp[0], green: &eComp[1], blue: &eComp[2], alpha: &eComp[3])
            
            f = { return UIColor(red: getScaledValue(bComp[0], eComp[0], $0), green: getScaledValue(bComp[1], eComp[1], $0), blue: getScaledValue(bComp[2], eComp[2], $0), alpha: getScaledValue(bComp[3], eComp[3], $0)).CGColor }
            
        case .ShadowOffset:
            let b = viewProperties.shadowOffset
            let e = (animDesc.endValue as! NSValue).CGSizeValue()
            
            f = { return NSValue(CGSize: CGSizeMake(getScaledValue(b.width, e.width, $0), getScaledValue(b.height, e.height, $0))) }
            
        case .ShadowOpacity:
            let b = viewProperties.shadowOpacity
            let e = animDesc.endValue as! Float
            
            f = { return getScaledValue(b, e, $0) }
        
        case .ShadowPath:
            fatalError("INCOMPLETE IMPLEMENTATION")
        
        case .ShadowRadius:
            let b = viewProperties.shadowRadius
            let e = animDesc.endValue as! CGFloat
            
            f = { return getScaledValue(b, e, $0) }
            
            // Transform
            
        case .Transform:
            fatalError("INCOMPLETE IMPLEMENTATION")
            
            // Rotation
            
        case .RotationX, .RotationY, .RotationZ, .Rotation:
            fatalError("INCOMPLETE IMPLEMENTATION")
            
            // Scale
        case .ScaleX:
            let b = viewProperties.transform.m11
            let e = animDesc.endValue as! CGFloat
            
            f = { return getScaledValue(b, e, $0) }
            
        case .ScaleY:
            let b = viewProperties.transform.m22
            let e = animDesc.endValue as! CGFloat
            
            f = { return getScaledValue(b, e, $0) }
            
        case .ScaleZ, .Scale:
            fatalError("INCOMPLETE IMPLEMENTATION")
            
        case .TranslationX, .TranslationY, .TranslationZ, .Translation:
            fatalError("INCOMPLETE IMPLEMENTATION")
            
        case .ZPosition:
            fatalError("INCOMPLETE IMPLEMENTATION")
            
        }
        
        for i in 0 ... Int(totalFrames) {
            var scale: CGFloat!
            switch animDesc.function {
            case .Linear:
                scale = CGFloat(TimingFunction.Linear(rt: Double(i) / totalFrames, b: 0.0, c: 1.0))
            case .EaseInCubic:
                scale = CGFloat(TimingFunction.EaseInCubic(rt: Double(i) / totalFrames, b: 0.0, c: 1.0))
            case .EaseOutCubic:
                scale = CGFloat(TimingFunction.EaseOutCubic(rt: Double(i) / totalFrames, b: 0.0, c: 1.0))
            case .EaseInOutCubic:
                scale = CGFloat(TimingFunction.EaseInOutCubic(rt: Double(i) / totalFrames, b: 0.0, c: 1.0))
            }
            
            values.append(f(scale))
        }

        return values
    }
}