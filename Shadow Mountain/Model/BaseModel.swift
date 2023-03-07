//
//  BaseModel.swift
//  Shadow Mountain
//
//  Created by adrian garcia on 3/4/23.
//

import Foundation
import CoreData

protocol BaseModel {
    func save() throws
    func delete() throws
}

extension BaseModel where Self: NSManagedObject {
    static var contex: NSManagedObjectContext {
        CoreData.shared.contex
    }
    func save() throws {
        try Self.contex.save()
    }
    func delete() throws {
        Self.contex.delete(self)
        try save()
    }
}
