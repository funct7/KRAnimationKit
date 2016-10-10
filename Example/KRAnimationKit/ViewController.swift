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
            viewBox.chain(y: bottomY, duration: 1.0, function: .linear),
            viewBox.chain(y: 0.0, duration: 1.0, function: .linear),
            
            viewBox.chain(y: bottomY, duration: 1.0, function: .easeInSine),
            viewBox.chain(y: 0.0, duration: 1.0, function: .easeOutSine),
            viewBox2.chain(y: bottomY, duration: 1.0, function: .easeInOutSine),
            
            viewBox.chain(y: bottomY, duration: 1.0, function: .easeInQuad),
            viewBox.chain(y: 0.0, duration: 1.0, function: .easeOutQuad),
            viewBox2.chain(y: 58.0, duration: 1.0, function: .easeInOutQuad),
            
            viewBox.chain(y: bottomY, duration: 1.0, function: .easeInCubic),
            viewBox.chain(y: 0.0, duration: 1.0, function: .easeOutCubic),
            viewBox2.chain(y: bottomY, duration: 1.0, function: .easeInOutCubic),
            
            viewBox.chain(y: bottomY, duration: 1.0, function: .easeInQuart),
            viewBox.chain(y: 0.0, duration: 1.0, function: .easeOutQuart),
            viewBox2.chain(y: 58.0, duration: 1.0, function: .easeInOutQuart),
            
            viewBox.chain(y: bottomY, duration: 1.0, function: .easeInQuint),
            viewBox.chain(y: 0.0, duration: 1.0, function: .easeOutQuint),
            viewBox2.chain(y: bottomY, duration: 1.0, function: .easeInOutQuint),
            
            viewBox.chain(y: bottomY, duration: 1.0, function: .easeInExpo),
            viewBox.chain(y: 0.0, duration: 1.0, function: .easeOutExpo),
            viewBox2.chain(y: 58.0, duration: 1.0, function: .easeInOutExpo),
            
            viewBox.chain(y: bottomY, duration: 1.0, function: .easeInCirc),
            viewBox.chain(y: 0.0, duration: 1.0, function: .easeOutCirc),
            viewBox2.chain(y: bottomY, duration: 1.0, function: .easeInOutCirc),
            
            viewBox.chain(y: bottomY, duration: 1.0, function: .easeInElastic),
            viewBox.chain(y: 0.0, duration: 1.0, function: .easeOutElastic),
            viewBox2.chain(y: 58.0, duration: 1.0, function: .easeInOutElastic),
            
            viewBox.chain(y: bottomY, duration: 1.0, function: .easeInBack),
            viewBox.chain(y: 0.0, duration: 1.0, function: .easeOutBack),
            viewBox2.chain(y: bottomY, duration: 1.0, function: .easeInOutBack),
            
            viewBox.chain(y: bottomY, duration: 1.0, function: .easeInBounce),
            viewBox.chain(y: 0.0, duration: 1.0, function: .easeOutBounce),
            viewBox2.chain(y: 58.0, duration: 1.0, function: .easeInOutBounce),
            
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
            viewBox.chain(x: Screen.bounds.width - 50.0, duration: 1.0, function: .easeOutCubic) + viewBox.chain(backgroundColor: UIColor.blue, duration: 1.0) + viewBox2.chain(alpha: 0.5, duration: 1.0) + viewBox2.chain(backgroundColor: UIColor.cyan, duration: 1.0),
            viewBox.after(0.5).chain(y: Screen.bounds.height - 50.0, duration: 1.0, function: .easeInCubic) + viewBox2.after(0.5).chain(center: view.center, duration: 1.0),
            viewBox.chain(x: 0.0, duration: 1.0, function: .easeInOutCubic) + viewBox.chain(backgroundColor: UIColor.red, duration: 1.0),
            viewBox.chain(y: 0.0, duration: 1.0),
            viewBox.chain(origin: CGPoint(x: Screen.bounds.width - 50.0, y: Screen.bounds.height - 50.0), duration: 1.0, function: .easeInCubic),
            viewBox.chain(origin: CGPoint.zero, duration: 1.0, function: .easeOutCubic),
            viewBox.chain(center: view.center, duration: 1.0),
            viewBox.chain(size: CGSize(width: 200.0, height: 200.0), duration: 1.0),
            viewBox.chain(size: CGSize(width: 50.0, height: 50.0), duration: 1.0),
            viewBox.chain(frame: CGRect(x: Screen.bounds.width - 100.0, y: Screen.bounds.height - 100.0, width: 100.0, height: 100.0), duration: 1.0, function: .linear),
            viewBox.chain(frame: CGRect(x: 0.0, y: 0.0, width: 50.0, height: 50.0), duration: 1.0, function: .linear) + viewBox2.chain(origin: CGPoint(x: 0.0, y: 58.0), duration: 1.0) + viewBox2.chain(backgroundColor: UIColor.green, duration: 1.0),
            viewBox.chain(scaleX: 3.0, duration: 1.0, function: .easeInCubic),
            viewBox.chain(scaleX: 1.0, duration: 1.0, function: .easeOutCubic),
            viewBox.chain(scaleY: 3.0, duration: 1.0),
            viewBox.chain(scaleY: 1.0, duration: 1.0) + viewBox2.chain(backgroundColor: UIColor(hex: 0x007AFF, alpha: 1.0), duration: 1.0),
            viewBox.chain(backgroundColor: viewBox.backgroundColor!.isEqual(UIColor.red) ? UIColor.blue.cgColor : UIColor.red.cgColor, duration: 1.0),
            viewBox.chain(borderWidth: 4.0, duration: 1.0, function: .easeInOutCubic),
            viewBox.chain(cornerRadius: 25.0, duration: 1.0, function: .easeInOutCubic),
            viewBox.chain(alpha: 0.5, duration: 1.0),
            viewBox.chain(shadowOpacity: 1.0, duration: 1.0),
            viewBox.chain(shadowColor: UIColor.red, duration: 1.0),
            viewBox.chain(shadowRadius: 5.0, duration: 1.0),
            
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
