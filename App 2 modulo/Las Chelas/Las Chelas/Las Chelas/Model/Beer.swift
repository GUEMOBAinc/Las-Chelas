//
//  Beer.swift
//  Las Chelas
//
//  Created by Gomez Luis on 20/10/18.
//  Copyright © 2018 Adrian. All rights reserved.
//

import UIKit

struct Beer{
    let name: String
    let image: UIImage
    let prices: [Price]
    let country: String
    let abv: Double
    var status: Status?
}
struct Price{
    let volume: String
    let cost: Double
}


enum Status: Int {
    case ready = 0
    case waiting
    case process
    case pick
    
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

