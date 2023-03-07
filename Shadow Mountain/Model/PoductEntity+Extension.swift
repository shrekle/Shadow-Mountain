//
//  PoductEntity+Extension.swift
//  Shadow Mountain
//
//  Created by adrian garcia on 3/4/23.
//

import Foundation
import CoreData

extension ProductEntity: BaseModel {
    
   static var all: NSFetchRequest<ProductEntity> {
        let request = ProductEntity.fetchRequest()
        request.sortDescriptors = []
        return request
    }
}
