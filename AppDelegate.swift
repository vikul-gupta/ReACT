//
//  AppDelegate.swift
//  ReAct
//
//  Created by Swathi Iyer on 4/19/17.
//  Copyright © 2017 Swathi Iyer. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

var globalIssueAreas = NSArray()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    /*
    override init() {
        FIRApp.configure()
    }*/

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        let topBar = UINavigationBar.appearance()
        
        topBar.tintColor = UIColor.white
        topBar.barTintColor = UIColor.init(red: (115.0/255.0), green: (207.0/255.0), blue: (243.0/255.0), alpha: (1.0))
        
        let navbarFont = UIFont(name: "ArialRoundedMTBold", size: 16) ?? UIFont.systemFont(ofSize: 16)
        let barbuttonFont = UIFont(name: "ArialRoundedMTBold", size: 16) ?? UIFont.systemFont(ofSize: 16)
        
        UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName: navbarFont, NSForegroundColorAttributeName:UIColor.white]
        UIBarButtonItem.appearance().setTitleTextAttributes([NSFontAttributeName: barbuttonFont, NSForegroundColorAttributeName:UIColor.white], for: UIControlState.normal)
        
        
        //navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        FIRApp.configure()
        //retrieveFromFirebase()
        
        return true
    }
    
   /* func retrieveFromFirebase() {
        let databaseRef = FIRDatabase.database().reference()
        let userID = FIRAuth.auth()?.currentUser?.uid
        print("userid", userID)
        let userRef = databaseRef.child("users").child(userID!)
        userRef.child("issue_areas").observe(FIRDataEventType.value, with: {snapshot in
            if (snapshot.value is NSNull) {
                globalIssueAreas = []
            } else {
                globalIssueAreas = snapshot.value! as! NSArray
                print("app delegate global", globalIssueAreas)
            }
        })
    }
 */

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

