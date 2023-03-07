//
//  CategoryEntity+Extension.swift
//  Shadow Mountain
//
//  Created by adrian garcia on 3/7/23.
//

import Foundation
import CoreData

extension CategoryEntity: BaseModel {
    
    static var all: NSFetchRequest<CategoryEntity> {
        let request = CategoryEntity.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        return request
    }
}
