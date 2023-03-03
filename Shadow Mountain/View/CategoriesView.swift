//
//  CategoriesView.swift
//  CoffeeShop
//
//  Created by adrian garcia on 10/26/22.
//

import SwiftUI

struct CategoriesView: View {
    
    @EnvironmentObject var model: ViewModel
    
    let columns: [GridItem] = [
        GridItem(.flexible(minimum: 90)),
        GridItem(.flexible(minimum: 90))
    ]
    
    var body: some View {
        
        LazyVGrid(columns: columns, spacing: 15) {
            
            ForEach(Array(model.categories), id:  \.self) { category in
                
                NavigationLink(value: category) {
                    HomeButton(category: category)
                }
            }
        }
        .navigationDestination(for: String.self) { category in
            ProductView(category: category)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Image("logo")
                            .resizable()
                            .cornerRadius(10)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 85, height: 50)
                            .padding(.trailing)
                    }
                }
        }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
            .environmentObject(ViewModel())
    }
}