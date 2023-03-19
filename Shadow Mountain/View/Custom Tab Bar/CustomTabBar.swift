//
//  CustomTabBar.swift
//  chatAppCWC
//
//  Created by adrian garcia on 3/14/23.
//

import SwiftUI

enum Tabs: Int {
    case menu = 0
    case announcements = 1
}

struct CustomTabBar: View {
    
    @Binding var selectedTab: Tabs
    
    var body: some View {
        HStack {
            
            Button {
                selectedTab = .menu
            } label: {
                
                TabBarButton(buttonText: "Menu", image: "cup.and.saucer.fill", isActive: selectedTab == .menu)
                
            }// Label
            .tint(.white)
            
            Button {
                selectedTab = .announcements
            } label: {
                
                TabBarButton(buttonText: "Annoucements", image: "megaphone.fill", isActive: selectedTab == .announcements)
                
            }// Label
            .tint(.white)
            
        }// Hstack
        .background(.black)
        .frame(height: 72)
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(.announcements))
    }
}
