//
//  Animator.swift
//  Pods
//
//  Created by Joshua Park on 6/16/16.
//
//

import UIKit

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

public enum TransitionStyle {
    case Default
    case SlideUp
    case SlideDown
    case SlideLeft
    case SlideRight
    case Custom(CGRect, CGRect)
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

public protocol Animation {
    func set()
    func setWithDuration(duration: Double, function: Any)
    func setWithRelativeTime(relativeTime: Double, duration: Double, function: Any)
}

var TIME = 0.0

public struct AutoResizeAnimation: Animation {
    public let view: UIView
    public let key: AnimatableProperty
    public let beginValue: AnyObject
    public let endValue: AnyObject
    
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
        let totalSteps = 60 * duration * 10
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
    
    
    
    
    public func setWithRelativeTime(relativeTime: Double, duration: Double, function: Any) {
        if let f = function as? (rt: Double, b: Double, c: Double) -> Double {
            switch key {
            case .Alpha:
                view.alpha = CGFloat(f(rt: relativeTime, b: Double(view.alpha), c: endValue as! Double))
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
                let scale = CGFloat(f(rt: relativeTime, b: 0.0, c: 1.0))
                
                let x = begin.origin.x + scale * (end.origin.x - begin.origin.x)
                let y = begin.origin.y + scale * (end.origin.y - begin.origin.y)
                let width = begin.size.width + scale * (end.size.width - begin.size.width)
                let height = begin.size.height + scale * (end.size.height - begin.size.height)
                
                view.frame = CGRectMake(x, y, width, height)

            case .Origin:
                break
            case .Size:
                break
            }
        } else if let f = function as? (rt: Double, b: Double, c: Double, d: Double) -> Double {
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
                break
            case .Origin:
                break
            case .Size:
                break
            }
        }
    }
    
    public init(view: UIView, key: AnimatableProperty, endValue: AnyObject) {
        switch key {
        case .Alpha:
            guard let _ = endValue as? Double else {
                fatalError("\(#line) \(#function): key and endValue's type don't match.\nKey: \(key), Value: \(endValue.self)")
            }
            beginValue = view.alpha
        case .BackgroundColor:
            guard let _ = endValue as? UIColor else {
                fatalError("\(#line) \(#function): key and endValue's type don't match.\nKey: \(key), Value: \(endValue.self)")
            }
            beginValue = view.backgroundColor!
        case .Bounds:
            guard let _ = endValue as? NSValue else {
                fatalError("\(#line) \(#function): key and endValue's type don't match.\nKey: \(key), Value: \(endValue.self)")
            }
            beginValue = NSValue(CGRect: view.bounds)
        case .Center:
            guard let _ = endValue as? NSValue else {
                fatalError("\(#line) \(#function): key and endValue's type don't match.\nKey: \(key), Value: \(endValue.self)")
            }
            beginValue = NSValue(CGPoint: view.center)
        case .CGAffineTransform:
            guard let _ = endValue as? NSValue else {
                fatalError("\(#line) \(#function): key and endValue's type don't match.\nKey: \(key), Value: \(endValue.self)")
            }
            beginValue = NSValue(CGAffineTransform: view.transform)
        case .Frame:
            guard let _ = endValue as? NSValue else {
                fatalError("\(#line) \(#function): key and endValue's type don't match.\nKey: \(key), Value: \(endValue.self)")
            }
            beginValue = NSValue(CGRect: view.frame)
        case .Origin:
            guard let _ = endValue as? NSValue else {
                fatalError("\(#line) \(#function): key and endValue's type don't match.\nKey: \(key), Value: \(endValue.self)")
            }
            beginValue = NSValue(CGPoint: view.frame.origin)
        case .Size:
            guard let _ = endValue as? NSValue else {
                fatalError("\(#line) \(#function): key and endValue's type don't match.\nKey: \(key), Value: \(endValue.self)")
            }
            beginValue = NSValue(CGSize: view.frame.size)
        }
        self.view = view
        self.key = key
        self.endValue = endValue
    }
    
    public init(view: UIView, key: AnimatableProperty, beginValue: AnyObject, endValue: AnyObject) {
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
    }
}

public struct AutoLayoutAnimation: Animation {
    public let constraint: NSLayoutConstraint
    public let constant: CGFloat
    
    public func set() {
        constraint.constant = constant
    }
    
    public func setWithDuration(duration: Double, function: Any) {}
    
    public func setWithRelativeTime(relativeTime: Double, duration: Double, function: Any) {
        
    }
}

public enum Animator {
    case Linear(begin: [Animation]?, end: [Animation], duration: Double, completion: ((Bool) -> Void)?)
    case LinearWithDelay(delay: Double, begin: [Animation]?, end: [Animation], duration: Double, completion: ((Bool) -> Void)?)
    case LinearKeyPath(keyPath: String, time: Double, begin: AnyObject?, end: AnyObject, duration: Double)
    case LinearTransition(TransitionStyle)
    
    case EaseInCubic(animation: [Animation], duration: Double, completion: ((Bool) -> Void)?)
}

var i = 0
