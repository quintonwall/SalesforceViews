//
//  SalesforceViewsGlobals.swift
//  SalesforceViews
//
//  Created by QUINTON WALL on 4/8/17.
//  Copyright © 2017 me.quinton. All rights reserved.
//

import Foundation
import UIKit

public final class SalesforceViewsDefaults {
    public static let shared = SalesforceViewsDefaults()
    
    
}

public enum SalesforceViewError: Error {
    case notificationObjectMismatch
}


public struct ColorPalette {
    static let primaryDark: UIColor = UIColor(netHex: 0x397367)
    static let primaryLight: UIColor = UIColor(netHex: 0x5DA38B)
    static let secondaryDark: UIColor = UIColor(netHex: 0x42858C)
    static let secondaryLight: UIColor = UIColor(netHex: 0x63CCCA)
    static let tertiary: UIColor = UIColor(netHex: 0x35393C)
}

public struct ViewNotifications {
    static let accountList : String = "sfv-account-list"
    static let accountDetail : String = "sfv-account-detail"
    static let accountInsert : String = "sfv-account-insert"
    static let accountUpdate : String = "sfv-account-update"
    static let accountDelete : String = "sfv-account-delete"
}
