//
//  ProductCard.swift
//  CoffeeShop
//
//  Created by adrian garcia on 11/7/22.
//

import SwiftUI

struct ProductCard: View {
    
    var product: Menu
    
    var body: some View {
        
            VStack(alignment: .center) {
                
                    Text(product.title)
                        .font(.title)
                        .padding(.top)
                    
                    Text(product.detail ?? "")
                        .font(.footnote)
                        .padding(.bottom, 1)
                        .padding(.top, 0)
                    
                    HStack(spacing: 30) {
                        
                        ForEach(0..<product.size.count, id: \.self) { i in
                            
                            VStack(alignment: .leading) {
                                Text(product.size[i])
                                Text("$\(String(format: "%.2f", product.price[i]))")
                            }
                        }
                }
                .padding(.bottom)
            }
            .foregroundColor(.black)
            .padding(.horizontal, 40)
            .background(.yellow)
            .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
            
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(product: ViewModel().menu[1])
    }
}
