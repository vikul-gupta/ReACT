//
//  LastStepView.swift
//  ReAct
//
//  Created by Swathi Iyer on 5/14/17.
//  Copyright © 2017 Swathi Iyer. All rights reserved.
//

import Foundation


import Foundation

import UIKit

class LastStepView: UIView {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        let arrayOfVillains = ["santa", "bugs", "superman", "batman", "bugs", "superman", "batman", "bugs", "superman", "batman", "bugs", "superman", "batman", "bugs", "superman", "batman", "bugs", "superman", "batman", "bugs", "superman", "batman", "bugs", "superman", "batman", "bugs", "superman", "batman", "bugs", "superman", "batman", "bugs", "superman", "batman", "bugs", "superman", "batman", "bugs", "superman", "batman", "bugs", "superman", "batman", "bugs", "superman", "batman", "bugs", "superman", "batman", "bugs", "superman", "batman", "bugs", "superman", "batman"]
        
        
        
        var buttonY: CGFloat = 20  // our Starting Offset, could be 0
        for villain in arrayOfVillains {
            
            
            let villainButton = UIButton(frame: CGRect(x: 50, y: buttonY, width: 250, height: 30))
            buttonY = buttonY + 50  // we are going to space these UIButtons 50px apart
            
            villainButton.layer.cornerRadius = 10  // get some fancy pantsy rounding
            villainButton.backgroundColor = UIColor.darkGray
            villainButton.setTitle("Button for Villain: \(villain)", for: UIControlState.normal) // We are going to use the item name as the Button Title here.
            villainButton.titleLabel?.text = "\(villain)"
            villainButton.addTarget(self, action: Selector(("villainButtonPressed:")), for: UIControlEvents.touchUpInside)
            
            self.view.addSubview(villainButton)  // myView in this case is the view you want these buttons added
        }
    }
    
    
    func villainButtonPressed(sender:UIButton!) {
        
        if sender.titleLabel?.text != nil {
            print("\nYou have chosen Villain: \(sender.titleLabel?.text)")
        } else {
            
            print("\nNowhere to go :/")
            
        }
        
    }
    
    
    
}
