//
//  SettingsTableViewController.swift
//  ReAct
// 
//  Created by Swathi Iyer on 5/14/17.
//  Copyright © 2017 Swathi Iyer. All rights reserved.
//

import Foundation

import UIKit


class SettingCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    
}


class SettingsTableViewController : UITableViewController{

    
    var fruits = ["About REACT", "Terms + Privacy Policy", "Feedback"]
    
    // MARK: - UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath) as! SettingCell
        
        let fruitName = fruits[indexPath.row]
        cell.label?.text = fruitName
        
        return cell
    }

    
    
}

