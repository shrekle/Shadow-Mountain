//
//  CoreData Manager.swift
//  Shadow Mountain
//
//  Created by adrian garcia on 3/3/23.
//

import Foundation
import CoreData

class CoreData  {
    
    static let shared = CoreData()
    
    let container: NSPersistentContainer
    let contex: NSManagedObjectContext
    
    init() {
        ValueTransformer.setValueTransformer(UIImageTranny(), forName: NSValueTransformerName("UIImageTranny"))
        
        container = NSPersistentContainer(name: "coredata")
        container.loadPersistentStores { description, error in
            if let error { print("💩 coredata initialization took a dump!!!")}
        }
        contex = container.viewContext
    }
}
