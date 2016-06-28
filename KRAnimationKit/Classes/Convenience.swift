//
//  Convenience.swift
//  Pods
//
//  Created by Joshua Park on 16.06.28..
//
//

import UIKit

// MARK: - UIView

internal extension UIView {
    func update(properties: ViewProperties) {
        layer.position = properties.position
        layer.bounds.size = properties.bounds.size
        
        layer.backgroundColor = properties.backgroundColor?.CGColor
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

// MARK: - CGColor

internal extension CGColor {
    func getUIColor() -> UIColor {
        return UIColor(CGColor: self)
    }
}

// MARK: - CATransform3D

internal extension CATransform3D {
    // TODO: Implement 
}

// MARK - Functions

internal func degreeToRadian(degree: Double) -> Double {
    return degree * M_PI / 180.0
}

internal func degreeToRadian(degree: CGFloat) -> CGFloat {
    return degree * CGFloat(M_PI) / 180.0
}
