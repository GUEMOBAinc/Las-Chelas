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
    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellStatic = tableView.dequeueReusableCell(withIdentifier: "cellStatic", for: indexPath)
        let cellDynamic = tableView.dequeueReusableCell(withIdentifier: "cellDynamic", for: indexPath) as! BeerDetailCell
        
        if indexPath.row != 0{
            return cellDynamic
        }else{
            return cellStatic
        }
    }


}
