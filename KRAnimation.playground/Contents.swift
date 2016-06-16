import UIKit

enum TransitionStyle {
    case Default
    case SlideUp
    case SlideDown
    case SlideLeft
    case SlideRight
    case Custom(CGRect, CGRect)
}

enum AnimatableProperty {
    case Alpha
    case BackgroundColor
    case Center
    case CGAffineTransform
    case Frame
    case Origin
    case Size
}

protocol Animation {
    func set()
    func setForStartTime(startTime: Double, duration: Double)
}

struct AutoResizeAnimation: Animation {
    let view: UIView
    let key: AnimatableProperty
    let value: AnyObject
    
    func set() {
        switch key {
        case .Alpha:
            break
        case .BackgroundColor:
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
    
    func setForStartTime(startTime: Double, duration: Double) {
        
    }
}

struct AutoLayoutAnimation: Animation {
    let constraint: NSLayoutConstraint
    let constant: CGFloat
    
    func set() {
        constraint.constant = constant
    }
    
    func setForStartTime(startTime: Double, duration: Double) {
        
    }
}


enum Animator {
    case Linear([Animation]?, [Animation], Double, ((Bool) -> Void)?)
    case LinearWithDelay(Double, [Animation]?, [Animation], Double, ((Bool) -> Void)?)
    case LinearKeyPath(keyPath: String, time: Double, begin: AnyObject?, end: AnyObject, duration: Double)
    case LinearTransition(TransitionStyle)
    
    case Cubic([Animation]?, [Animation], Double, ((Bool) -> Void)?)
    case CubicWithDelay(Double, [Animation]?, [Animation], Double, ((Bool) -> Void)?)
    case CubicKeyPath(keyPath: String, time: Double, begin: AnyObject?, end: AnyObject, duration: Double)
    
    case None([Animation], ((Bool) -> Void)?)
}

extension UIView {
    class func animateWithAnimator(animator: Animator) {
        switch animator {
        case .Linear(let begin, let end, let duration, let completion):
            if let begin = begin { for desc in begin { desc.set() } }
            
            animateKeyframesWithDuration(duration, delay: 0.0, options: [.AllowUserInteraction, .BeginFromCurrentState, .CalculationModeDiscrete], animations: {
                // TODO: Add keyframes
                for desc in end { addKeyFrameAnimation(0.0, duration: 0.0, descriptor: desc) }
                }, completion: completion)
        default:
            fatalError("")
        }
    }
    
    class func addKeyFrameAnimation(startTime: Double, duration: Double, descriptor: Animation) {
        addKeyframeWithRelativeStartTime(startTime, relativeDuration: duration) {
            descriptor.setForStartTime(startTime, duration: duration)
        }
    }
}

extension CALayer {
    private func getProperties(animator: Animator) -> (String, Double, AnyObject?, AnyObject, Double) {
        switch animator {
        case .LinearKeyPath(keyPath: let k, time: let t, begin: let b, end: let e, duration: let d):
            return (k, t, b, e, d)
        case .CubicKeyPath(keyPath: let k, time: let t, begin: let b, end: let e, duration: let d):
            return (k, t, b, e, d)
        default:
            fatalError("Use function with key path")
        }
    }
    
    func getKeyFrameAnimation(animator: Animator) -> CAAnimation {
        let properties = getProperties(animator)
        let anim = CABasicAnimation(keyPath: properties.0)
        anim.beginTime = CACurrentMediaTime() + properties.1
        anim.fromValue = properties.2
        anim.toValue = properties.3
        anim.duration = properties.4
        
        return anim
    }
    
    func addKeyFrameAnimation(animator: Animator, forKey key: String?) {
        addAnimation(getKeyFrameAnimation(animator), forKey: key)
    }
}

let view = UIView()
var startFrame = CGRectZero
var endFrame = CGRectMake(0.0, 0.0, 100.0, 100.0)

let anim = Animator.LinearTransition(.Default)

let startDesc = AutoResizeAnimation(view: view, key: .Frame, value: NSValue(CGRect: startFrame))
let endDesc = AutoResizeAnimation(view: view, key: .Frame, value: NSValue(CGRect: endFrame))
let anim2 = Animator.Linear([startDesc], [endDesc], 0.3, nil)

let anim4 = Animator.LinearKeyPath(keyPath: "position.x", time: 0.2, begin: 0.0, end: 100.0, duration: 0.3)
view.layer.addKeyFrameAnimation(anim4, forKey: nil)

UIView.animateWithAnimator(anim2)