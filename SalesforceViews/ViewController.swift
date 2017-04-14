//
//  ViewController.swift
//  SalesforceViews
//
//  Created by QUINTON WALL on 3/31/17.
//  Copyright © 2017 me.quinton. All rights reserved.
//

import UIKit
import SObjectKit
import SwiftlySalesforce

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func AccountButtonTapped(_ sender: UIButton) {
        
               
        var data : [Account]?
        
        first {
                salesforce.identity()
            }.then { userInfo in
                salesforce.query(soql: Account.soqlGetAllFields(nil))
             }.then {
                (result: QueryResult) -> () in
                 data = Account.populateToCollection(result.records as NSArray) as? [Account]
                
                //show the storyboard
                let storyboard = UIStoryboard(name: "Accounts", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: "AccountsList") as! UINavigationController
                self.present(controller, animated: true, completion: nil)
                
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: ViewNotifications.accountList), object: data)
                
            }.catch { error in
                let sfdcerror = error as! SalesforceError
                print(error)
            }
        

        
        
        
    }
   
}

