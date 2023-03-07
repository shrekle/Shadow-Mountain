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
    
    @Published var categoriesArray = [CategoryModel]()
    @Published var productsArray = [ProductModel]()
    @Published var specialsArray = [ProductModel]()
    
    let ProductsFetchResultsController: NSFetchedResultsController<ProductEntity>
    let specialsFetchResultsController: NSFetchedResultsController<ProductEntity>
    let categoryFetchResultsController: NSFetchedResultsController<CategoryEntity>
    
    override init() {
        categoryFetchResultsController = NSFetchedResultsController(fetchRequest: CategoryEntity.all, managedObjectContext: contex, sectionNameKeyPath: nil, cacheName: nil)
        ProductsFetchResultsController = NSFetchedResultsController(fetchRequest: ProductEntity.all, managedObjectContext: contex, sectionNameKeyPath: nil, cacheName: nil)
        specialsFetchResultsController = NSFetchedResultsController(fetchRequest: ProductEntity.specials, managedObjectContext: contex, sectionNameKeyPath: nil, cacheName: nil)
        
        super.init()
        
        categoryFetchResultsController.delegate = self
        ProductsFetchResultsController.delegate = self
        specialsFetchResultsController.delegate = self
        
        do {
            try categoryFetchResultsController.performFetch()
            try ProductsFetchResultsController.performFetch()
            try specialsFetchResultsController.performFetch()
            
            guard let categoryObjects = categoryFetchResultsController.fetchedObjects else { print("🫵🏿 fetchObjects failed"); return }
            guard let productsObjects = ProductsFetchResultsController.fetchedObjects else { print("🤖 fetchObjects failed"); return }
            guard let specialsObjects = specialsFetchResultsController.fetchedObjects else { print("🫥 fetched specialsObjects failed"); return }
            
            categoriesArray = categoryObjects.map(CategoryModel.init)
            productsArray = productsObjects.map(ProductModel.init)
            specialsArray = specialsObjects.map(ProductModel.init)
        }
        catch let error { print("🤑 \(error)") }
    }
}

extension ViewModel: NSFetchedResultsControllerDelegate {
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
      
        if let results = controller.fetchedObjects as? [CategoryEntity] {
            categoriesArray = results.map(CategoryModel.init)
        }
        
        if let results = controller.fetchedObjects as? [ProductEntity]  {
            switch controller.fetchRequest {
            case ProductEntity.all:
                productsArray = results.map(ProductModel.init)
            case ProductEntity.specials:
                specialsArray = results.map(ProductModel.init)
            default:
                productsArray = results.map(ProductModel.init)
            }
        }
    }
}

extension ViewModel {
    func getCrap() {
        fireModel.loadCategories()
        fireModel.loadMenu()
    }
}
