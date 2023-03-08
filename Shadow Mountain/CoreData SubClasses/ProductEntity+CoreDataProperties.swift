//
//  ProductEntity+CoreDataProperties.swift
//  Shadow Mountain
//
//  Created by adrian garcia on 3/8/23.
//
//

import SwiftUI
import CoreData


extension ProductEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductEntity> {
        return NSFetchRequest<ProductEntity>(entityName: "ProductEntity")
    }

    @NSManaged public var category: String?
    @NSManaged public var detail: String?
    @NSManaged public var image: UIImage?
    @NSManaged public var price: [String]?
    @NSManaged public var size: [String]?
    @NSManaged public var title: String?
    @NSManaged public var type: [String]?

}

extension ProductEntity : Identifiable {

}
