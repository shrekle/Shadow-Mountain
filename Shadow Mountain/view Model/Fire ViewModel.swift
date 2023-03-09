//
//  FB ViewModel.swift
//  Shadow Mountain
//
//  Created by adrian garcia on 3/3/23.
//

import SwiftUI
import Firebase
import FirebaseStorage

class FireViewModel {
    
    /// create a time stamp for updates
    
    let db = Firestore.firestore()
    let storageRef = Storage.storage().reference()
    let contex = CoreData.shared.contex
    
    func timeStamp() {
        loadMenu()
    }
    
    func loadCategories() {
        db.collection("categories").getDocuments { qsnap, error in
            guard error == nil, let qsnap else { print("💩 categories 1sr call guard failed"); return }
            
            qsnap.documents.forEach { doc in
                
                let fileRef = self.storageRef.child(doc["image"] as! String)
                
                fileRef.getData(maxSize: 1*1024*1024) { data, error in
                    guard error == nil, let data else { print("👄 fileRef guard failed...\(String(describing: error))"); return }
                    
                    guard let image = UIImage(data: data) else {print("🐤 uiimage failed \(String(describing: error))"); return }
                    
                    let category = CategoryEntity(context: self.contex)
                    category.title = doc["title"] as? String
                    category.image = image
                    
                    do {
                        try category.save()
                    }
                    catch let error { print("🐝 \(error)")}
                }
            }
        }
    }
    
    func loadMenu() {
        db.collection("menu").getDocuments { qsnap, error in

            guard error == nil, let qsnap else {  print("😻 load data 1st guard"); return }
            
            qsnap.documents.forEach { doc in
                guard let keys = doc["keys"] as? [String] else { print("😺 keys failed"); return }
                      
                keys.forEach { key in
                    self.db.collection("menu").document(doc.documentID).collection(key).document("details").getDocument { snap, error in
                        guard error == nil, let snap else { print("🤡 details for products failed"); return }
                        
                        if let path = snap["image"] as? String {
                            
                            let fileRef = self.storageRef.child(path)
                            
                            fileRef.getData(maxSize: 1*1024*1024) { data, error in
                                guard error == nil, let data else { print("🥳 menu image guard failed\(String(describing: error))"); return }
                                
                                guard let image = UIImage(data: data) else {print("🥵 image is being homo \(String(describing: error))"); return }
                                
                                let product = ProductEntity(context: self.contex)
                                product.title = snap["title"] as? String
                                product.size = snap["size"] as? [String]
                                product.price = snap["price"] as? [String]
                                product.type = snap["type"] as? [String]
                                product.detail = snap["detail"] as? String
                                product.category = snap["category"] as? String
                                product.image = image
                                
                                do {
                                    try product.save()
                                }
                                catch let error { print("👄 image still being homo \(error)") }
                            }
                        }
                        else {
                            let product = ProductEntity(context: self.contex)
                            product.title = snap["title"] as? String
                            product.size = snap["size"] as? [String]
                            product.price = snap["price"] as? [String]
                            product.type = snap["type"] as? [String]
                            product.detail = snap["detail"] as? String
                            product.category = snap["category"] as? String
                            
                            do {
                                try product.save()
                            }
                            catch let error { print("😶‍🌫️ \(error)") }
                        }
                    }
                }
            }
        }
        
    }
    
}
