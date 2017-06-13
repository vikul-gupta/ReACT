//
//  ViewController.swift
//  ReAct
//
//  Created by Swathi Iyer on 4/19/17.
//  Copyright © 2017 Swathi Iyer. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var loginfb: UIButton!
    @IBOutlet weak var signup: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        login.layer.borderColor = UIColor.white.cgColor
        loginfb.layer.borderColor = UIColor.white.cgColor
        signup.layer.borderColor = UIColor.white.cgColor
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

