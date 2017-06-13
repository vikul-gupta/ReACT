//
//  InvalidPasswordViewController.swift
//  ReAct
//
//  Created by Vikul Gupta on 5/14/17.
//  Copyright © 2017 Swathi Iyer. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class InvalidPasswordViewController: UIViewController {
    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    let networkingService = NetworkingService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround() 
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func logInAction(_ sender: AnyObject) {
        networkingService.signIn(email: emailField.text!, password: passwordField.text!)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if
            FIRAuth.auth()?.currentUser != nil {
            let vc = storyboard.instantiateViewController(withIdentifier: "logInSuccess") as UIViewController
            present(vc, animated: true, completion: nil)
        } else {
            let vc = storyboard.instantiateViewController(withIdentifier: "logInFail") as UIViewController
            present(vc, animated: true, completion: nil)
        }
    }
}
