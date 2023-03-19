//
//  HomeView.swift
//  CoffeeShop
//
//  Created by adrian garcia on 10/24/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ViewModel
    
    @State var tab: Tabs = .menu
    
    var body: some View {
        
        /// CUSTOM TAB BAR

        NavigationStack {
        
        GeometryReader { geo in
            
            VStack(spacing: -50) {
                Image("shadowMountainBG2")
                    .resizable()
                    .frame(width: geo.size.width, height: geo.size.height)
                    .scaledToFill()
                    .ignoresSafeArea()
                
                Rectangle()
                    .frame(height: 72)
               
            }
            
                VStack(spacing: -15) {
                    
                    HeaderView()
                    
                    SpecialsCaruselView()
                        .aspectRatio(CGSize(width: 160, height: 145), contentMode: .fit)
                        .padding(.horizontal, 30)
                    
                    ScrollView {
                        CategoriesView()
                            .padding(.horizontal)
                            .padding(.bottom, 40)
                    }
                }
            VStack {
                Spacer()
                
                CustomTabBar(selectedTab: $tab)
                    .padding(.bottom, 25)
                    
            }
            .ignoresSafeArea()
            }
        }
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ViewModel())
    }
}



//VStack(spacing: -15) {
//
//    HeaderView()
//
//    SpecialsCaruselView()
//        .aspectRatio(CGSize(width: 160, height: 145), contentMode: .fit)
//        .padding(.horizontal, 30)
//
//    ScrollView {
//        CategoriesView()
//            .padding(.horizontal)
//            .padding(.bottom, 40)
//    }
//
//}
