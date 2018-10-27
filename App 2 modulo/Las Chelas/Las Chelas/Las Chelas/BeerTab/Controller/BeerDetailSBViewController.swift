//
//  BeerDetailSBViewController.swift
//  Las Chelas
//
//  Created by Guerrero Azpitarte Adrian on 20/10/18.
//  Copyright © 2018 Adrian. All rights reserved.
//

import UIKit

class BeerDetailSBViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var beerImage: UIImageView!
    @IBOutlet weak var beerNameLabel: UILabel!
    @IBOutlet weak var countryBeerLabel: UILabel!
    @IBOutlet weak var porcentageOfAlcohol: UILabel!
    @IBOutlet weak var beerCounterLabel: UILabel!

    
    var beer: Beer?
    var orders = [Order]()
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.delegate = self
        //tableView.dataSource = self
        beerNameLabel.text = beer?.name
        beerImage.image = beer?.image
        countryBeerLabel.text = beer?.country
        if let abv = beer?.abv{
          porcentageOfAlcohol.text = String(abv)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let beer = beer else {return 0}
        return beer.prices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellDynamic = tableView.dequeueReusableCell(withIdentifier: "cellDynamic", for: indexPath) as! BeerDetailCell
        let amount = beer?.prices[indexPath.row].volume
        guard let price = beer?.prices[indexPath.row].cost else {return cellDynamic}
        cellDynamic.amountMlLabel.text = amount
        cellDynamic.priceLabel.text = String(price)
        return cellDynamic
    }
    //Add beer to an order
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? BeerDetailCell
        guard let beer = beer else {return}
        let price = beer.prices[indexPath.row].cost
        let volume = beer.prices[indexPath.row].volume
        let order = Order(name: beer.name, country: beer.country, abv: beer.abv, status: .ready, volume: volume, cost: price)
        cell?.amount += 1
        orders.append(order)
        updateLabel()
    }
    
    //Substract beer to an order
    func tableView(_ tableView: UITableView, commit
        editingStyle: UITableViewCellEditingStyle, forRowAt indexPath:
        IndexPath) {
        if editingStyle == .delete {
            guard let beer = beer else {return}
            let price = beer.prices[indexPath.row].cost
            let volume = beer.prices[indexPath.row].volume
            let cell = tableView.cellForRow(at: indexPath) as? BeerDetailCell
            for (index,order) in orders.enumerated() {
                if order.cost == price, order.volume == volume{
                    orders.remove(at: index)
                    cell?.amount -= 1
                    updateLabel()
                    break
                }
            }
            //ToDo.saveToDos(todos)
        }
    }

    func updateLabel(){
        beerCounterLabel.text = "Cerveza: \(orders.count)"
    }
    
   
   
}
