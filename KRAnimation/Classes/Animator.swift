//
//  Animator.swift
//  Pods
//
//  Created by Joshua Park on 6/16/16.
//
//

import UIKit

// TODO: Error handling

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
            break
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
                let endFrame = (value as! NSValue).CGRectValue()
                let x = CGFloat(f(rt: relativeTime, b: Double(view.frame.origin.x), c: Double(endFrame.origin.x)))
                let y = CGFloat(f(rt: relativeTime, b: Double(view.frame.origin.y), c: Double(endFrame.origin.y)))
                let width = CGFloat(f(rt: relativeTime, b: Double(view.frame.width), c: Double(endFrame.width)))
                let height = CGFloat(f(rt: relativeTime, b: Double(view.frame.height), c: Double(endFrame.height)))
                
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
                let endFrame = (value as! NSValue).CGRectValue()
                let x = CGFloat(f(rt: relativeTime, b: Double(view.frame.origin.x), c: Double(endFrame.origin.x), d: duration))
                let y = CGFloat(f(rt: relativeTime, b: Double(view.frame.origin.y), c: Double(endFrame.origin.y), d: duration))
                let width = CGFloat(f(rt: relativeTime, b: Double(view.frame.width), c: Double(endFrame.width), d: duration))
                let height = CGFloat(f(rt: relativeTime, b: Double(view.frame.height), c: Double(endFrame.height), d: duration))
                
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
}
