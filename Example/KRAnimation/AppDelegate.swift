//
//  AppDelegate.swift
//  KRAnimation
//
//  Created by Joshua Park on 06/15/2016.
//  Copyright (c) 2016 Joshua Park. All rights reserved.
//

import UIKit
import KRTimingFunction

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        let start = NSDate()
        for _ in 0 ..< 100 {
            let t = 12.0
            let d = 73.0
            let b = 0.0
            let c = 1.0
            
            TimingFunction.EaseInQuad(rt: t/d, b: b, c: c)
            TimingFunction.EaseOutQuad(rt: t/d, b: b, c: c)
            TimingFunction.EaseInOutQuad(rt: t/d, b: b, c: c)
            
            TimingFunction.EaseInCubic(rt: t/d, b: b, c: c)
            TimingFunction.EaseOutCubic(rt: t/d, b: b, c: c)
            TimingFunction.EaseInOutCubic(rt: t/d, b: b, c: c)
            
            TimingFunction.EaseInQuart(rt: t/d, b: b, c: c)
            TimingFunction.EaseOutQuart(rt: t/d, b: b, c: c)
            TimingFunction.EaseInOutQuart(rt: t/d, b: b, c: c)
            
            TimingFunction.EaseInQuint(rt: t/d, b: b, c: c)
            TimingFunction.EaseOutQuint(rt: t/d, b: b, c: c)
            TimingFunction.EaseInOutQuint(rt: t/d, b: b, c: c)
            
            TimingFunction.EaseInSine(rt: t/d, b: b, c: c)
            TimingFunction.EaseOutSine(rt: t/d, b: b, c: c)
            TimingFunction.EaseInOutSine(rt: t/d, b: b, c: c)
            
            TimingFunction.EaseInExpo(rt: t/d, b: b, c: c)
            TimingFunction.EaseOutExpo(rt: t/d, b: b, c: c)
            TimingFunction.EaseInOutExpo(rt: t/d, b: b, c: c)
            
            TimingFunction.EaseInCirc(rt: t/d, b: b, c: c)
            TimingFunction.EaseOutCirc(rt: t/d, b: b, c: c)
            TimingFunction.EaseInOutCirc(rt: t/d, b: b, c: c)
            
            TimingFunction.EaseInElastic(rt: t/d, b: b, c: c, d: d)
            TimingFunction.EaseOutElastic(rt: t/d, b: b, c: c, d: d)
            TimingFunction.EaseInOutElastic(rt: t/d, b: b, c: c, d: d)
            
            TimingFunction.EaseInBack(rt: t/d, b: b, c: c)
            TimingFunction.EaseOutBack(rt: t/d, b: b, c: c)
            TimingFunction.EaseInOutBack(rt: t/d, b: b, c: c)
            
            TimingFunction.EaseInBounce(rt: t/d, b: b, c: c)
            TimingFunction.EaseOutBounce(rt: t/d, b: b, c: c)
            TimingFunction.EaseInOutBounce(rt: t/d, b: b, c: c)
        }
        print(NSDate().timeIntervalSinceDate(start))
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

