//
//  ThemeManager.swift
//  SalesforceViews
//
//  Created by Quinton Wall on 7/14/17.
//  Copyright © 2017 me.quinton. All rights reserved.
//

import UIKit

protocol Theme {
     var mainColor : UIColor { get }
     var secondaryColor : UIColor { get }
     var labelFont : UIFont { get }
     var labelFontColor : UIColor { get }
     var headerFont : UIFont { get }
     var headerFontColor : UIColor { get }
     var navigationBarColor : UIColor { get }
     var navigationBarFontColor : UIColor { get }
     var navigationBarFont : UIFont { get }
}


let SelectedThemeKey = "SelectedTheme"

class ThemeManager {
    
    public static let shared = ThemeManager()
    
    private var theme : Theme = TerminalTheme()
    
    public func set(newtheme: Theme) {
        
        theme = newtheme
        
        let sharedApplication = UIApplication.shared
        //standard font attributes for labels
        let labelattrs = [
            NSForegroundColorAttributeName: theme.labelFontColor,
            NSFontAttributeName: theme.labelFont
        ]
        //UILabel.appearance().
        
        
        //main colors
        sharedApplication.delegate?.window??.tintColor = theme.mainColor
        UIView.appearance().backgroundColor = theme.mainColor
        
        //nav bar
        UINavigationBar.appearance().backgroundColor = theme.navigationBarColor
       // UINavigationBar.appearance().
        
        let navbarattrs = [
            NSForegroundColorAttributeName: theme.navigationBarFontColor,
            NSFontAttributeName: theme.navigationBarFont
        ]
        
        UINavigationBar.appearance().titleTextAttributes = navbarattrs
        
        
    }
    
    public func currentTheme() -> Theme {
        return theme
    }
    
    /*
    static func currentTheme() -> Theme {
        if let storedTheme = UserDefaults.standard.object(forKey: SelectedThemeKey) as? Theme {
            return storedTheme
        } else {
            return TerminalTheme()
        }
    }
    
    static func set(theme: Theme) {
        UserDefaults.standard.set(theme, forKey: SelectedThemeKey)
        
        let sharedApplication = UIApplication.shared
        sharedApplication.delegate?.window??.tintColor = theme.mainColor
        UIView.appearance().backgroundColor = theme.mainColor
    }
    */
}
