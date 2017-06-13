//
//  ProfileViewController.swift
//  ReAct
//
//  Created by Swathi Iyer on 6/5/17.
//  Copyright © 2017 Swathi Iyer. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    
    
    @IBOutlet weak var tableview: UITableView!
    
    var issuesArray = ["Homeless", "Abortion", "Environment", "Middle East", "LGBTQ"]
    
    override func viewDidLoad() {
        
        self.navigationItem.title = "PROFILE"
        
        navigationController?.navigationBar.barTintColor = UIColor.init(red: (115.0/255.0), green: (207.0/255.0), blue: (243.0/255.0), alpha: (1.0))
        navigationController?.navigationBar.tintColor = UIColor.white
        
        self.view.backgroundColor = UIColor.init(red: (115.0/255.0), green: (207.0/255.0), blue: (243.0/255.0), alpha: (1.0))
        self.tableview.backgroundColor = UIColor.clear
        
        //self.navigationItem.backBarButtonItem?.title = ""


        //var topBar = UINavigationBar.appearance()
        
        //topBar.tintColor = UIColor.red
//        topBar.barTintColor = UIColor.init(red: (115.0/255.0), green: (207.0/255.0), blue: (243.0/255.0), alpha: (1.0))
        
        // change navigation item title color
       // topBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
        
        //let origImage = UIImage(named: "icSettingsBlack24px")
        //let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        //settingsButton.setImage(tintedImage, for: .normal)
        //settingsButton.tintColor = .red
        
        
        //let btnImage = UIImage(named: "icSettingsBlack24px")?.withRenderingMode(.alwaysTemplate)
        //settingsButton.setImage(btnImage, for: UIControlState.normal)
        //settingsButton.tintColor = UIColor.red//init(red: (233.0/255.0), green: (112.0/255.0), blue: (89.0/255.0), alpha: (1.0))
        
        
        editButton.layer.borderColor = UIColor.init(red: (115.0/255.0), green: (207.0/255.0), blue: (243.0/255.0), alpha: (1.0)).cgColor
        super.viewDidLoad()
        self.tableview.backgroundColor = UIColor.clear
        // Do any additional setup after loading the view.
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profilecell", for: indexPath) as! ProfileTableViewCell
        
        cell.reactButton.layer.borderColor = UIColor.init(red: (115.0/255.0), green: (207.0/255.0), blue: (243.0/255.0), alpha: (1.0)).cgColor
        
        // what follows is just the default testing
        
        cell.issueImage.image = UIImage(named: "defaultImage")
        cell.billTitle.text = issuesArray[indexPath.row]+" Bill"
        cell.billCategory.text = issuesArray[indexPath.row]
        cell.timeLeft.text = "1d"
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ProfileToBill") {
            print("prepareForSegue")
            let BillViewController:BillViewController = segue.destination as! BillViewController
            let indexPath = self.tableview.indexPathForSelectedRow!
            let arrayRow = indexPath.row
            
            BillViewController.billID = issuesArray[arrayRow]
            //            issueViewController.issueLabel.text = "Apple"
        }
    }

}
