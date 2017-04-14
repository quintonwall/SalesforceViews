//
//  AccountTableViewController.swift
//  SalesforceViews
//
//  Created by QUINTON WALL on 4/7/17.
//  Copyright © 2017 me.quinton. All rights reserved.
//

import UIKit
import SObjectKit
import NotificationCenter

class AccountTableViewController: UITableViewController {

    public var sobjectdata : [Account]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    @IBAction func doneTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    
        NotificationCenter.default.addObserver(self, selector: #selector(loadData(notification:)), name: NSNotification.Name(rawValue: ViewNotifications.accountList), object: nil)
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
    }
    
    

    func loadData(notification: NSNotification) {
        
        sobjectdata = notification.object as? [Account]
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sobjectdata!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AccountCell", for: indexPath) as! AccountTableViewCellController

        cell.sobjectdata = sobjectdata?[indexPath.row]
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
       
        let callAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Call", handler: { (action, indexPath) -> Void in
            
                //pop up phone
        })
        callAction.backgroundColor = UIColor.brown
        
        
        
        let websiteAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Website", handler: { (action, indexPath) -> Void in
            
            //open website
        })
        websiteAction.backgroundColor = UIColor.green
        
        let mapAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Map", handler: { (action, indexPath) -> Void in
            
            //show map
        })
        
        return [callAction,websiteAction, mapAction]
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showAccountDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! AccountDetailsViewController
                destinationController.sobjectdata = sobjectdata?[indexPath.row]
            }
        }
        
    }
    

}
