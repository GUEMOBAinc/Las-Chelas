//
//  Beer.swift
//  Las Chelas
//
//  Created by Gomez Luis on 20/10/18.
//  Copyright © 2018 Adrian. All rights reserved.
//

import Foundation

struct Product: Codable {
    let name: String
    let description: String
    let meta: [String: String]
    let variants: [Variant]
    let category: Category
}

