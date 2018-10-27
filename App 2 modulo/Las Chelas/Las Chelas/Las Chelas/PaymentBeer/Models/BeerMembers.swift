//
//  BeerMembers.swift
//  Las Chelas
//
//  Created by Guerrero Azpitarte Adrian on 27/10/18.
//  Copyright © 2018 Adrian. All rights reserved.
//

import UIKit

class BeerMember: NSObject {
    static let userName = "adrianAzpi"
    static let password = "verySecurePassword"
    static let session = Session.sharedInstance
    
    static let hasSession = false
    static func login(userName: String, password: String) -> Bool {
        if self.userName == userName {
            session.saveSession()
            return true
        }
        return false
    }
}
