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
            
            Image("logoBlack")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 75)
                .clipShape(Circle())
                .padding(.trailing)
                .shadow(radius: 10)

                
            Text("'No amount of money ever bought a second of time'")
                .foregroundColor(.black)
//                .foregroundColor(Color(UIColor.darkGray))
                .font(.subheadline)
                .fontWeight(.regular)
                .bold()
                .padding(.top, 35)
        }
        .padding()
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
            .environmentObject(ViewModel())
    }
}
