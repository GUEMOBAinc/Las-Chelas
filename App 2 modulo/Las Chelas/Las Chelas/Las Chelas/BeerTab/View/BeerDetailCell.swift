//
//  BeerDetailCell.swift
//  Las Chelas
//
//  Created by Guerrero Azpitarte Adrian on 20/10/18.
//  Copyright © 2018 Adrian. All rights reserved.
//

import UIKit

class BeerDetailCell: UITableViewCell {

    @IBOutlet weak var amountMlLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var amountOfBeerLabel: UILabel!
    var amount = 0{
        didSet{
            updateAmountLabel()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        updateAmountLabel()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func updateAmountLabel(){
        amountOfBeerLabel.text = String(amount)
    }
}
