//
//  Model.swift
//  CoffeeShop
//
//  Created by adrian garcia on 10/28/22.
//

import Foundation
import CoreData

struct ProductModel: Identifiable {
    
    private var productEntity: ProductEntity
    
    init(productEntity: ProductEntity) {
        self.productEntity = productEntity
    }
    
    var id: NSManagedObjectID {
        productEntity.objectID
    }
    var category: String {
        productEntity.category ?? ""
    }
    var title: String {
        productEntity.title ?? ""
    }
    var size: [String]? {
        productEntity.size
    }
    var price: [String] {
        productEntity.size ?? []
    }
    var detail: String? {
        productEntity.detail
    }
    var type: [String]? {
        productEntity.type
    }
}
