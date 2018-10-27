//
//  Order.swift
//  Las Chelas
//
//  Created by Guerrero Azpitarte Adrian on 26/10/18.
//  Copyright © 2018 Adrian. All rights reserved.
//

import Foundation

struct Order: Codable{
    let name: String
    let country: String
    let abv: Double
    let status: Status
    let volume: String
    let cost: Double
}

enum Status: Int, Codable {
    case pick = 0
    case ready
    case waiting
    case process
    
    func description() -> String {
        switch self {
        case .ready:
            return "Lista para ordenar"
        case .waiting:
            return "Pendiente"
        case .process:
            return "En proceso"
        case .pick:
            return "Recógela"
        }
    }
}
