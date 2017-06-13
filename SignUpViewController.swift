//
//  SignUpViewController.swift
//  ReAct
//
//  Created by Vikul Gupta on 5/13/17.
//  Copyright © 2017 Swathi Iyer. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var addr1Field: UITextField!
    @IBOutlet weak var addr2Field: UITextField!
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var stateField: UITextField!
    @IBOutlet weak var zipField: UITextField!
    
    
    let networkingService = NetworkingService()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround() 
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signUpAction(_ sender: AnyObject) {
        print("sign up entered")
        networkingService.signUp(email: emailField.text!, username: firstNameField.text!, password: passwordField.text!, state: stateField.text!, lastname: lastNameField.text!, addr1: addr1Field.text!, addr2: addr2Field.text!, city: cityField.text!, zipcode: zipField.text!)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if FIRAuth.auth()?.currentUser != nil {
            let vc = storyboard.instantiateViewController(withIdentifier: "logInSuccess") as UIViewController
            present(vc, animated: true, completion: nil)
        } else {
            let vc = storyboard.instantiateViewController(withIdentifier: "SignUp") as UIViewController
            present(vc, animated: true, completion: nil)
        }
    }
    
}
