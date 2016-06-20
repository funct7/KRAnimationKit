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
    @IBOutlet weak var viewBox2: UIView!
    
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
        viewBox.chainAnimations(
//            viewBox.chainX(Screen.bounds.width - 50.0, duration: 1.0, function: .EaseOutCubic),
//            viewBox.chainY(Screen.bounds.height - 50.0, duration: 1.0, function: .EaseInCubic),
//            viewBox.chainX(0.0, duration: 1.0, function: .EaseInOutCubic),
//            viewBox.chainY(0.0, duration: 1.0),
//            viewBox.chainOrigin(CGPointMake(Screen.bounds.width - 50.0, Screen.bounds.height - 50.0), duration: 1.0, function: .EaseInCubic),
//            viewBox.chainOrigin(CGPointZero, duration: 1.0, function: .EaseOutCubic),
//            viewBox.chainSize(CGSizeMake(200.0, 200.0), duration: 1.0),
//            viewBox.chainSize(CGSizeMake(50.0, 50.0), duration: 1.0)
//            viewBox.chainCenter(view.center, duration: 1.0),
//            viewBox.chainCenter(CGPointMake(25.0, 25.0), duration: 1.0)
            viewBox.chainFrame(CGRectMake(Screen.bounds.width - 100.0, Screen.bounds.height - 100.0, 100.0, 100.0), duration: 1.0),
            viewBox.chainFrame(CGRectMake(0.0, 0.0, 50.0, 50.0), duration: 1.0)
        )
    }

    @IBAction func defaultAnimation(sender: AnyObject) {
        START = NSDate()

        UIView.animateWithDuration(3.0, animations: {
            self.viewBox.frame = self.endFrame
            }, completion: { (_) in
                self.viewBox.frame = self.beginFrame
        })
    }
    
    @IBAction func multiAnimation(sender: AnyObject) {
        // TODO: Implement
    }
    
    @IBAction func stopAction(sender: AnyObject) {
        viewBox.layer.removeAllAnimations()
        viewBox2.layer.removeAllAnimations()
    }
}