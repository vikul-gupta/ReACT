//
//  ExploreIssuesViewController.swift
//  ReAct
//
//  Created by Swathi Iyer on 5/27/17.
//  Copyright © 2017 Swathi Iyer. All rights reserved.
//

import Foundation

import UIKit

class ExploreIssuesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
//    var tableView : UITableView!
    
    @IBOutlet var tableView: UITableView!
    
    var stringToSend : String = ""
    
    public var selectedIssues = Set(globalIssueAreas as! [String])
    
    var lastStepArray = ["Cabinet Nominations", "Civil Liberties", "Economic Policy", "Immigration Policy", "National Security", "Supreme Court", "Health Care", "The White House", "Environmental Policy", "Criminal Justice", "Education Policy"]
    
    let networkingService = NetworkingService()
    
    override func viewDidLoad() {
        
        self.navigationItem.title = "EXPLORE ISSUES"
        
        navigationController?.navigationBar.barTintColor = UIColor.init(red: (115.0/255.0), green: (207.0/255.0), blue: (243.0/255.0), alpha: (1.0))
        navigationController?.navigationBar.tintColor = UIColor.white

        self.view.backgroundColor = UIColor.init(red: (115.0/255.0), green: (207.0/255.0), blue: (243.0/255.0), alpha: (1.0))
        self.tableView.backgroundColor = UIColor.clear
        //self.navigationItem.backBarButtonItem = "Issues"
        
        //navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        super.viewDidLoad()
        print("original", selectedIssues)
        print("global", globalIssueAreas)
        //make an array of last step words
    }
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath){
        cell.backgroundColor = UIColor.white
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "exploreIssuesCell", for: indexPath) as! ExploreIssuesTableViewCell
        
        cell.IssueText.text = lastStepArray[indexPath.row]
        
        cell.IssueImage.image = UIImage(named: "White House")
        
        //get object at that index for that row
        cell.textLabel?.text = ""
        cell.selectionStyle = .none
        if(!selectedIssues.contains(lastStepArray[indexPath.row])){
            cell.IssueFollowButton.setImage(UIImage(named: "followButtonDeselected"), for: .normal)
        }else{
            cell.IssueFollowButton.setImage(UIImage(named: "followButtonSelected"), for: .normal)
        }
        cell.IssueFollowButton.tag = indexPath.row
        cell.IssueFollowButton.addTarget(self, action:#selector(buttonClicked(sender:)),for: .touchUpInside)
        return cell
    }
    
    func buttonClicked(sender:UIButton){
        let buttonRow = sender.tag
        let indexPath = NSIndexPath(row: buttonRow, section: 0)
        let cell = tableView.cellForRow(at: indexPath as IndexPath) as! ExploreIssuesTableViewCell
        if(!selectedIssues.contains(cell.IssueText.text!)){
            selectedIssues.insert(cell.IssueText.text!)
        cell.IssueFollowButton.setImage(UIImage(named: "followButtonSelected"), for: .normal)
            print(selectedIssues)
        } else{
            selectedIssues.remove(cell.IssueText.text!)
            cell.IssueFollowButton.setImage(UIImage(named: "followButtonDeselected"), for: .normal)
            print(selectedIssues)
        }
        networkingService.updateIssues(issue_areas: Array(selectedIssues) as NSArray)
        print("global", globalIssueAreas)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! ExploreIssuesTableViewCell
        
        
        //  cell.IssueFollowButton.setImage(UIImage(named: "followButtonSelected"), for: .normal)
        //get object at that index for that row
        cell.selectionStyle = .none
        cell.textLabel?.text = ""
        //selectedIssues.insert(lastStepArray[indexPath.row])
        //print(selectedIssues)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! ExploreIssuesTableViewCell
        
        
        //   cell.IssueFollowButton.setImage(UIImage(named: "followButtonDeselected"), for: .normal)
        
        //get object at that index for that row
        cell.selectionStyle = .none
        cell.textLabel?.text = ""
        //selectedIssues.remove(lastStepArray[indexPath.row])
        //print(selectedIssues)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ShowSingleIssue") {
            //print("prepareForSegue")
            let issueViewController:SingleIssueViewController = segue.destination as! SingleIssueViewController
            let indexPath = self.tableView.indexPathForSelectedRow!
            let arrayRow = indexPath.row
            
            issueViewController.issueName = lastStepArray[arrayRow]
//            issueViewController.issueLabel.text = "Apple"
        }
    }
    //@IBAction func nextButtonPressed(_ sender: AnyObject) {
    //   NSLog("buttonPressed")
    //    self.performSegue(withIdentifier: "lastStep", sender: nil)
    //}
    
    //@IBAction func nextAction(_ sender: AnyObject) {
    //    networkingService.updateIssues(issue_areas: selectedIssues)
    
    //}
    
    
}
