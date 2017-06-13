//
//  NetworkingService.swift
//  ReAct
//
//  Created by Vikul Gupta on 5/13/17.
//  Copyright © 2017 Swathi Iyer. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase
import UIKit

struct NetworkingService {
    private var databaseRef: FIRDatabaseReference! {
        return FIRDatabase.database().reference()
    }
    private var storageRef: FIRStorageReference {
        return FIRStorage.storage().reference()
    }
    
    
    // 3 ------- safe info function
    
    private func saveInfo(user: FIRUser!, username: String, password: String, state: String, lastname: String, addr1: String, addr2: String, city: String, zipcode: String) {
        // Create our user dictionary info
        let issue_areas = NSArray()
        let completed_issues = NSArray()
        let userInfo = ["email": user.email!, "username": username, "uid": user.uid, "state": state, "lastname": lastname, "addr1": addr1, "addr2": addr2, "city": city, "zipcode": zipcode, "issue_areas": issue_areas, "completed_issues": completed_issues] as [String : Any]
        
        // create user reference
        let userRef = databaseRef.child("users").child(user.uid)
        
        // save user info in database
        userRef.setValue(userInfo)
        
        signIn(email: user.email!, password: password)
        
        
    }
    
    
    
    // 4 ------ sign in the user
    
    func signIn(email: String, password: String) {
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            if error == nil {
                if let user = user {
                    print("\(user.displayName!) has signed in successfully!")
                } else {
                    print(error!.localizedDescription)
                }
            }
        })
    }
    
    
    
    // 2 ------ set user info function
    
    private func setUserInfo(user: FIRUser!, username: String, password: String, state: String, lastname: String, addr1: String, addr2: String, city: String, zipcode: String) {
        let changeRequest = user.profileChangeRequest()
        changeRequest.displayName = username
        changeRequest.commitChanges(completion: { (error) in
            if error == nil {
                self.saveInfo(user: user, username: username, password: password, state: state, lastname: lastname, addr1: addr1, addr2: addr2, city: city, zipcode: zipcode)
            } else {
                print(error!.localizedDescription)
            }
        })
    }
    
    
    // 1 ----- we create the user
    
    func signUp(email: String, username: String, password: String, state: String, lastname: String, addr1: String, addr2: String, city: String, zipcode: String) {
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
            if error == nil {
                self.setUserInfo(user: user, username: username, password: password, state: state, lastname: lastname, addr1: addr1, addr2: addr2, city: city, zipcode: zipcode)
            } else {
                print(error!.localizedDescription)
            }
        })
    }
    
    
    // reset password function
    func resetPassword(email: String) {
        FIRAuth.auth()?.sendPasswordReset(withEmail: email, completion: { (error) in
            if error == nil {
                print("An email with information on how to reset your password has been sent to you. Thank you.")
            } else {
                print(error!.localizedDescription)
            }
        })
    }
    
    
    // update issue areas
    func updateIssues(issue_areas: NSArray) {
        FIRAuth.auth()?.addStateDidChangeListener { (auth, user) in
            // create issue reference
            let userRef = self.databaseRef.child("users").child((user?.uid)!)
            
            // save user info in database
            userRef.child("issue_areas").setValue(issue_areas)
        }
    }
    
}
