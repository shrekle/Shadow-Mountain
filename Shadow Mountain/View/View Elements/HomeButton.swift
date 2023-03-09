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
                .foregroundColor(.black)
                .bold()
                .frame(width: 170, height: 50)
            
        }
        .background(.white)
        .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .shadow(radius: 5)
    }
}
//
//struct HomeButton_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeButton()
//    }
//}
