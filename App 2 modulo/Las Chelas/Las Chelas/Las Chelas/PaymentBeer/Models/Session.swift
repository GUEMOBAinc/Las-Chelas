//
//  Session.swift
//  Las Chelas
//
//  Created by Guerrero Azpitarte Adrian on 27/10/18.
//  Copyright © 2018 Adrian. All rights reserved.
//


import UIKit

class Session: NSObject {
    var token: String?
    static let sharedInstance = Session()
    override private init() {
        super.init()
    }
    
    func saveSession() {
        token = "001122"
    }
}
