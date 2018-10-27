//
//  StorageService.swift
//  Las Chelas
//
//  Created by Gomez Luis on 26/10/18.
//  Copyright © 2018 Adrian. All rights reserved.
//

import Foundation

class StorageService {
    static let shared = StorageService()
    
    let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    var ArchiveURL: URL {
        return DocumentsDirectory.appendingPathComponent("beers").appendingPathExtension("plist")
    }
    func saveOrders(_ orders: [Order]){
        let propertyListEncoder = PropertyListEncoder()
        
        if let oldOrders = loadOrders(){
            let allOrders = oldOrders + orders
            let codeOrders = try? propertyListEncoder.encode(allOrders)
            do {
                try codeOrders?.write(to: ArchiveURL, options: .noFileProtection)
                print("save succeed")
            } catch {
                print("save failed")
            }
        }else{
            let codeOrders = try? propertyListEncoder.encode(orders)
            do {
                try codeOrders?.write(to: ArchiveURL, options: .noFileProtection)
                print("save succeed")
            } catch {
                print("save failed")
            }
        }
    }
    func loadOrders() -> [Order]?  {
        guard let codeOrders = try? Data(contentsOf: ArchiveURL) else {return nil}
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode(Array<Order>.self,from: codeOrders)
    }
}
