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
        GeometryReader { geo in
                VStack {
                    ZStack {
                        
                        Image(uiImage: category.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: geo.size.width)
                            .clipped()
                            
                            .ignoresSafeArea()
                        
                        VStack {
                            
                            Spacer()
                            
                            ZStack {
                                
                                Rectangle()
                                    .frame(maxWidth: .infinity, maxHeight: 40)
                                    .foregroundColor(.black)
                                
                                Text(category.title)
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .frame(height: 300)
                    
                    ScrollView(showsIndicators: false) {
                        LazyVStack(spacing: 10) {
                            
                            ForEach(products) { product in
                                ProductCard(product: product)
                                    .padding(.horizontal)
                            }
                        }
                    }
                }
                .background(
                    Image("shadowMountainBG2")
                        .resizable()
                        .frame(width: geo.size.width, height: geo.size.height)
                        .scaledToFill()
                )
        }
        .ignoresSafeArea()
    }
}
//struct ProductView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductView(category: Constants.teasAndLemonades)
//            .environmentObject(ViewModel())
//    }
//}


//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Image("logoBlack")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 95, height: 60)
//                        .clipShape(Circle())
//                        .padding(.top)
//                }
//            }
//}
