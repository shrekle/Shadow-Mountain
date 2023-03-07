//
//  Shadow_MountainApp.swift
//  Shadow Mountain
//
//  Created by adrian garcia on 3/2/23.
//

import SwiftUI
import Firebase

@main
struct Shadow_MountainApp: App {
    
    let context = CoreData.shared.contex
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ViewModel())
                .environment(\.managedObjectContext, context)
        }
    }
}
