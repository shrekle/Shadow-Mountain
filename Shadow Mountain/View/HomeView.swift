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
        
        NavigationStack {
            
            VStack(spacing: 0) {
                
                Button("PRESS ME") {
                    model.getCrap()
                }
   
                HeaderView()

                SpecialsView()
                    .aspectRatio(CGSize(width: 160, height: 145), contentMode: .fit)
                    .padding(.horizontal, 20)

                ScrollView {
                    CategoriesView()
                        .padding(.horizontal)
                        .padding(.bottom, 40)
                        .padding(.top, 10)
                }
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
