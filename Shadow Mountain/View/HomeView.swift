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
        TabView {
            NavigationStack {
                
                VStack(spacing: 0) {
                    
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
                .background(.purple)
            }
            .tabItem({
                Image(systemName: "cup.and.saucer")
                Text("Drinks")
            })
            .tint(.black)
            
            AnnouncementsView()
                .tabItem {
                    Image(systemName: "megaphone")
                    Text("Announcemetns")
                }
        }
        .tint(.black.opacity(0.7))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ViewModel())
    }
}
