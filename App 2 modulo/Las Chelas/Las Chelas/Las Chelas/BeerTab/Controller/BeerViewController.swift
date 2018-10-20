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
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        /*
        let detailVC = BeerDetailSBViewController()
        detailVC.beer = beers[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
         */
    }
}

