//
//  BeerService.swift
//  Las Chelas
//
//  Created by Gomez Luis on 20/10/18.
//  Copyright © 2018 Adrian. All rights reserved.
//

import UIKit

class BeerService {
    class func getAll(completion: @escaping ([Beer]) -> Void){
        let price1 = Price(volume: "80", cost: 20)
        let price2 = Price(volume: "150", cost: 40)
        let price3 = Price(volume: "300", cost: 60)
        let price4 = Price(volume: "500", cost: 80)
        
        let beer1 = Beer(name: "Corona", image: #imageLiteral(resourceName: "corona"), prices: [price1,price2,price3], country: "México", abv: 4.8)
        let beer2 = Beer(name: "Bohemia", image: #imageLiteral(resourceName: "corona"), prices: [price1,price2,price3,price4], country: "México", abv: 5.8)
        let beer3 = Beer(name: "Indio", image: #imageLiteral(resourceName: "corona"), prices: [price1,price2,price3], country: "México", abv: 6.8)
        let beer4 = Beer(name: "Becks", image: #imageLiteral(resourceName: "corona"), prices: [price1,price4], country: "Alemania", abv: 5.0)
        let beer5 = Beer(name: "Presidente", image: #imageLiteral(resourceName: "corona"), prices: [price1,price2,price3], country: "República Dominica", abv: 4.0)
        let beer6 = Beer(name: "Partito", image: #imageLiteral(resourceName: "corona"), prices: [price2,price3], country: "México", abv: 4.3)
        let beer7 = Beer(name: "Budweiser", image: #imageLiteral(resourceName: "corona"), prices: [price4], country: "Checoslovaquia", abv: 8.0)
        
        let beers = [beer1, beer2, beer3, beer4, beer5, beer6, beer7]
        completion(beers)
    }
}
