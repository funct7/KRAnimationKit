//
//  Convenience.swift
//  KRAnimation
//
//  Created by Joshua Park on 6/16/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

var Screen: UIScreen {
    return UIScreen.mainScreen()
}

extension UIColor {
    convenience init(rgba r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat) {
        self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a/1.0)
    }

    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        self.init(rgba:CGFloat((hex >> 16) & 0xff), CGFloat((hex >> 8) & 0xff), CGFloat(hex & 0xff), alpha)
    }
}