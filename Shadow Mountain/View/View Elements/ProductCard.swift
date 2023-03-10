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
                    
                    if let detail = product.detail {
                        Text(detail)
                            .font(.footnote)
                            .padding(.bottom, 1)
                            .padding(.top, 0)
                    }
                    
                    HStack(spacing: 30) {
                        
                        ForEach(0..<(product.price).count, id: \.self) { i in
                            
                            VStack(alignment: .leading) {
                                if product.size != nil {
                                    Text("\(product.size![i]) oz")
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
            .background(.white.opacity(0.9)) // needs to have this background wrapper for the shadow to work, unles i wasnt to put a frame or rectangle behind it or on it
            .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke( LinearGradient(colors: [.black.opacity(1), .black.opacity(1)], startPoint: .bottom, endPoint: .top), lineWidth: 0.5))
            .shadow(color: .white.opacity(0.3), radius: 5)
            .padding(.top)
    }
}

//struct ProductCard_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductCard(product: ViewModel().productsArray[0])
//    }
//}
