//
//  ViewModel.swift
//  CoffeeShop
//
//  Created by adrian garcia on 10/25/22.
//

import Foundation
import CoreData

@MainActor
class ViewModel: NSObject, ObservableObject {
    
    var fireModel = FireViewModel()
    private var contex = CoreData.shared.contex
    
    @Published var productsArray = [ProductModel]()
    
    let ProductsfetchResultsController: NSFetchedResultsController<ProductEntity>
    
    override init() {
        ProductsfetchResultsController = NSFetchedResultsController(fetchRequest: ProductEntity.all, managedObjectContext: contex, sectionNameKeyPath: nil, cacheName: nil)
        
        super.init()
        
        ProductsfetchResultsController.delegate = self
        
        do {
            try ProductsfetchResultsController.performFetch()
            guard let productsObjects = ProductsfetchResultsController.fetchedObjects else { print("🤖 fetchObjects failed"); return }
            
            productsArray = productsObjects.map(ProductModel.init)
            
        }
        catch let error { print("🤑 \(error)") }
    }
}

extension ViewModel: NSFetchedResultsControllerDelegate {
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let results = controller.fetchedObjects as? [ProductEntity] else { print("👄 controllerDidChange failed"); return }
        
        productsArray = results.map(ProductModel.init)
    }
}

extension ViewModel {
    func getCrap() {
        fireModel.loadData()
    }
}
