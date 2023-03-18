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
    
    @Published var specialsArray = [ProductModel]()
    @Published var categoriesArray = [CategoryModel]()
    @Published var breakfastSandwichesArray = [ProductModel]()
    @Published var coldDrinksArray = [ProductModel]()
    @Published var hotDrinksArray = [ProductModel]()
    @Published var muffinTopsArray = [ProductModel]()
    @Published var cookiesArray = [ProductModel]()
    
    let specialsFetchResultsController: NSFetchedResultsController<ProductEntity>
    let categoryFetchResultsController: NSFetchedResultsController<CategoryEntity>
    let breakfastSandwichesFetchResultsController: NSFetchedResultsController<ProductEntity>
    let coldDrinksFetchResultsController: NSFetchedResultsController<ProductEntity>
    let hotDrinksFetchResultsController: NSFetchedResultsController<ProductEntity>
    let muffinTopsFetchResultsController: NSFetchedResultsController<ProductEntity>
    let cookiesFetchResultsController: NSFetchedResultsController<ProductEntity>
    
    override init() {
        
        specialsFetchResultsController = NSFetchedResultsController(fetchRequest: ProductEntity.specials, managedObjectContext: contex, sectionNameKeyPath: nil, cacheName: nil)
        categoryFetchResultsController = NSFetchedResultsController(fetchRequest: CategoryEntity.all, managedObjectContext: contex, sectionNameKeyPath: nil, cacheName: nil)
        breakfastSandwichesFetchResultsController = NSFetchedResultsController(fetchRequest: ProductEntity.breakfastSandwiches, managedObjectContext: contex, sectionNameKeyPath: nil, cacheName: nil)
        coldDrinksFetchResultsController = NSFetchedResultsController(fetchRequest: ProductEntity.coldDrinks, managedObjectContext: contex, sectionNameKeyPath: nil, cacheName: nil)
        hotDrinksFetchResultsController = NSFetchedResultsController(fetchRequest: ProductEntity.hotDrinks, managedObjectContext: contex, sectionNameKeyPath: nil, cacheName: nil)
        muffinTopsFetchResultsController = NSFetchedResultsController(fetchRequest: ProductEntity.muffinTops, managedObjectContext: contex, sectionNameKeyPath: nil, cacheName: nil)
        cookiesFetchResultsController = NSFetchedResultsController(fetchRequest: ProductEntity.cookies, managedObjectContext: contex, sectionNameKeyPath: nil, cacheName: nil)
        
        super.init()
        
        specialsFetchResultsController.delegate = self
        categoryFetchResultsController.delegate = self
        breakfastSandwichesFetchResultsController.delegate = self
        coldDrinksFetchResultsController.delegate = self
        hotDrinksFetchResultsController.delegate = self
        muffinTopsFetchResultsController.delegate = self
        cookiesFetchResultsController.delegate = self
        
        do {
            try specialsFetchResultsController.performFetch()
            try categoryFetchResultsController.performFetch()
            try breakfastSandwichesFetchResultsController.performFetch()
            try coldDrinksFetchResultsController.performFetch()
            try hotDrinksFetchResultsController.performFetch()
            try muffinTopsFetchResultsController.performFetch()
            try cookiesFetchResultsController.performFetch()
            
            guard let specialsObjects = specialsFetchResultsController.fetchedObjects else { print("🫥 fetched specialsObjects failed"); return }
            guard let categoryObjects = categoryFetchResultsController.fetchedObjects else { print("🫵🏿 fetchObjects failed"); return }
            guard let breakfastSandwichesObjects = breakfastSandwichesFetchResultsController.fetchedObjects else { print("🤖 fetchObjects failed"); return }
            guard let coldDrinksObjects = coldDrinksFetchResultsController.fetchedObjects else { print("🤬 fetched coldDrinksObjects failed"); return }
            guard let hotDrinksObjects = hotDrinksFetchResultsController.fetchedObjects else { print("😶‍🌫️ fetched hotDrinksObjects failed"); return }
            guard let muffinTopsObjects = muffinTopsFetchResultsController.fetchedObjects else { print("🦐 fetched muffinTopsObjects failed"); return }
            guard let cookiesObjects = cookiesFetchResultsController.fetchedObjects else { print("🐣 fetched cookiesObjects failed"); return }
            
            specialsArray = specialsObjects.map(ProductModel.init)
            categoriesArray = categoryObjects.map(CategoryModel.init)
            breakfastSandwichesArray = breakfastSandwichesObjects.map(ProductModel.init)
            coldDrinksArray = coldDrinksObjects.map(ProductModel.init)
            hotDrinksArray = hotDrinksObjects.map(ProductModel.init)
            muffinTopsArray = muffinTopsObjects.map(ProductModel.init)
            cookiesArray = cookiesObjects.map(ProductModel.init)
           
//            printArrays(int: 0)
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
            case ProductEntity.breakfastSandwiches:
                breakfastSandwichesArray = results.map(ProductModel.init)
            case ProductEntity.specials:
                specialsArray = results.map(ProductModel.init)
            case ProductEntity.coldDrinks:
                coldDrinksArray = results.map(ProductModel.init)
            case ProductEntity.hotDrinks:
                hotDrinksArray = results.map(ProductModel.init)
            case ProductEntity.muffinTops:
                muffinTopsArray = results.map(ProductModel.init)
            case ProductEntity.cookies:
                cookiesArray = results.map(ProductModel.init)
            default:
                breakfastSandwichesArray = results.map(ProductModel.init)
            }
        }
//        printArrays(int: 0)
    }
}

extension ViewModel {
    func getCrap() {
        fireModel.loadCategories()
        fireModel.loadMenu()
    }
    
//    func printArrays(int: Int? = nil) {
////        cookiesArray.forEach { i in
////            print("😠 \(i.title)")
////            print("😠 \(i.category)")
////            print("😠 \(i.price)")
////        }
////        muffinTopsArray.forEach { i in
////            print("😠 \(i.title)")
////            print(i.category)
////            print(i.price)
////            print(i.size)
////        }
////        hotDrinksArray.forEach { i in
////            print("😠 \(i.title)")
////            print(i.category)
////            print(i.price)
////            print(i.size)
////        }
////        coldDrinksArray.forEach { i in
////            print("😠 \(i.title)")
////            print(i.category)
////            print(i.price)
////            print(i.size)
////        }
////        breakfastSandwichesArray.forEach { i in
////            print("😠 \(i.title)")
////            print(i.type ?? "no type on loop")
////            print(i.category)
////            print(i.price)
////            print(i.size)
////        }
////        categoriesArray
////            .forEach { i in
////                print("😠 \(i.title)")
////            }
//        specialsArray.forEach { i in
//            print("😠 \(i.title)")
//        }
//        print(int)
//    }
    
//    static func printCrap(cat: CategoryModel?, prod: ProductModel?) {
//        print(cat)
//        print(prod)
//    }
}
