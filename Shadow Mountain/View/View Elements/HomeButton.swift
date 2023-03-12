//
//  HomeButton.swift
//  CoffeeShop
//
//  Created by adrian garcia on 10/29/22.
//

import SwiftUI

struct HomeButton: View {
    
    var category: CategoryModel
    
    var body: some View {
       
        ZStack {
            
            Text(category.title)
                .font(.body)
                .foregroundColor(.black)
                .fontWeight(.light)
                .frame(width: 170, height: 50)
            
        }
        .background(.white)
        .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
//        .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke( LinearGradient(colors: [.black.opacity(1), .black.opacity(1)], startPoint: .bottom, endPoint: .top), lineWidth: 0.5))
        .shadow(radius: 5)
//        .shadow(color: .white.opacity(0.3), radius: 5)
        .padding(10)
    }
}

//struct HomeButton_Previews: PreviewProvider {
//    static var previews: some View {
//
//        let cat = CategoryModel(category: CategoryEntity())
//
//        HomeButton(category: cat)
//    }
//}
