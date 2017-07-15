//
//  UILabel.swift
//  SalesforceViews
//
//  Created by Quinton Wall on 7/15/17.
//  Copyright © 2017 me.quinton. All rights reserved.
//

import UIKit
import AssociatedValues

/**
  * Create overrides so we can set label attributes via UILabel.appearance()
  */
extension UILabel{
    var defaultFont: UIFont? {
        get { return self.font }
        set { self.font = newValue}
    }
    
    var defaultTextColor: UIColor? {
        get { return self.textColor }
        set { self.textColor = newValue }
    }
    
    var isHeader: Bool {
        get {
            return getAssociatedValue(key: "isheader", object: self, initialValue: false)
        }
        set {
            set(associatedValue: newValue, key: "isheader", object: self)
        }
    }
    
    
}
