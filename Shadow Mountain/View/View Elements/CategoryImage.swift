//
//  CategoryImage.swift
//  CoffeeShop
//
//  Created by adrian garcia on 11/9/22.
//

import SwiftUI

struct CategoryImage: View {
    
    var category: CategoryModel
    
    var body: some View {
        ZStack {
            Image(uiImage: category.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipped()
            
            Text(category.title)
                .font(.system(size: 60))
                .bold()
                .foregroundColor(.white)
                .shadow(color: .black, radius: 10)
                .padding(.horizontal)
        }
        .mask {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .padding(.horizontal,20)
                .frame(height: 200)
        }
        .shadow(radius: 5)
    }
}

//struct CategoryImage_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryImage(category: "Coffees")
//    }
//}
