//
//  Model.swift
//  CoffeeShop
//
//  Created by adrian garcia on 10/28/22.
//

import Foundation

class Menu: Identifiable, Codable {
    
    var id: Int
    var category: String
    var title: String
    var image: String
    var size: [String]
    var price: [Double]
    var detail: String?
}
