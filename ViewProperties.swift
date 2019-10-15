//
//  ViewProperties.swift
//  KRAnimationKit
//
//  Created by Joshua Park on 15/10/2019.
//

import UIKit

internal class ViewProperties: NSObject {
    
    var origin: CGPoint {
        get {
            let x = position.x - bounds.width * anchorPoint.x
            let y = position.y - bounds.height * anchorPoint.y
            return CGPoint(x: x, y: y)
        }
        set {
            let (posX, posY) = (
                newValue.x + bounds.width * anchorPoint.x,
                newValue.y + bounds.height * anchorPoint.y)
            position = CGPoint(x: posX, y: posY)
        }
    }
    
    var frame: CGRect {
        get { return CGRect(origin: origin, size: bounds.size) }
        set {
            origin = newValue.origin
            bounds.size = newValue.size
        }
    }
    
    var center: CGPoint {
        get { return position }
        set { position = newValue }
    }
    
    var anchorPoint: CGPoint
    var position: CGPoint
    var bounds: CGRect
    
    var backgroundColor: UIColor?
    
    var borderColor: UIColor?
    var borderWidth: CGFloat
    var cornerRadius: CGFloat
    
    var opacity: Float
    var alpha: CGFloat {
        get { return CGFloat(opacity) }
        set { opacity = Float(newValue) }
    }
    
    var shadowColor: UIColor?
    var shadowOffset: CGSize
    var shadowOpacity: Float
    var shadowPath: CGPath?
    var shadowRadius: CGFloat
    
    var transform: CATransform3D
    
    init(view: UIView) {
        self.anchorPoint = view.layer.anchorPoint
        self.position = view.layer.position
        self.bounds = view.layer.bounds
        self.backgroundColor = view.layer.backgroundColor?.uiColor
        self.borderColor = view.layer.borderColor?.uiColor
        self.borderWidth = view.layer.borderWidth
        self.cornerRadius = view.layer.cornerRadius
        self.opacity = view.layer.opacity
        
        self.shadowColor = view.layer.shadowColor?.uiColor
        self.shadowOffset = view.layer.shadowOffset
        self.shadowOpacity = view.layer.shadowOpacity
        self.shadowPath = view.layer.shadowPath
        self.shadowRadius = view.layer.shadowRadius
        
        self.transform = view.layer.transform
    }
}

