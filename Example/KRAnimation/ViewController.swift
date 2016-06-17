//
//  ViewController.swift
//  KRAnimation
//
//  Created by Joshua Park on 06/15/2016.
//  Copyright (c) 2016 Joshua Park. All rights reserved.
//

import UIKit
import KRAnimation

var START: NSDate!

class ViewController: UIViewController {
    
    @IBOutlet weak var viewBox: UIView!
    
    let beginFrame = CGRectMake(0.0, 0.0, 50, 50)
    let endFrame = CGRectMake(Screen.bounds.width - 100.0, 0.0, 100.0, 100.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func animation(sender: AnyObject) {
        START = NSDate()
        
        let anim = AutoResizeAnimation(view: viewBox, key: .Frame, beginValue: NSValue(CGRect: beginFrame), endValue: NSValue(CGRect: endFrame))
        
        UIView.animateWithAnimator(Animator.EaseInCubic(animation: [anim], duration: 5.0, completion: { (_) in
            print("ANIMATOR", NSDate().timeIntervalSinceDate(START))
            self.viewBox.frame = self.beginFrame
        }))
    }
    
    @IBAction func defaultAnimation(sender: AnyObject) {
        START = NSDate()

        UIView.animateWithDuration(5.0, animations: {
            self.viewBox.frame = self.endFrame
            }, completion: { (_) in
                print("UIVIEW", NSDate().timeIntervalSinceDate(START))
                self.viewBox.frame = self.beginFrame
        })
    }
    
    @IBAction func layerAnimation(sender: AnyObject) {
        START = NSDate()
        
        let begin = NSValue(CGPoint: viewBox.layer.position)
        let end = NSValue(CGPoint: CGPointMake(Screen.bounds.width - 25.0, 25.0))
        let animator = Animator.EaseInCubicKeyPath(property: .Position, time: 0.0, begin: begin, end: end, duration: 5.0)
        let anim = CAKeyframeAnimation(animator: animator)
        anim.delegate = self
        
        viewBox.layer.addAnimation(anim, forKey: nil)
    }
    
    @IBAction func stopAction(sender: AnyObject) {
        viewBox.layer.removeAllAnimations()
    }
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        print("LAYER ANIM", NSDate().timeIntervalSinceDate(START))
    }
}

    