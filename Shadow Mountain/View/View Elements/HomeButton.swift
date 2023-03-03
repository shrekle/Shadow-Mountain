//
//  HomeButton.swift
//  CoffeeShop
//
//  Created by adrian garcia on 10/29/22.
//

import SwiftUI

struct HomeButton: View {
    
    var category: String
    
    var body: some View {
       
        ZStack {
            
            Text(category)
                .foregroundColor(.black)
                .bold()
                .frame(width: 170, height: 50)
            
        }
        .background(.white)
        .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}

struct HomeButton_Previews: PreviewProvider {
    static var previews: some View {
        HomeButton(category: "GayJay")
    }
}
