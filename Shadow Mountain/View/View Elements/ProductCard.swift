//
//  ProductCard.swift
//  CoffeeShop
//
//  Created by adrian garcia on 11/7/22.
//

import SwiftUI

struct ProductCard: View {
    
    var product: ProductModel
    
    var body: some View {
        
            VStack(alignment: .center) {
                
                if let product = product {
                    Text(product.title)
                        .font(.title)
                        .padding(.top)
                    
                    Text(product.detail ?? "🥵 no detail")
                        .font(.footnote)
                        .padding(.bottom, 1)
                        .padding(.top, 0)
                    
                    HStack(spacing: 30) {
                        
                        ForEach(0..<(product.price).count, id: \.self) { i in
                            
                            VStack(alignment: .leading) {
                                if product.size != nil {
                                    Text(product.size![i])
                                }
                                Text("$\( product.price[i])")
                            }
                        }
                }
                .padding(.bottom)
                }
            }
            .foregroundColor(.black)
            .padding(.horizontal, 40)
            .background(.yellow)
            .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}

//struct ProductCard_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductCard(product: ViewModel().productsArray[0])
//    }
//}
