//
//  SettingsViewController.swift
//  ReAct
//
//  Created by Swathi Iyer on 5/13/17.
//  Copyright © 2017 Swathi Iyer. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class SettingsViewController: UIViewController {
    
    override func viewDidLoad() {
        self.navigationItem.title = "SETTINGS"
        
        navigationController?.navigationBar.barTintColor = UIColor.init(red: (115.0/255.0), green: (207.0/255.0), blue: (243.0/255.0), alpha: (1.0))
        navigationController?.navigationBar.tintColor = UIColor.white
        
        //self.view.backgroundColor = UIColor.init(red: (115.0/255.0), green: (207.0/255.0), blue: (243.0/255.0), alpha: (1.0))
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func logout(){
        if FIRAuth.auth()?.currentUser != nil {
            do {
                try FIRAuth.auth()?.signOut()
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "Home") as UIViewController
                present(vc, animated: true, completion: nil)
                print("user signed out")
                
            } catch let error as NSError {
                print("WRONG")
                print(error.localizedDescription)
            }
        }

    }
    
    func createAlert (title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        
        alert.addAction(UIAlertAction(title: "Log Out", style: UIAlertActionStyle.default, handler: {action in self.logout()}))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: {(action) in alert.dismiss(animated: true, completion: nil)}))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func logOutAction(_ sender: UIButton) {
        createAlert(title: "Are you sure you want to \nlog out?", message: "")/*
        if FIRAuth.auth()?.currentUser != nil {
            do {
                try FIRAuth.auth()?.signOut()
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "Home") as UIViewController
                present(vc, animated: true, completion: nil)
                print("user signed out")
                
            } catch let error as NSError {
                print("WRONG")
                print(error.localizedDescription)
            }
        }*/

    }
    
    /*
    @IBAction func logOutAction(_ sender: AnyObject) {
        print("log out function entered")
        if FIRAuth.auth()?.currentUser != nil {
            print("user signed in")
            do {
                try FIRAuth.auth()?.signOut()
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "Home") as UIViewController
                present(vc, animated: true, completion: nil)
                
            } catch let error as NSError {
                print("WRONG")
                print(error.localizedDescription)
            }
        }
    }
 */
}

