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
                .frame(width: 120, height: 85)
                .clipShape(Circle())
                
            Text("'No amount of money ever bought a second of time'")
                .foregroundColor(Color(UIColor.darkGray))
                .font(.body)
                .bold()
                .padding(.top,40)
                
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
