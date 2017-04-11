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
    @IBOutlet weak var shippingAddressView: AddressViewController!
    public var sobjectdata : Account?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navItem.title = sobjectdata?.Name
        
        shippingAddressView.addSubview(Bundle.loadView(fromNib: "Address", withType: AddressViewController.self))
        
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
        }else {
           name.borderStyle = .none
        }
    }
}
