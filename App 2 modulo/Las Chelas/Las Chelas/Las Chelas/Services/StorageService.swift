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
    func saveOrders(_ todos: [Order]){
        let propertyListEncoder = PropertyListEncoder()
        let codeToDos = try? propertyListEncoder.encode(todos)
        do {
            try codeToDos?.write(to: ArchiveURL, options: .noFileProtection)
        } catch {
            print("save failed")
        }
    }
    func loadOrders() -> [Order]?  {
        guard let codedToDos = try? Data(contentsOf: ArchiveURL) else {return nil}
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode(Array<Order>.self,from: codedToDos)
    }
}
