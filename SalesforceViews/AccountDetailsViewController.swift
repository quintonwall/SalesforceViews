//
//  AccountDetailsViewController.swift
//  SalesforceViews
//
//  Created by QUINTON WALL on 4/8/17.
//  Copyright © 2017 me.quinton. All rights reserved.
//

import Foundation
import UIKit
import SObjectKit

class AccountDetailsViewController : UITableViewController {
    
    @IBOutlet weak var rightBarButton: UIBarButtonItem!
    @IBOutlet weak var navItem: UINavigationItem!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var accountNumberTF: UITextField!
    @IBOutlet weak var annualRevenueTF: UITextField!
    @IBOutlet weak var shippingAddressView: UIView!
    @IBOutlet weak var billingAddressView: UIView!
    
    public var sobjectdata : Account? {
        didSet {
            
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        NotificationCenter.default.addObserver(self, selector: #selector(loadData(notification:)), name: NSNotification.Name(rawValue: ViewNotifications.accountDetail), object: nil)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        navItem.title = sobjectdata?.Name
        name?.text = sobjectdata?.Name
        accountNumberTF.text = sobjectdata?.AccountNumber
        //annualRevenueTF.text = sobjectdata?.AnnualRevenue.currencyString
        annualRevenueTF.text = String(describing: sobjectdata!.AnnualRevenue)
        
        let shipview = Bundle.loadView(fromNib: "Address", withType: AddressViewController.self)
        shipview.title = "Shipping Address"
        shipview.sobjectdata = sobjectdata?.ShippingAddress
        shippingAddressView.addSubview(shipview)
        
        let billview = Bundle.loadView(fromNib: "Address", withType: AddressViewController.self)
        billview.title = "Billing Address"
        billview.sobjectdata = sobjectdata?.BillingAddress
        billingAddressView.addSubview(billview)

        
        
    }
    
    func loadData(notification: NSNotification) {
        
        sobjectdata = notification.object as? Account
        self.reloadInputViews()
        
    }
    
    @IBAction func rightBarButtonTapped(_ sender: UIBarButtonItem) {
    
        switch sender.title! {
            case "Edit":
                setEditState(enabled: true)
                rightBarButton.title = "Save"
            default: // Save
                setEditState(enabled: false)
                rightBarButton.title = "Edit"
        }
    }
    
    private func setEditState(enabled: Bool) {
        name.isEnabled = enabled
        
        if (enabled) {
            name.borderStyle = .roundedRect
            accountNumberTF.borderStyle = .roundedRect
            annualRevenueTF.borderStyle = .roundedRect
            
        }else {
            name.borderStyle = .none
            accountNumberTF.borderStyle = .none
            annualRevenueTF.borderStyle = .none
        }
    }
}
