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
    var scale: (CGFloat, CGFloat, CGFloat) {
        let sx = sqrt(pow(m11, 2) + pow(m12, 2))
        let sy = sqrt(pow(m22, 2) + pow(m23, 2))
        let sz = sqrt(pow(m33, 2) + pow(m31, 2))
        return (sx, sy, sz)
    }
    
    var rotation: (CGFloat, CGFloat, CGFloat) {
        let (sx, sy, sz) = scale
        return (acos(m11/sx), acos(m22/sy), acos(m33/sz))
    }
    
    var translation: (CGFloat, CGFloat, CGFloat) {
        return (m41, m42, m43)
    }
}

// MARK - Functions

internal func degreeToRadian(degree: Double) -> Double {
    return degree * M_PI / 180.0
}

internal func degreeToRadian(degree: CGFloat) -> CGFloat {
    return degree * CGFloat(M_PI) / 180.0
}
