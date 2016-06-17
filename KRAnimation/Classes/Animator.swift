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
    func setWithRelativeTime(relativeTime: Double, duration: Double, function: Any)
}

public struct AutoResizeAnimation: Animation {
    public let view: UIView
    public let key: AnimatableProperty
    public let value: AnyObject
    private let originalValue: AnyObject
    
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
            view.frame = (value as! NSValue).CGRectValue()
        case .Origin:
            break
        case .Size:
            break
        }
    }
    
    public func setWithRelativeTime(relativeTime: Double, duration: Double, function: Any) {
        if let f = function as? (rt: Double, b: Double, c: Double) -> Double {
            switch key {
            case .Alpha:
                view.alpha = CGFloat(f(rt: relativeTime, b: Double(view.alpha), c: value as! Double))
            case .BackgroundColor:
                break
            case .Bounds:
                break
            case .Center:
                break
            case .CGAffineTransform:
                break
            case .Frame:
                let beginFrame = (originalValue as! NSValue).CGRectValue()
                let endFrame = (value as! NSValue).CGRectValue()
                let scale = CGFloat(f(rt: relativeTime, b: 0.0, c: 1.0))
                
                let x = beginFrame.origin.x + scale * (endFrame.origin.x - beginFrame.origin.x)
                let y = beginFrame.origin.y + scale * (endFrame.origin.y - beginFrame.origin.y)
                let width = beginFrame.size.width + scale * (endFrame.size.width - beginFrame.size.width)
                let height = beginFrame.size.height + scale * (endFrame.size.height - beginFrame.size.height)
                
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
                let beginFrame = (originalValue as! NSValue).CGRectValue()
                let endFrame = (value as! NSValue).CGRectValue()
                let x = CGFloat(f(rt: relativeTime, b: Double(view.frame.origin.x), c: Double(endFrame.origin.x) - Double(view.frame.origin.x), d: duration))
                let y = CGFloat(f(rt: relativeTime, b: Double(view.frame.origin.y), c: Double(endFrame.origin.y) - Double(view.frame.origin.y), d: duration))
                let width = CGFloat(f(rt: relativeTime, b: Double(view.frame.width), c: Double(endFrame.width) - Double(view.frame.width), d: duration))
                let height = CGFloat(f(rt: relativeTime, b: Double(view.frame.height), c: Double(endFrame.height) - Double(view.frame.height)
                    , d: duration))
                
                view.frame = CGRectMake(x, y, width, height)
            case .Origin:
                break
            case .Size:
                break
            }
        }
    }
    
    public init(view: UIView, key: AnimatableProperty, value: AnyObject) {
        switch key {
        case .Alpha:
            guard let _ = value as? Double else {
                fatalError("\(#line) \(#function): key and value's type don't match.\nKey: \(key), Value: \(value.self)")
            }
            originalValue = view.alpha
        case .BackgroundColor:
            guard let _ = value as? UIColor else {
                fatalError("\(#line) \(#function): key and value's type don't match.\nKey: \(key), Value: \(value.self)")
            }
            originalValue = view.backgroundColor!
        case .Bounds:
            guard let _ = value as? NSValue else {
                fatalError("\(#line) \(#function): key and value's type don't match.\nKey: \(key), Value: \(value.self)")
            }
            originalValue = NSValue(CGRect: view.bounds)
        case .Center:
            guard let _ = value as? NSValue else {
                fatalError("\(#line) \(#function): key and value's type don't match.\nKey: \(key), Value: \(value.self)")
            }
            originalValue = NSValue(CGPoint: view.center)
        case .CGAffineTransform:
            guard let _ = value as? NSValue else {
                fatalError("\(#line) \(#function): key and value's type don't match.\nKey: \(key), Value: \(value.self)")
            }
            originalValue = NSValue(CGAffineTransform: view.transform)
        case .Frame:
            guard let _ = value as? NSValue else {
                fatalError("\(#line) \(#function): key and value's type don't match.\nKey: \(key), Value: \(value.self)")
            }
            originalValue = NSValue(CGRect: view.frame)
        case .Origin:
            guard let _ = value as? NSValue else {
                fatalError("\(#line) \(#function): key and value's type don't match.\nKey: \(key), Value: \(value.self)")
            }
            originalValue = NSValue(CGPoint: view.frame.origin)
        case .Size:
            guard let _ = value as? NSValue else {
                fatalError("\(#line) \(#function): key and value's type don't match.\nKey: \(key), Value: \(value.self)")
            }
            originalValue = NSValue(CGSize: view.frame.size)
        }
        self.view = view
        self.key = key
        self.value = value
    }
    
    public init(view: UIView, key: AnimatableProperty, value: AnyObject, originalValue: AnyObject) {
        switch key {
        case .Alpha:
            guard let _ = value as? Double else {
                fatalError("\(#line) \(#function): key and value's type don't match.\nKey: \(key), Value: \(value.self)")
            }
        case .BackgroundColor:
            guard let _ = value as? UIColor else {
                fatalError("\(#line) \(#function): key and value's type don't match.\nKey: \(key), Value: \(value.self)")
            }
        default:
            guard let _ = value as? NSValue else {
                fatalError("\(#line) \(#function): key and value's type don't match.\nKey: \(key), Value: \(value.self)")
            }
        }
        
        self.view = view
        self.key = key
        self.value = value
        self.originalValue = originalValue
    }
}

public struct AutoLayoutAnimation: Animation {
    public let constraint: NSLayoutConstraint
    public let constant: CGFloat
    
    public func set() {
        constraint.constant = constant
    }
    
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
