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
                _ = error as! SalesforceError
                print(error)
            }
        
        
    }
 
    
    //example of using storyboard references vs. nofiticationcenter
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
            case "ShowAccounts":
                let navVC = segue.destination as! UINavigationController
                let tableVC = navVC.viewControllers.first as! AccountTableViewController
            tableVC.sobjectdata = fetchAccountData()
        default:
            print("No matching seque identifier")
            
        }
    }
 
    
    func fetchAccountData() -> [Account] {
        
        
        let a  = Account(id: "1234")
        a.Name = "A Company"
        a.AccountNumber = "1234"
        a.AnnualRevenue = 100.99
        a.BillingAddress.street = "1 Here St"
        a.BillingAddress.state = "California"
        a.BillingAddress.city = "San Francisco"
        a.BillingAddress.stateCode = "CA"
        a.BillingAddress.zip = "94110"
        a.BillingAddress.latitude = 37.756091
        a.BillingAddress.longitude = -122.410999
        a.ShippingAddress.street = "1 Market St"
        a.ShippingAddress.state = "California"
        a.ShippingAddress.city = "San Francisco"
        a.ShippingAddress.stateCode = "CA"
        a.ShippingAddress.zip = "94105"
        a.ShippingAddress.latitude = 37.793846
        a.ShippingAddress.longitude = -122.394837
        
           return [a]
        /*
        var data : [Account]?
        
        first {
            salesforce.identity()
            }.then { userInfo in
                salesforce.query(soql: Account.soqlGetAllFields(nil))
            }.then {
                (result: QueryResult) -> () in
                data = Account.populateToCollection(result.records as NSArray) as? [Account]
                
                //show the storyboard
              //  let storyboard = UIStoryboard(name: "Accounts", bundle: nil)
               // let controller = storyboard.instantiateViewController(withIdentifier: "AccountsList") as! UINavigationController
                
                //self.present(controller, animated: true, completion: nil)
                
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: ViewNotifications.accountList), object: data)
                
            }.catch { error in
                _ = error as! SalesforceError
                print(error)
        }
 */
    }
    
    
   
}

