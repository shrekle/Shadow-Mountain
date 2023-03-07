//
//  CategoryModel.swift
//  Shadow Mountain
//
//  Created by adrian garcia on 3/7/23.
//

import SwiftUI
import CoreData

struct CategoryModel: Identifiable, Hashable {
    
    private var category: CategoryEntity
    
    init(category: CategoryEntity) {
        self.category = category
    }
    
    var id: NSManagedObjectID {
        category.objectID
    }
    var title: String {
        category.title ?? ""
    }
    var image: UIImage {
        category.image ?? UIImage()
    }
}
