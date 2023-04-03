//
//  TabbyTabs.swift
//  Shadow Mountain
//
//  Created by adrian garcia on 3/18/23.
//

import SwiftUI

struct TabbyTabs: View {
    
    @State var tab: Tabs = .menu
    
    var body: some View {
        
        // GeometryReader { geo in
        
        NavigationStack {
            ///make this carusel infinite, so it loops around when it gets to the end and restarts, kavasoft tutorial
            ///SwiftUI Infinite Carousel - Infinite Page Tab View - SwiftUI Tutorials - Xcode 14
            ZStack {
                VStack(spacing: 0)  {
                    GeometryReader { geo in
                        VStack {
                            Image("shadowMountainBG2")
                                .resizable()
                                .frame(width: geo.size.width, height: geo.size.height)
                                .scaledToFill()
                        }
                    }
                    .ignoresSafeArea()
                    Rectangle()
                        .frame(height: 72)
                }
                
                //MARK: - BODY
                switch tab {
                case .menu:
                    HomeTabView()
                case .announcements:
                    Announcements()
                }
                
                //MARK: - TABBAR
                VStack {
                    
                    Spacer()
                    
                    CustomTabBar(selectedTab: $tab)
                }
            }
        }
    }
}

struct TabbyTabs_Previews: PreviewProvider {
    static var previews: some View {
        TabbyTabs()
    }
}
