//
//  HeaderView.swift
//  CoffeeShop
//
//  Created by adrian garcia on 10/25/22.
//

import SwiftUI

struct HeaderView: View {
    
    var body: some View {
        
        HStack(spacing: 0) {
            
            Image("dumpi")
                .resizable()
                .cornerRadius(10)
                .aspectRatio(contentMode: .fit)
                .frame(width: 110, height: 75)
                .clipped()
                .shadow(radius: 5)
                .padding(.trailing)
            
            Text("'No amount of money ever bought a second of time'")
                .foregroundColor(Color(UIColor.darkGray))
                .font(.body)
                .bold()
                .padding(.top)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
            .environmentObject(ViewModel())
    }
}
