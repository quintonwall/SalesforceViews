//
//  Themes.swift
//  SalesforceViews
//
//  Created by Quinton Wall on 7/15/17.
//  Copyright © 2017 me.quinton. All rights reserved.
//

import UIKit

class ChalkboardTheme: Theme {
    
    var mainColor : UIColor { return .asbestosColor() }
    
    var secondaryColor: UIColor { return .cloudsColor() }
    
    var labelFont: UIFont { return UIFont(name: "Chalkduster", size: 12)! }
    
    var labelFontColor: UIColor { return .darkGray }
    
    var headerFont: UIFont { return UIFont(name: "Chalkduster", size: 15)! }
    
    var headerFontColor: UIColor { return .darkGray}
    
    var navigationBarColor: UIColor { return .cloudsColor() }
    
    var navigationBarFontColor : UIColor { return .darkGray }
    
    var navigationBarFont : UIFont { return UIFont(name: "Chalkduster", size: 22)! }
    
}

class TerminalTheme: Theme {
    
    var mainColor : UIColor { return .midnightBlueColor() }
    
    var secondaryColor: UIColor { return .wisteriaColor() }
    
    var labelFont: UIFont { return UIFont(name: "Courier", size: 16)! }
    
    var labelFontColor: UIColor { return UIColor.white }
    
    var headerFont: UIFont { return UIFont(name: "Courier", size: 20)! }
    
    var headerFontColor: UIColor { return .pumpkinColor()}
    
    var navigationBarColor: UIColor { return .belizeHoleColor() }
    
    var navigationBarFontColor : UIColor { return .cloudsColor() }
    
    var navigationBarFont : UIFont { return UIFont(name: "Helvetica", size: 22)! }
    
}

class BumbleBeeTheme: Theme {
    
    var mainColor : UIColor { return .sunflowerColor() }
    
    var secondaryColor: UIColor { return UIColor.black }
    
    var labelFont: UIFont { return UIFont(name: "Helvetica", size: 16)! }
    
    var labelFontColor: UIColor { return UIColor.black }
    
    var headerFont: UIFont { return UIFont(name: "Helvetica", size: 20)! }
    
    var headerFontColor: UIColor { return UIColor.black }
    
    var navigationBarColor: UIColor { return UIColor.black }
    
    var navigationBarFontColor : UIColor { return .sunflowerColor() }
    
    var navigationBarFont : UIFont { return UIFont(name: "Helvetica", size: 22)! }

}


