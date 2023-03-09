//
//  ProductView.swift
//  CoffeeShop
//
//  Created by adrian garcia on 10/29/22.
//

import SwiftUI

struct ProductView: View {
    
    @EnvironmentObject var model: ViewModel
    
    var category: CategoryModel

    init(category: CategoryModel) {
        self.category = category
    }
    
    var products: [ProductModel] {
        
        switch category.title {
        case "Breakfast Sandwiches":
            return model.breakfastSandwichesArray
        case "Cold Drinks":
            return model.coldDrinksArray
        case "Hot Drinks":
            return model.hotDrinksArray
        case "Muffin Tops":
            return model.muffinTopsArray
        case "Cookies":
            return model.cookiesArray
        default:
            return model.cookiesArray
        }
        
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 10) {
                    
                    CategoryImage(category: category)
                        .shadow(radius: 5)
                    
                    ForEach(products) { product in
                        ProductCard(product: product)
                            .padding(.horizontal)
                    }
                }
                .onAppear {
                   
                }
            }
        }
//        .background(.white)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Image("logoBlack")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 95, height: 60)
                    .clipShape(Circle())
                    .padding(.top)
            }
        }
    }
}

//struct ProductView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductView(category: Constants.teasAndLemonades)
//            .environmentObject(ViewModel())
//    }
//}
