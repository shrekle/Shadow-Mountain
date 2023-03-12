//
//  HomeView.swift
//  CoffeeShop
//
//  Created by adrian garcia on 10/24/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ViewModel
    
    var body: some View {
        
        /// CUSTOM TAB BAR
        
        NavigationStack {
            
            VStack {
                
                VStack(spacing: -15) {
                    
                    Button("PRESS ME") {
                        model.getCrap()
                    }
                    
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
                .background(
                    Image("shadowMountainBG2")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                )
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
