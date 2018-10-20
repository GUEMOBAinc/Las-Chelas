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
}
struct Price{
    let volume: String
    let cost: Double
}
