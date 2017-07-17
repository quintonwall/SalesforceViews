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
    
    
    public var account : Account? {
        didSet {
            NameLabel.text = account?.Name
            tickerLabel.text = account?.TickerSymbol
            industryLabel.text = account?.Industry
        }
    }
    
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var industryLabel: UILabel!
    @IBOutlet weak var tickerLabel: UILabel!
    @IBOutlet weak var leftColorView: UIView!
    
   //var leftTabColor : UIColor = ColorPalette.primaryDark {
     //   didSet {
       //     leftColorView.backgroundColor = leftTabColor
       // }
    //}
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let theme  = ThemeManager.shared.currentTheme()
        self.backgroundColor = theme?.mainColor
        
        leftColorView.backgroundColor = theme?.secondaryColor
        tickerLabel.textColor = theme?.headerFontColor
        
        
    }
    
    

}
