//
//  CategoryEntity+CoreDataProperties.swift
//  Shadow Mountain
//
//  Created by adrian garcia on 3/8/23.
//
//

import SwiftUI
import CoreData


extension CategoryEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CategoryEntity> {
        return NSFetchRequest<CategoryEntity>(entityName: "CategoryEntity")
    }

    @NSManaged public var image: UIImage?
    @NSManaged public var title: String?

}

extension CategoryEntity : Identifiable {

}
