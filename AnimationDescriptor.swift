//
//  AnimationDescriptor.swift
//  KRAnimationKit
//
//  Created by Joshua Park on 15/10/2019.
//

import UIKit
import KRTimingFunction

public struct AnimationDescriptor {
    
    let view: UIView
    let delay: Double
    let property: AnimatableProperty
    let endValue: Any
    let duration: Double
    let function: FunctionType
    
    internal func getFrameAnimations() -> (origin: AnimationDescriptor, size: AnimationDescriptor) {
        let frame = (endValue as! NSValue).cgRectValue
        
        let animOrigin = AnimationDescriptor(
            view: view,
            delay: delay,
            property: .origin,
            endValue: NSValue(cgPoint: frame.origin),
            duration: duration,
            function: function)
        let animSize = AnimationDescriptor(
            view: view,
            delay: delay,
            property: .size,
            endValue: NSValue(cgSize: frame.size),
            duration: duration,
            function: function)
        
        return (origin: animOrigin, size: animSize)
    }
}
