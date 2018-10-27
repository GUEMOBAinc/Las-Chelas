//
//  PaymentViewController.swift
//  Las Chelas
//
//  Created by Guerrero Azpitarte Adrian on 27/10/18.
//  Copyright © 2018 Adrian. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func payButtonTapped(_ sender: Any) {
        if BeerMember.hasSession{
        performSegue(withIdentifier: "hasSession", sender: self)
        }else {
            performSegue(withIdentifier: "hasNoSession", sender: self)
        }
    }
    
   

}
