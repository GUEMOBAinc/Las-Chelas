//
//  ViewController.swift
//  Las Chelas
//
//  Created by Adrian on 9/26/18.
//  Copyright © 2018 Adrian. All rights reserved.
//

import UIKit

class BeerViewController: UICollectionViewController {

    var beers = [Beer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllBeers()
        navigationController?.tabBarItem.image = UIImage(named: "iconBeer")?.withRenderingMode(.alwaysOriginal)
        let tabBarOrder = navigationController?.tabBarController?.tabBar.items![1]
        tabBarOrder?.image = UIImage(named: "iconOrder")?.withRenderingMode(.alwaysOriginal)
        navigationController?.tabBarController?.tabBar.items![2].image = UIImage(named: "iconAccount")?.withRenderingMode(.alwaysOriginal)
        let orders = StorageService.shared.loadOrders()
        if let orders = orders{
            let number = orders.filter({ $0.status == .ready }).count
            tabBarOrder?.badgeValue = String(number)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    func getAllBeers(){
        BeerService.getAll { [weak self] (beers) in
            self?.beers = beers
        }
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return beers.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BeerCell", for: indexPath) as! BeerCell
        let beer = beers[indexPath.row]
        cell.nameLabel.text = beer.name
        cell.imageView.image = beer.image
        return cell
    }
    func showDetail(beer: Beer) {
        //let detailVC = BeerDetailSBViewController()
        //detailVC.beer = beer
        //present(detailVC, animated: true, completion: nil)
        //navigationController?.pushViewController(detailVC, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! BeerDetailSBViewController
        let cell = sender as! BeerCell
        let index = collectionView?.indexPath(for: cell)
        detailVC.beer = beers[(index?.row)!]
        
    }
}

