//
//  Animator.swift
//  Pods
//
//  Created by Joshua Park on 6/16/16.
//
//

import UIKit
import KRTimingFunction

// TODO: Error handling

private func += (inout lhs: CGPoint, rhs: CGPoint) {
    lhs.x += rhs.x
    lhs.y += rhs.y
}

private func += (inout lhs: CGSize, rhs: CGSize) {
    lhs.width += rhs.width
    lhs.height += rhs.height
}

private func += (inout lhs: CGRect, rhs: CGRect) {
    lhs.origin += rhs.origin
    lhs.size += rhs.size
}

public enum AnimatableProperty {
    case Alpha
    case BackgroundColor
    case Bounds
    case Center
    case CGAffineTransform
    case Frame
    case Origin
    case Size
}

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

public protocol Animation {
    func set()
    func setWithDuration(duration: Double, function: Any)
}

public struct AutoResizeAnimation: Animation {
    public let view: UIView
    public let key: AnimatableProperty
    public let beginValue: AnyObject
    public let endValue: AnyObject
    public var multiplier: Int
    
    public init(view: UIView, key: AnimatableProperty, beginValue: AnyObject, endValue: AnyObject, multiplier: Int = 5) {
        switch key {
        case .Alpha:
            guard let _ = endValue as? Double else {
                fatalError("\(#line) \(#function): key and endValue's type don't match.\nKey: \(key), Value: \(endValue.self)")
            }
        case .BackgroundColor:
            guard let _ = endValue as? UIColor else {
                fatalError("\(#line) \(#function): key and endValue's type don't match.\nKey: \(key), Value: \(endValue.self)")
            }
        default:
            guard let _ = endValue as? NSValue else {
                fatalError("\(#line) \(#function): key and endValue's type don't match.\nKey: \(key), Value: \(endValue.self)")
            }
        }
        
        self.view = view
        self.key = key
        self.beginValue = beginValue
        self.endValue = endValue
        self.multiplier = multiplier
    }
    
    public func set() {
        switch key {
        case .Alpha:
            break
        case .BackgroundColor:
            break
        case .Bounds:
            break
        case .Center:
            break
        case .CGAffineTransform:
            break
        case .Frame:
            view.frame = (endValue as! NSValue).CGRectValue()
        case .Origin:
            break
        case .Size:
            break
        }
    }
    
    public func setWithDuration(duration: Double, function: Any) {
        let totalSteps = 60 * duration * Double(multiplier)
        let threshold: CGFloat = 0.5
        var relativeDuration: Double = 1.0 / totalSteps
        
        if let f = function as? (rt: Double, b: Double, c: Double) -> Double {
            switch key {
            case .Alpha:
                break
            case .BackgroundColor:
                break
            case .Bounds:
                break
            case .Center:
                break
            case .CGAffineTransform:
                break
            case .Frame:
                let begin = (beginValue as! NSValue).CGRectValue()
                let end = (endValue as! NSValue).CGRectValue()
                
                var prevX = begin.origin.x
                var prevY = begin.origin.y
                var prevWidth = begin.size.width
                var prevHeight = begin.size.height
                
                for i in 0 ... Int(totalSteps) {
                    let relativeTime = Double(i) / totalSteps
                    let scale = CGFloat(f(rt: relativeTime, b: 0.0, c: 1.0))
                    
                    let x = begin.origin.x + scale * (end.origin.x - begin.origin.x)
                    let y = begin.origin.y + scale * (end.origin.y - begin.origin.y)
                    let width = begin.size.width + scale * (end.size.width - begin.size.width)
                    let height = begin.size.height + scale * (end.size.height - begin.size.height)
                    
                    if abs(x - prevX) >= threshold || abs(y - prevY) >= threshold || abs(width - prevWidth) >= threshold || abs(height - prevHeight) >= threshold {
                        UIView.addKeyframeWithRelativeStartTime(relativeTime, relativeDuration: relativeDuration, animations: {
                            self.view.frame = CGRectMake(x, y, width, height)
                        })
                        (prevX, prevY, prevWidth, prevHeight, relativeDuration) = (x, y, width, height, 1.0 / totalSteps)
                    } else {
                        relativeDuration += 1.0 / totalSteps
                    }
                }
            case .Origin:
                break
            case .Size:
                break
            }
        }
    }
}

public struct AutoLayoutAnimation: Animation {
    public let constraint: NSLayoutConstraint
    public let constant: CGFloat
    
    public func set() {}
    public func setWithDuration(duration: Double, function: Any) {}
}

public enum Animator {
    case Linear(animation: [Animation], duration: Double, completion: ((Bool) -> Void)?)
    case LinearWithDelay(delay: Double, animation: [Animation], duration: Double, completion: ((Bool) -> Void)?)
    case LinearKeyPath(property: AnimatableKeyPath, time: CFTimeInterval, begin: AnyObject?, end: AnyObject, duration: Double)
    
    case EaseInCubic(animation: [Animation], duration: Double, completion: ((Bool) -> Void)?)
    case EaseInCubicKeyPath(property: AnimatableKeyPath, time: CFTimeInterval, begin: AnyObject?, end: AnyObject, duration: Double)
    
    func getProperties() -> (keyPath: String, beginTime: Double, duration: Double, values: [AnyObject]) {
        var values = [AnyObject]()
        
        switch self {
        case .LinearKeyPath(property: let p, time: let t, begin: let b, end: let e, duration: let d):
            break
            
        case .EaseInCubicKeyPath(property: let p, time: let t, begin: let b, end: let e , duration: let d):
            switch p {
            case .Position:
                let totalSteps = 60 * d
                
                guard let end = e as? NSValue else {
                    fatalError("\(#line) \(#function): key path and values' type don't match.\nKey: \(p), Value: \(b.dynamicType)")
                }
                
                let beginPos = b != nil ? (b as! NSValue).CGPointValue() : CGPointZero
                let endPos = end.CGPointValue()
                
                for i in 0 ..< Int(totalSteps) {
                    let scale = CGFloat(TimingFunction.EaseInOutCubic(rt: Double(i) / totalSteps, b: 0.0, c: 1.0))
                    
                    let x = beginPos.x + scale * (endPos.x - beginPos.x)
                    let y = beginPos.y + scale * (endPos.y - beginPos.y)
                    
                    values.append(NSValue(CGPoint: CGPointMake(x, y)))
                }
                return (keyPath: "position", beginTime: t, duration: d, values: values)
            default:
                break
            }
            
        default:
            fatalError("Use function with key path")
        }
        return ("s", 0.0, 0.0, values)
    }
}

