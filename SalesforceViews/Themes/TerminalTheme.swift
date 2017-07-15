//
//  TerminalTheme.swift
//  SalesforceViews
//
//  Created by Quinton Wall on 7/14/17.
//  Copyright © 2017 me.quinton. All rights reserved.
//

import UIKit


class TerminalTheme: Theme {
    
     var mainColor : UIColor { return .midnightBlueColor() }
    
     var secondaryColor: UIColor { return .wisteriaColor() }
    
     var labelFont: UIFont { return UIFont(name: "Courier", size: 16)! }
    
     var labelFontColor: UIColor { return UIColor.white }
    
     var headerFont: UIFont { return UIFont(name: "Courier", size: 20)! }
    
     var headerFontColor: UIColor { return .pumpkinColor()}
    
    var navigationBarColor: UIColor { return .belizeHoleColor() }
    
    var navigationBarFontColor : UIColor { return .cloudsColor() }
    
    var navigationBarFont : UIFont { return UIFont(name: "Helvetica", size: 25)! }
    
}
