//
//  BeerButton.swift
//  Las Chelas
//
//  Created by Gomez Luis on 27/10/18.
//  Copyright © 2018 Adrian. All rights reserved.
//

import UIKit

@IBDesignable
class BeerButton: UIButton {
    @IBInspectable var cornerRadiusValue: CGFloat = 10.0 {
        didSet {
            setUpView()
        }
    }
    @IBInspectable var bgColor: UIColor = UIColor.white {
        didSet {
            setUpView()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setUpView()
    }
    func setUpView() {
        self.layer.cornerRadius = self.cornerRadiusValue
        self.clipsToBounds = true
        self.layer.backgroundColor = bgColor.cgColor
    }
}
