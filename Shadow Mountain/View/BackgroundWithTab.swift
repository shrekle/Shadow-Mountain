//
//  BackgroundWithTab.swift
//  Shadow Mountain
//
//  Created by adrian garcia on 3/18/23.
//

import SwiftUI

struct BackgroundWithTab: View {
    
    @State var tab: Tabs = .menu
    
    var body: some View {
        
        GeometryReader { geo in
            
            VStack(spacing: -50) {
                Image("shadowMountainBG2")
                    .resizable()
                    .frame(width: geo.size.width, height: geo.size.height)
                    .scaledToFill()
                    .ignoresSafeArea()
                
                CustomTabBar(selectedTab: $tab)
            }
            
            VStack(spacing: -15) {
                       
                               HeaderView()
                       SpecialsCaruselView()
//                               SpecialsCaruselView()
//                                   .aspectRatio(CGSize(width: 160, height: 145), contentMode: .fit)
//                                   .padding(.horizontal, 30)
                    
//                               ScrollView {
//                                   CategoriesView()
//                                       .padding(.horizontal)
//                                       .padding(.bottom, 40)
//                               }
//                               .padding(.bottom,1)
                           }
        }// geo
    }
}

struct BackgroundWithTab_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundWithTab()
    }
}
