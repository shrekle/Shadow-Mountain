//
//  PoductEntity+Extension.swift
//  Shadow Mountain
//
//  Created by adrian garcia on 3/4/23.
//

import Foundation
import CoreData

extension ProductEntity: BaseModel {
    
    
    static var specials: NSFetchRequest<ProductEntity> {
        let request = ProductEntity.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        request.predicate = NSPredicate(format: "%K CONTAINS[c] %@", #keyPath(ProductEntity.category), "specials")
        return request
    }
    static var breakfastSandwiches: NSFetchRequest<ProductEntity> {
        let request = ProductEntity.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        request.predicate = NSPredicate(format: "%K CONTAINS[c] %@", #keyPath(ProductEntity.category), "Breakfast Sandwiches")
        return request
    }
    static var coldDrinks: NSFetchRequest<ProductEntity> {
        let request = ProductEntity.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        request.predicate = NSPredicate(format: "%K CONTAINS[c] %@", #keyPath(ProductEntity.category), "Cold Drinks")
        return request
    }
    static var hotDrinks: NSFetchRequest<ProductEntity> {
        let request = ProductEntity.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        request.predicate = NSPredicate(format: "%K CONTAINS[c] %@", #keyPath(ProductEntity.category), "Hot Drinks")
        return request
    }
    static var cookies: NSFetchRequest<ProductEntity> {
        let request = ProductEntity.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        request.predicate = NSPredicate(format: "%K CONTAINS[c] %@", #keyPath(ProductEntity.category), "Cookies")
        return request
    }
    static var muffinTops: NSFetchRequest<ProductEntity> {
         let request = ProductEntity.fetchRequest()
         request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        request.predicate = NSPredicate(format: "%K CONTAINS[c] %@", #keyPath(ProductEntity.category), "Muffin Tops")
         return request
     }
}
