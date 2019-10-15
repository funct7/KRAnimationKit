//
//  UIView+Animation.swift
//  Pods
//
//  Created by Joshua Park on 6/20/16.
//
//

import UIKit

// MARK: - Delayed animation

public extension UIView {
        
    func after(_ delay: Double) -> DelayedAnimation {
        return DelayedAnimation(view: self, delay: delay)
    }
    
}
