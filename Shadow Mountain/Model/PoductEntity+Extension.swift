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
    static var all: NSFetchRequest<ProductEntity> {
         let request = ProductEntity.fetchRequest()
         request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        request.predicate = NSPredicate(format: "NOT %K CONTAINS[c] %@", #keyPath(ProductEntity.category), "specials")
         return request
     }
    static var categories: NSFetchRequest<ProductEntity> {
        let request = ProductEntity.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "titles", ascending: true)]
        return request
    }
}
