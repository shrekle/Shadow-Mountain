//
//  CategoryEntity+CoreDataProperties.swift
//  Shadow Mountain
//
//  Created by adrian garcia on 3/7/23.
//
//

import SwiftUI
import CoreData


extension CategoryEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CategoryEntity> {
        return NSFetchRequest<CategoryEntity>(entityName: "CategoryEntity")
    }

    @NSManaged public var title: String?
    @NSManaged public var image: UIImage?

}

extension CategoryEntity : Identifiable {

}
