//
//  ViewController.swift
//  KRAnimationKit
//
//  Created by Joshua Park on 06/15/2016.
//  Copyright (c) 2016 Joshua Park. All rights reserved.
//

import UIKit
import KRAnimationKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viewBox: UIView!
    @IBOutlet weak var viewBox2: UIView!
    var animKey: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func animation(sender: AnyObject) {
        let bottomY = Screen.bounds.height - 50.0
        
        KRAnimation.chain(
            viewBox.chainY(bottomY, duration: 1.0, function: .linear),
            viewBox.chainY(0.0, duration: 1.0, function: .linear),
            
            viewBox.chainY(bottomY, duration: 1.0, function: .easeInSine),
            viewBox.chainY(0.0, duration: 1.0, function: .easeOutSine),
            viewBox2.chainY(bottomY, duration: 1.0, function: .easeInOutSine),
            
            viewBox.chainY(bottomY, duration: 1.0, function: .easeInQuad),
            viewBox.chainY(0.0, duration: 1.0, function: .easeOutQuad),
            viewBox2.chainY(58.0, duration: 1.0, function: .easeInOutQuad),
            
            viewBox.chainY(bottomY, duration: 1.0, function: .easeInCubic),
            viewBox.chainY(0.0, duration: 1.0, function: .easeOutCubic),
            viewBox2.chainY(bottomY, duration: 1.0, function: .easeInOutCubic),
            
            viewBox.chainY(bottomY, duration: 1.0, function: .easeInQuart),
            viewBox.chainY(0.0, duration: 1.0, function: .easeOutQuart),
            viewBox2.chainY(58.0, duration: 1.0, function: .easeInOutQuart),
            
            viewBox.chainY(bottomY, duration: 1.0, function: .easeInQuint),
            viewBox.chainY(0.0, duration: 1.0, function: .easeOutQuint),
            viewBox2.chainY(bottomY, duration: 1.0, function: .easeInOutQuint),
            
            viewBox.chainY(bottomY, duration: 1.0, function: .easeInExpo),
            viewBox.chainY(0.0, duration: 1.0, function: .easeOutExpo),
            viewBox2.chainY(58.0, duration: 1.0, function: .easeInOutExpo),
            
            viewBox.chainY(bottomY, duration: 1.0, function: .easeInCirc),
            viewBox.chainY(0.0, duration: 1.0, function: .easeOutCirc),
            viewBox2.chainY(bottomY, duration: 1.0, function: .easeInOutCirc),
            
            viewBox.chainY(bottomY, duration: 1.0, function: .easeInElastic),
            viewBox.chainY(0.0, duration: 1.0, function: .easeOutElastic),
            viewBox2.chainY(58.0, duration: 1.0, function: .easeInOutElastic),
            
            viewBox.chainY(bottomY, duration: 1.0, function: .easeInBack),
            viewBox.chainY(0.0, duration: 1.0, function: .easeOutBack),
            viewBox2.chainY(bottomY, duration: 1.0, function: .easeInOutBack),
            
            viewBox.chainY(bottomY, duration: 1.0, function: .easeInBounce),
            viewBox.chainY(0.0, duration: 1.0, function: .easeOutBounce),
            viewBox2.chainY(58.0, duration: 1.0, function: .easeInOutBounce),
            
            reverses: false, repeatCount: 1
        ) {
            print("COMPLETION")
        }
    }
    @IBOutlet weak var testView: UIView!
    var snapshot: UIView!
    var displayLink: CADisplayLink!
    
    @IBAction func defaultAnimation(sender: AnyObject) {
//        viewBox.center = view.center
//        
//        var t = CATransform3DIdentity
//        t = CATransform3DScale(t, 2.0, 1.5, 1.0)
//        t = CATransform3DRotate(t, CGFloat(M_PI_2), 1.0, 0.0, 0.0)
//        t = CATransform3DRotate(t, CGFloat(M_PI_2), 0.0, 1.0, 0.0)
//        
//        let anim = CABasicAnimation(keyPath: "transform")
//        anim.duration = 1.0
//        anim.toValue = NSValue(CATransform3D: t)
//        anim.removedOnCompletion = false
//        anim.fillMode = kCAFillModeForwards
//        
//        viewBox.layer.addAnimation(anim, forKey: nil)
    }
    
    func displayLinkDidFire(displayLink: CADisplayLink) {
        print(snapshot.frame)
    }
    
    @IBAction func multiAnimation(sender: AnyObject) {
        self.animKey = KRAnimation.chain(
            viewBox.chainX(Screen.bounds.width - 50.0, duration: 1.0, function: .easeOutCubic) + viewBox.chainBackgroundColor(UIColor.blue, duration: 1.0) + viewBox2.chainAlpha(0.5, duration: 1.0) + viewBox2.chainBackgroundColor(UIColor.cyan, duration: 1.0),
            viewBox.after(0.5).chainY(Screen.bounds.height - 50.0, duration: 1.0, function: .easeInCubic) + viewBox2.after(0.5).chainCenter(view.center, duration: 1.0),
            viewBox.chainX(0.0, duration: 1.0, function: .easeInOutCubic) + viewBox.chainBackgroundColor(UIColor.red, duration: 1.0),
            viewBox.chainY(0.0, duration: 1.0),
            viewBox.chainOrigin(CGPoint(x: Screen.bounds.width - 50.0, y: Screen.bounds.height - 50.0), duration: 1.0, function: .easeInCubic),
            viewBox.chainOrigin(CGPoint.zero, duration: 1.0, function: .easeOutCubic),
            viewBox.chainCenter(view.center, duration: 1.0),
            viewBox.chainSize(CGSize(width: 200.0, height: 200.0), duration: 1.0),
            viewBox.chainSize(CGSize(width: 50.0, height: 50.0), duration: 1.0),
            viewBox.chainFrame(CGRect(x: Screen.bounds.width - 100.0, y: Screen.bounds.height - 100.0, width: 100.0, height: 100.0), duration: 1.0, function: .linear),
            viewBox.chainFrame(CGRect(x: 0.0, y: 0.0, width: 50.0, height: 50.0), duration: 1.0, function: .linear) + viewBox2.chainOrigin(CGPoint(x: 0.0, y: 58.0), duration: 1.0) + viewBox2.chainBackgroundColor(UIColor.green, duration: 1.0),
            viewBox.chainScaleX(3.0, duration: 1.0, function: .easeInCubic),
            viewBox.chainScaleX(1.0, duration: 1.0, function: .easeOutCubic),
            viewBox.chainScaleY(3.0, duration: 1.0),
            viewBox.chainScaleY(1.0, duration: 1.0) + viewBox2.chainBackgroundColor(UIColor(hex: 0x007AFF, alpha: 1.0), duration: 1.0),
            viewBox.chainBackgroundColor(viewBox.backgroundColor!.isEqual(UIColor.red) ? UIColor.blue.cgColor : UIColor.red.cgColor, duration: 1.0),
            viewBox.chainBorderWidth(4.0, duration: 1.0, function: .easeInOutCubic),
            viewBox.chainCornerRadius(25.0, duration: 1.0, function: .easeInOutCubic),
            viewBox.chainAlpha(0.5, duration: 1.0),
            viewBox.chainShadowOpacity(1.0, duration: 1.0),
            viewBox.chainShadowColor(UIColor.red, duration: 1.0),
            viewBox.chainShadowRadius(5.0, duration: 1.0),
            
            reverses: true, repeatCount: Float.infinity
        ) {
            self.viewBox.layer.shadowOpacity = 0.0
            self.viewBox.layer.cornerRadius = 0.0
            self.viewBox.layer.borderWidth = 0.0
            self.viewBox.alpha = 1.0
            self.viewBox2.alpha = 1.0
            print("MULTI COMPLETION")
        }
    }
    
    @IBAction func stopAction(sender: AnyObject) {
        viewBox.setNeedsLayout()

        if let animKey = self.animKey {
            print(animKey)
            viewBox.layer.removeAnimation(forKey: animKey)
            viewBox2.layer.removeAnimation(forKey: animKey)
            self.animKey = nil
        } else {
            viewBox.layer.removeAllAnimations()
            viewBox2.layer.removeAllAnimations()
        }
    }
    
}
