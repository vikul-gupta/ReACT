//
//  ScriptViewController.swift
//  ReAct
//
//  Created by Swathi Iyer on 6/5/17.
//  Copyright © 2017 Swathi Iyer. All rights reserved.
//

import UIKit

class ScriptViewController: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var billTitle: UILabel!
    @IBOutlet weak var billCategory: UILabel!
    @IBOutlet weak var script: UITextView!
    @IBOutlet weak var callButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func callFCT(){
        let phoneNum: String = "12482501593" //Phone Number
        let url: NSURL = URL(string: "TEL://" + phoneNum)! as NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func callRepFunction(_ sender: UIButton) {
        callFCT()
//        createAlert(title: "Act Now!", message: "")
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
