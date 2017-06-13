//
//  LastStepViewController.swift
//  ReAct
//
//  Created by Swathi Iyer on 5/14/17.
//  Copyright © 2017 Swathi Iyer. All rights reserved.
//

import Foundation

import UIKit

class LastStepViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var tableView : UITableView!
    var selectedIssues = Set<String>()
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var nextbutton: UIButton!

    let networkingService = NetworkingService()

    
    var lastStepArray = ["Cabinet Nominations", "Civil Liberties", "Economic Policy", "Immigration Policy", "National Security", "Supreme Court", "Health Care", "The White House", "Environmental Policy", "Criminal Justice", "Education Policy"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableview.backgroundColor = UIColor.clear
         nextbutton.isEnabled = false
        //make an array of last step words
    }
    
   public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath){
        cell.backgroundColor = UIColor.clear
    }
        
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lastStepArray.count
        //array.count
    }
    
//    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        var returnedView = UIView(frame: CGRectMake(x,y,width,height))
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lastStepCell", for: indexPath) as! LastStepTableViewCell

        
       // let fruitName = fruits[indexPath.row]
        //cell.selector.image = UIImage(named: "plus")
        cell.issue.text = lastStepArray[indexPath.row]

        //get object at that index for that row
        cell.textLabel?.text = ""
        cell.selectionStyle = .none
        if(!selectedIssues.contains(lastStepArray[indexPath.row])){
            cell.issue.textColor = UIColor.white
            cell.background.backgroundColor = UIColor.init(red: (106.0/255.0), green: (191.0/255.0), blue: (225.0/255.0), alpha: (1.0))
            cell.selector.image = UIImage(named: "plus")
        }else{
            cell.issue.textColor = UIColor.init(red: (84.0/255.0), green: (199.0/255.0), blue: (252.0/255.0), alpha: (1.0))
            cell.background.backgroundColor = UIColor.white
            cell.selector.image = UIImage(named: "check")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! LastStepTableViewCell
        
        
        cell.selector.image = UIImage(named: "check")
        
        //get object at that index for that row
        cell.issue.textColor = UIColor.init(red: (84.0/255.0), green: (199.0/255.0), blue: (252.0/255.0), alpha: (1.0))
        cell.selectionStyle = .none
        cell.background.backgroundColor = UIColor.white
        cell.textLabel?.text = ""
        cell.issue.text = lastStepArray[indexPath.row]
        selectedIssues.insert(lastStepArray[indexPath.row])
        print(selectedIssues)
        nextbutton.isEnabled = true
        nextbutton.setTitleColor(UIColor.white, for: UIControlState.normal)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! LastStepTableViewCell
        
        
        cell.selector.image = UIImage(named: "plus")
        
        //get object at that index for that row
        cell.issue.textColor = UIColor.white
        cell.selectionStyle = .none
        cell.background.backgroundColor = UIColor.init(red: (106.0/255.0), green: (191.0/255.0), blue: (225.0/255.0), alpha: (1.0))
        cell.textLabel?.text = ""
        cell.issue.text = lastStepArray[indexPath.row]
        selectedIssues.remove(lastStepArray[indexPath.row])
        print(selectedIssues)
        if(selectedIssues.count == 0){
            nextbutton.isEnabled = false
            nextbutton.setTitleColor(UIColor.init(red: (106.0/255.0), green: (191.0/255.0), blue: (225.0/255.0), alpha: (1.0)), for: UIControlState.normal)
            
        }
    }
    @IBAction func nextButtonPressed(_ sender: AnyObject) {
        NSLog("buttonPressed")
        networkingService.updateIssues(issue_areas: Array(selectedIssues) as NSArray)
        self.performSegue(withIdentifier: "lastStep", sender: nil)
    }
 
}
