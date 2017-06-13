//
//  ResetPasswordViewController.swift
//  ReAct
//
//  Created by Vikul Gupta on 5/14/17.
//  Copyright © 2017 Swathi Iyer. All rights reserved.
//

import UIKit

class ResetPasswordViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
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
    
    @IBAction func resetPasswordAction(_ sender: AnyObject) {
        networkingService.resetPassword(email: emailField.text!)
    }
    
}
