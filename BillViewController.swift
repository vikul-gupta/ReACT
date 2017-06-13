//
//  BillViewController.swift
//  ReAct
//
//  Created by Swathi Iyer on 6/4/17.
//  Copyright © 2017 Swathi Iyer. All rights reserved.
//

import UIKit

class BillViewController: UIViewController {

    public var billID : String = ""
    public var ACTUALBillID : String = "1"
    
    var tableData : NSArray = []
    
    @IBOutlet weak var descriptionImage: UIImageView!
    @IBOutlet weak var billTitle: UILabel!
    @IBOutlet weak var daysLeftToAct: UILabel!
    @IBOutlet weak var timeLeftIcon: UIImageView!
    @IBOutlet weak var topLine: UIView!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var bottomLine: UIView!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var billDescription: UITextView!
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var innerView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //callingWebservice("singleIssueQuery&issueID=" + ACTUALBillID)
        print("table is ", tableData)
        
        timeLeftIcon.image = timeLeftIcon.image!.withRenderingMode(.alwaysTemplate)
        timeLeftIcon.tintColor = UIColor.init(red: (233.0/255.0), green: (112.0/255.0), blue: (89.0/255.0), alpha: (1.0))
        
        callButton.layer.borderColor = UIColor.init(red: (115.0/255.0), green: (207.0/255.0), blue: (243.0/255.0), alpha: (1.0)).cgColor
        shareButton.layer.borderColor = UIColor.init(red: (115.0/255.0), green: (207.0/255.0), blue: (243.0/255.0), alpha: (1.0)).cgColor
        //print("tableData should be mepyt", tableData)
        //let bill = tableData[1] as! NSDictionary
        
        category.text = billID//bill["category"] as? String
        
        billTitle.text = billID + " Bill"//bill["title"] as! String + " Bill"
        
       // billDescription.text = bill["desc"] as? String
        
        descriptionImage.image = UIImage(named: "defaultImage")
        
        let heightConstraint = NSLayoutConstraint(item: innerView, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 700)
        innerView.addConstraint(heightConstraint)

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
    
    func donateFCT(){
        let urlLink = URL(string: "http://www.stanford.edu/")
        
        UIApplication.shared.open(urlLink!, options: [:], completionHandler: nil)
    }
    
    func signFCT(){
        let urlLink = URL(string: "http://www.stanford.edu/")
        
        UIApplication.shared.open(urlLink!, options: [:], completionHandler: nil)
    }
    
    func createAlert (title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        
        alert.addAction(UIAlertAction(title: "Call Representative", style: UIAlertActionStyle.default, handler: {action in self.callFCT()}))
        
        alert.addAction(UIAlertAction(title:"Read Script", style: .default, handler:  { action in self.performSegue(withIdentifier: "readScript", sender: self) }))
        
        alert.addAction(UIAlertAction(title: "Donate", style: UIAlertActionStyle.default, handler: {action in self.donateFCT()}))
        
        alert.addAction(UIAlertAction(title: "Sign Petition", style: UIAlertActionStyle.default, handler: {action in self.signFCT()}))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: {(action) in alert.dismiss(animated: true, completion: nil)}))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func callFunction(_ sender: UIButton) {
       createAlert(title: "Act Now!", message: "")
    }
    
    
    func displayShareSheet(shareContent: String) {
        let activityViewController = UIActivityViewController(activityItems: [shareContent as NSString], applicationActivities: nil)
        present(activityViewController, animated:true, completion: {})
    }
    
    @IBAction func shareFunction(_ sender: UIButton) {
        let testMessage: String = "Check out this bill!\n"+billTitle.text!
        displayShareSheet(shareContent: testMessage)
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        
//        callingWebservice("singleIssueQuery&issueID=" + ACTUALBillID)
//        //moreInfo()
//            
//        // reload the UITableView
//        //self.tableView.reloadData()
//    }
    
    
//    enum JSONError: String, Error {
//        case NoData = "ERROR: no data"
//        case ConversionFailed = "ERROR: conversion from JSON failed"
//    }
//    
//    
//    func callingWebservice(_ searchTerm: String) {
//        
//        let spSearchTerm = searchTerm.replacingOccurrences(of: " ", with: "+", options: NSString.CompareOptions.caseInsensitive, range: nil)
//        if let escapedSearchTerm = spSearchTerm.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) {
//            let urlPath = "https://calltowin.org/api.php?requestType=\(escapedSearchTerm)"
//            guard let url = URL(string: urlPath) else {
//                print("Error creating endpoint")
//                return
//            }
//            
//            URLSession.shared.dataTask(with: url) { (data, response, error) in
//                do {
//                    guard let data = data else {
//                        throw JSONError.NoData
//                    }
//                    guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary else {
//                        throw JSONError.ConversionFailed
//                    }
//                    
//                    let keys = json.allKeys as! [String]
//                    for key in keys {
//                        if key != "request_type" {
//                            if let results: NSArray = json[key] as? NSArray {
//                                DispatchQueue.main.async(execute: {
//                                    tableData = results
//                                })
//                            }
//                        }
//                        break;
//                    }
//                } catch let error as JSONError {
//                    print(error.rawValue)
//                } catch let error as NSError {
//                    print(error.debugDescription)
//                }
//                }.resume()
//        }
//    }
}
