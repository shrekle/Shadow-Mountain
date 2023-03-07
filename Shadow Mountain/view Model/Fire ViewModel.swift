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
        loadData()
    }
    
    func loadData() {
        db.collection("menu").getDocuments { qsnap, error in

            guard error == nil, let qsnap else {  print("😻 load data 1st guard"); return }

            qsnap.documents.forEach { doc in
                guard let keys = doc["keys"] as? [String] else { print("😺 keys failed"); return }
               
//                guard let image = doc["image"] as? UIImage else { print("👽 image failed"); return }
                
                keys.forEach { key in
                    self.db.collection("menu").document(doc.documentID).collection(key).document("details").getDocument { snap, error in
                        guard error == nil, let snap else { print("🤡 details for products failed"); return }
                      
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
