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
    
    var beer: Beer?
    
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


}
