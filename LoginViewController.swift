//
//  LoginViewController.swift
//  ReAct
//
//  Created by Swathi Iyer on 4/19/17.
//  Copyright © 2017 Swathi Iyer. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

class LoginViewController : UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    let networkingService = NetworkingService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        emailField.delegate = self
        passwordField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (emailField.text == "Email" && emailField.isTouchInside) {
            emailField.text = ""
        }
        
        if (passwordField.text == "Password" && passwordField.isTouchInside) {
            passwordField.text = ""
            passwordField.isSecureTextEntry = true
        }
        
        if (emailField.text == "Email" && emailField.isTouchInside) {
            emailField.text = ""
        }
    }
    
    @IBAction func forgotAction(_ sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "logInFail") as UIViewController
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func logInAction(_ sender: AnyObject) {
        networkingService.signIn(email: emailField.text!, password: passwordField.text!)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if FIRAuth.auth()?.currentUser != nil {
            let vc = storyboard.instantiateViewController(withIdentifier: "logInSuccess") as UIViewController
            present(vc, animated: true, completion: nil)
        } else {
            let vc = storyboard.instantiateViewController(withIdentifier: "logInFail") as UIViewController
            present(vc, animated: true, completion: nil)
        }
    }
}
