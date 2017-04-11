//
//  AccountTableCellViewController.swift
//  SalesforceViews
//
//  Created by QUINTON WALL on 4/7/17.
//  Copyright © 2017 me.quinton. All rights reserved.
//

import UIKit
import SObjectKit


class AccountTableViewCellController: UITableViewCell {
    
    
    public var sobjectdata : Account? {
        didSet {
            NameLabel.text = sobjectdata?.Name
            tickerLabel.text = sobjectdata?.TickerSymbol
            industryLabel.text = sobjectdata?.Industry
        }
    }
    
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var industryLabel: UILabel!
    @IBOutlet weak var tickerLabel: UILabel!
    @IBOutlet weak var leftColorView: UIView!
    
   var leftTabColor : UIColor = ColorPalette.primaryDark {
        didSet {
            leftColorView.backgroundColor = leftTabColor
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        NameLabel.textColor = ColorPalette.secondaryDark
        industryLabel.textColor = ColorPalette.secondaryDark
        tickerLabel.textColor = ColorPalette.tertiary
        
    }
    
    

}
