//
//  Shadow_MountainApp.swift
//  Shadow Mountain
//
//  Created by adrian garcia on 3/2/23.
//

import SwiftUI

@main
struct Shadow_MountainApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ViewModel())        }
    }
}
