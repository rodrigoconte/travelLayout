//
//  Travel.swift
//  autoLayout
//
//  Created by Rodrigo Conte on 14/01/21.
//

import Foundation

class Travel {
    let title: String
    let days: Int
    let price: String
    let imgPath: String
    
    internal init(title: String, days: Int, price: String, imgPath: String) {
        self.title = title
        self.days = days
        self.price = price
        self.imgPath = imgPath
    }
}
