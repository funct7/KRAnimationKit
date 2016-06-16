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
    
//    @IBOutlet weak var viewBox: UIView!
    @IBOutlet var boxes: [UIView]!
    var frames = [CGRect]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for box in boxes {
            frames.append(box.frame)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func animation(sender: AnyObject) {
//        viewBox.frame = CGRectMake(20, 275, 50, 50)

//        let beginAnim = AutoResizeAnimation(view: viewBox, key: .Frame, value: NSValue(CGRect: CGRectMake(20, 275, 50, 50)))
//        let endAnim = AutoResizeAnimation(view: viewBox, key: .Frame, value: NSValue(CGRect: CGRectMake(Screen.bounds.width - 100.0, viewBox.frame.origin.y, 100.0, 100.0)))
//        let start = NSDate()
//        UIView.animateWithAnimator(Animator.Linear(begin: nil, end: [endAnim], duration: 5, completion: { (_) in print(NSDate().timeIntervalSinceDate(start)) }))
        for (i, box) in boxes.enumerate() {
            box.frame = frames[i]
        }

        let start = NSDate()
        let animations: () -> [Animation] = { 
            var array = [Animation]()
            for (i, box) in self.boxes.enumerate() {
                let anim = AutoResizeAnimation(view: box, key: .Frame, value: NSValue(CGRect: CGRectMake(Screen.bounds.width - 100.0, box.frame.origin.y, 30.0, 30.0)), originalValue: NSValue(CGRect: self.frames[i]))
                array.append(anim)
            }
            return array
        }
        
//        let anim = AutoResizeAnimation(view: viewBox, key: .Frame, value: NSValue(CGRect: CGRectMake(Screen.bounds.width - 100.0, viewBox.frame.origin.y, 100.0, 100.0)), originalValue: NSValue(CGRect: viewBox.frame))
        UIView.animateWithAnimator(Animator.EaseInCubic(animation: animations(), duration: 1.0, completion: { (_) in
            print("ANIMATOR", NSDate().timeIntervalSinceDate(start))
        }))
    }
    
    @IBAction func defaultAnimation(sender: AnyObject) {
//        viewBox.frame = CGRectMake(20, 275, 50, 50)
        
        for (i, box) in boxes.enumerate() {
            box.frame = frames[i]
        }
        
        let start = NSDate()
//
//        UIView.animateWithDuration(5, animations: {
//            self.viewBox.frame = CGRectMake(Screen.bounds.width - 100.0, self.viewBox.frame.origin.y, 100.0, 100.0)
//            }, completion: { (_) in
//                print(NSDate().timeIntervalSinceDate(start))
//        })
        UIView.animateWithDuration(1.0, animations: {
            for box in self.boxes {
                box.frame = CGRectMake(Screen.bounds.width - 100.0, box.frame.origin.y, 30.0, 30.0)
            }
            }) { (_) in
                print("UIVIEW", NSDate().timeIntervalSinceDate(start))
        }
    }
}

    