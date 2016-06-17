//
//  ViewController.swift
//  KRAnimation
//
//  Created by Joshua Park on 06/15/2016.
//  Copyright (c) 2016 Joshua Park. All rights reserved.
//

import UIKit
import KRAnimation
import JHChainableAnimations

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
        let start = NSDate()
        
        let anim = AutoResizeAnimation(view: viewBox, key: .Frame, beginValue: NSValue(CGRect: beginFrame), endValue: NSValue(CGRect: endFrame))
        UIView.animateWithAnimator(Animator.EaseInCubic(animation: [anim], duration: 5.0, completion: { (_) in
            print("ANIMATOR", NSDate().timeIntervalSinceDate(start))
            self.viewBox.frame = self.beginFrame
        }))
    }
    
    @IBAction func defaultAnimation(sender: AnyObject) {
        let start = NSDate()

        UIView.animateWithDuration(5.0, animations: {
            self.viewBox.frame = self.endFrame
            }, completion: { (_) in
                print("UIVIEW", NSDate().timeIntervalSinceDate(start))
                self.viewBox.frame = self.beginFrame
        })
    }
    
    @IBAction func jhanimation(sender: AnyObject) {
        let start = NSDate()
        
        viewBox.makeFrame()(endFrame).easeInCubic().animate()(5.0).animationCompletion = {
            print("JHANIMATION", NSDate().timeIntervalSinceDate(start))
            self.viewBox.frame = self.beginFrame
        }
    }
}

    