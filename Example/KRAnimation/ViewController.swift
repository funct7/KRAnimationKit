//
//  ViewController.swift
//  KRAnimation
//
//  Created by Joshua Park on 06/15/2016.
//  Copyright (c) 2016 Joshua Park. All rights reserved.
//

import UIKit
import KRAnimation

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
//            viewBox.chainFrame(CGRectMake(Screen.bounds.width - 100.0, Screen.bounds.height - 100.0, 100.0, 100.0), duration: 1.0),
//            viewBox.chainFrame(CGRectMake(0.0, 0.0, 50.0, 50.0), duration: 1.0)
//            viewBox.chainScaleX(3.0, duration: 1.0, function: .EaseInCubic),
//            viewBox.chainScaleX(1.0, duration: 1.0, function: .EaseOutCubic),
//            viewBox.chainScaleY(3.0, duration: 1.0),
//            viewBox.chainScaleY(1.0, duration: 1.0)
//            viewBox.chainBackgroundColor(viewBox.backgroundColor!.isEqual(UIColor.redColor()) ? UIColor.blueColor().CGColor : UIColor.redColor().CGColor, duration: 1.0)
        )
    }

    @IBAction func defaultAnimation(sender: AnyObject) {
//        let anim = CABasicAnimation(keyPath: "transform")
//        anim.fromValue = NSValue(CATransform3D: viewBox.layer.transform)
//        anim.toValue = NSValue(CATransform3D: CATransform3DRotate(viewBox.layer.transform, CGFloat(M_PI), 1.0, 0.0, 0.0))
//        viewBox.layer.transform = CATransform3DRotate(viewBox.layer.transform, CGFloat(M_PI), 1.0, 0.0, 0.0)
//        anim.fillMode = kCAFillModeForwards
//        anim.duration = 1.0
//        anim.removedOnCompletion = false
//        anim.delegate = self
        
        let anim = CABasicAnimation(keyPath: "backgroundColor")
        anim.toValue = viewBox2.backgroundColor!.isEqual(UIColor.redColor()) ? UIColor.blueColor().CGColor : UIColor.redColor().CGColor
        viewBox2.layer.backgroundColor = viewBox2.backgroundColor!.isEqual(UIColor.redColor()) ? UIColor.blueColor().CGColor : UIColor.redColor().CGColor
        anim.fillMode = kCAFillModeForwards
        anim.duration = 1.0
        anim.removedOnCompletion = false
        anim.delegate = self

        viewBox2.layer.addAnimation(anim, forKey: nil)
    }
    
    @IBAction func multiAnimation(sender: AnyObject) {
        // TODO: Implement
    }
    
    @IBAction func stopAction(sender: AnyObject) {
        viewBox.layer.removeAllAnimations()
        viewBox2.layer.removeAllAnimations()
    }
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        print((viewBox.layer.presentationLayer() as! CALayer).transform)
    }
}