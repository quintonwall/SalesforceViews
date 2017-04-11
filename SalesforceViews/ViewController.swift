//
//  ViewController.swift
//  SalesforceViews
//
//  Created by QUINTON WALL on 3/31/17.
//  Copyright © 2017 me.quinton. All rights reserved.
//

import UIKit
import SObjectKit

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
        
        let a =  Account(id: "1234")
        a.Name = "A Account"
        a.TickerSymbol = "ABC"
        a.Industry = "Finance"
        
        let b =  Account(id: "4567")
        b.Name = "B Account"
        b.TickerSymbol = "ZZB"
        b.Industry = "HighTech"
        
        let storyboard = UIStoryboard(name: "Accounts", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "AccountsList") as! AccountTableViewController
        controller.sobjectdata = [a,b]
        present(controller, animated: true, completion: nil)
    }
   
}

