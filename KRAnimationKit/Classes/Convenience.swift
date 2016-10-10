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
    func update(_ properties: ViewProperties) {
        layer.position = properties.position
        layer.bounds.size = properties.bounds.size
        
        layer.backgroundColor = properties.backgroundColor?.cgColor
        layer.borderColor = properties.borderColor?.cgColor
        layer.borderWidth = properties.borderWidth
        layer.cornerRadius = properties.cornerRadius
        layer.opacity = properties.opacity
        layer.shadowColor = properties.shadowColor?.cgColor
        layer.shadowOffset = properties.shadowOffset
        layer.shadowOpacity = properties.shadowOpacity
        layer.shadowPath = properties.shadowPath
        layer.shadowRadius = properties.shadowRadius
        layer.transform = properties.transform
    }
}

// MARK: - CGColor

internal extension CGColor {
    var uiColor: UIColor {
        return UIColor(cgColor: self)
    }
}

// MARK: - CATransform3D

internal extension CATransform3D {
    // TODO: Implement 
}

// MARK - Functions

internal func radians(from degrees: Double) -> Double {
    return degrees * M_PI / 180.0
}

internal func radians(from degrees: CGFloat) -> CGFloat {
    return degrees * CGFloat(M_PI) / 180.0
}
