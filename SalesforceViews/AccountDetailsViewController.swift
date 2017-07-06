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

class AccountDetailsViewController : UIViewController {
    
    @IBOutlet weak var rightBarButton: UIBarButtonItem!
    @IBOutlet weak var navItem: UINavigationItem!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var ownerTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var faxTF: UITextField!
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
       // accountNumberTF.text = sobjectdata?.AccountNumber
        //annualRevenueTF.text = sobjectdata?.AnnualRevenue.currencyString
        //ownerTF.text = sobjectdata!
        phoneTF.text = sobjectdata!.Phone
        faxTF.text = sobjectdata!.Fax
       // annualRevenueTF.text = String(describing: sobjectdata!.AnnualRevenue)
        
        
        
        let billview = Bundle.loadView(fromNib: "Address", withType: AddressViewController.self)
        billview.title = "Billing Address"
        billview.sobjectdata = sobjectdata?.BillingAddress
        billingAddressView.addSubview(billview)
        
        
        let shipview = Bundle.loadView(fromNib: "Address", withType: AddressViewController.self)
        shipview.title = "Shipping Address"
        shipview.sobjectdata = sobjectdata?.ShippingAddress
        shippingAddressView.addSubview(shipview)
         
        
        setEditState(enabled: false)
        
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
        
        var bstyle : UITextBorderStyle = .none
        
        if (enabled) {
            bstyle = .roundedRect
        }
        
            name.borderStyle = bstyle
            //accountNumberTF.borderStyle = bstyle
            //annualRevenueTF.borderStyle = bstyle
            ownerTF.borderStyle = bstyle
            phoneTF.borderStyle = bstyle
            faxTF.borderStyle = bstyle
    }
    
}
