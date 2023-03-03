//
//  ProductView.swift
//  CoffeeShop
//
//  Created by adrian garcia on 10/29/22.
//

import SwiftUI

struct ProductView: View {
    
    @EnvironmentObject var model: ViewModel
    
    var category: String
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 10) {
                    
                    CategoryImage(category: category)
                    
                    ForEach(model.currentCategory) { product in
                        ProductCard(product: product)
                            .padding(.horizontal)
                    }
                }
                .onAppear {
                   
                }
            }
        }
        .background(.purple)
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(category: Constants.teasAndLemonades)
            .environmentObject(ViewModel())
    }
}
