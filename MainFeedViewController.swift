//
//  MainFeedViewController.swift
//  ReAct
//
//  Created by Swathi Iyer on 5/21/17.
//  Copyright © 2017 Swathi Iyer. All rights reserved.
//

import Foundation

import UIKit
import FirebaseAuth
import Firebase
import FirebaseDatabase

class MainFeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    private var databaseRef: FIRDatabaseReference! {
        return FIRDatabase.database().reference()
    }
    
    var tableData = [] as NSArray
    var issuesArray = [] as NSArray
    var data = NSMutableData()
    var issueAreas : NSArray = []
    var tableView : UITableView!
    @IBOutlet weak var tableview: UITableView!
    let networkingService = NetworkingService()
    
    let userID = FIRAuth.auth()?.currentUser?.uid
    var userRef = FIRDatabase.database().reference()
    
    //var issuesArray = ["Homeless", "Abortion", "Environment", "Middle East", "LGBTQ"]
    
    
    override func viewDidLoad() {
        
        self.navigationItem.title = "REACT"
        
        navigationController?.navigationBar.barTintColor = UIColor.init(red: (115.0/255.0), green: (207.0/255.0), blue: (243.0/255.0), alpha: (1.0))
        navigationController?.navigationBar.tintColor = UIColor.white
        
        
        
        
        super.viewDidLoad()
        
        userRef = databaseRef.child("users").child(userID!)
        
        callingWebservice("issueQuery")
        moreInfo()
        
        
        self.view.backgroundColor = UIColor.init(red: (115.0/255.0), green: (207.0/255.0), blue: (243.0/255.0), alpha: (1.0))
        self.tableview.backgroundColor = UIColor.clear
        //nextbutton.isEnabled = false
        //make an array of last step words
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("hallo", userRef)
        userRef.child("issue_areas").observe(.value) { (snapshot: FIRDataSnapshot!) in
            if(!(snapshot.value is NSNull)) {
                //var newItems = [FIRDataSnapshot]()
                var newItems: [String] = []
            
                // loop through the children and append them to the new array
            
                //for item in snapshot.children {
                for item in snapshot.value! as! NSArray {
                    newItems.append(item as! String)
                }
            
                // replace the old array
                self.issueAreas = newItems as NSArray
            
                self.callingWebservice("issueQuery")
                self.moreInfo()
            
                // reload the UITableView
                self.tableView.reloadData()
            }
        }
    }
    
    enum JSONError: String, Error {
        case NoData = "ERROR: no data"
        case ConversionFailed = "ERROR: conversion from JSON failed"
    }
    
    
    func callingWebservice(_ searchTerm: String) {
        
        let spSearchTerm = searchTerm.replacingOccurrences(of: " ", with: "+", options: NSString.CompareOptions.caseInsensitive, range: nil)
        if let escapedSearchTerm = spSearchTerm.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) {
            let urlPath = "https://calltowin.org/api.php?requestType=\(escapedSearchTerm)"
            guard let url = URL(string: urlPath) else {
                print("Error creating endpoint")
                return
            }
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                do {
                    guard let data = data else {
                        throw JSONError.NoData
                    }
                    guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary else {
                        throw JSONError.ConversionFailed
                    }
                    
                    let keys = json.allKeys as! [String]
                    for key in keys {
                        if key != "request_type" {
                            if let results: NSArray = json[key] as? NSArray {
                                DispatchQueue.main.async(execute: {
                                    self.tableData = results
                                })
                            }
                        }
                        break;
                    }
                } catch let error as JSONError {
                    print(error.rawValue)
                } catch let error as NSError {
                    print(error.debugDescription)
                }
                }.resume()
        }
    }
    
    
    func moreInfo() {
        // for each area, add all issues to array
        let tempArray : NSMutableArray = []
        for area in issueAreas {
            for issueArea in tableData {
                let currDic = issueArea as! NSDictionary
                if currDic["name"] as! String == area as! String {
                    if currDic.count == 3 {
                        let issuesToAdd = currDic["issues"] as! NSArray
                        for issue in issuesToAdd {
                            tempArray.add(issue as! NSDictionary)
                        }
                    }
                }
            }
        }
        
        // sort array by priority
        issuesArray = tempArray as NSArray
        let descriptor: NSSortDescriptor = NSSortDescriptor(key: "priority", ascending: true)
        let sortedIssues: NSArray = issuesArray.sortedArray(using: [descriptor]) as NSArray
        issuesArray = sortedIssues
    }
    
    
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath){
        cell.backgroundColor = UIColor.white
    }
    
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return issuesArray.count
        //array.count
    }
    
    //    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    //        var returnedView = UIView(frame: CGRectMake(x,y,width,height))
    //    }
    

   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    

        let cell = tableView.dequeueReusableCell(withIdentifier: "mainFeedCell", for: indexPath) as! MainFeedTableViewCell
        
        cell.reactButton.layer.borderColor = UIColor.init(red: (115.0/255.0), green: (207.0/255.0), blue: (243.0/255.0), alpha: (1.0)).cgColor

        // what follows is just the default testing
        let currDic = issuesArray[indexPath.row] as! NSDictionary
    
        print("gandu", currDic["image"] as! String)
    
        DispatchQueue.main.async(execute: {
        cell.backgroundImage.image =
        NSURL(string: currDic["image"] as! String)
            .flatMap { NSData(contentsOf: $0 as URL) }
            .flatMap { UIImage(data: $0 as Data) }
        })
    
        cell.billTitle.text = currDic["title"] as! String + " Bill"
        let index : Int = Int(currDic["issue_area"] as! String)! - 1
        cell.category.text =  (tableData[index] as! NSDictionary)["name"] as? String
        cell.timeLeft.text = (currDic["timeToAct"] as! String)
        cell.selectionStyle = .none
    
        return cell
    }
 
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let cell = tableView.cellForRow(at: indexPath) as! MainFeedTableViewCell
        
        /*
        cell.selector.image = UIImage(named: "check")
        
        //get object at that index for that row
        cell.issue.textColor = UIColor.init(red: (84.0/255.0), green: (199.0/255.0), blue: (252.0/255.0), alpha: (1.0))
        cell.selectionStyle = .none
        cell.background.backgroundColor = UIColor.white
        cell.textLabel?.text = ""
        cell.issue.text = lastStepArray[indexPath.row]
        selected.insert(lastStepArray[indexPath.row])
        nextbutton.isEnabled = true
        nextbutton.setTitleColor(UIColor.white, for: UIControlState.normal)
        */
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        //let cell = tableView.cellForRow(at: indexPath) as! MainFeedTableViewCell
        
        /*
        cell.selector.image = UIImage(named: "plus")
        
        //get object at that index for that row
        cell.issue.textColor = UIColor.white
        cell.selectionStyle = .none
        cell.background.backgroundColor = UIColor.init(red: (106.0/255.0), green: (191.0/255.0), blue: (225.0/255.0), alpha: (1.0))
        cell.textLabel?.text = ""
        cell.issue.text = lastStepArray[indexPath.row]
        selected.remove(lastStepArray[indexPath.row])
        if(selected.count == 0){
            nextbutton.isEnabled = false
            nextbutton.setTitleColor(UIColor.init(red: (106.0/255.0), green: (191.0/255.0), blue: (225.0/255.0), alpha: (1.0)), for: UIControlState.normal)
            
        }
        */
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "MainFeedToBill") {
            print("prepareForSegue")
            let BillViewController:BillViewController = segue.destination as! BillViewController
            let indexPath = self.tableView.indexPathForSelectedRow!
            let arrayRow = indexPath.row
            
            let currDic = issuesArray[arrayRow] as! NSDictionary
            
            BillViewController.billID = currDic["id"] as! String
            //            issueViewController.issueLabel.text = "Apple"
        }
    }
 
    
    
    
}
