//
//  SpecialsView.swift
//  CoffeeShop
//
//  Created by adrian garcia on 10/25/22.
//

import SwiftUI

struct SpecialsView: View {
    
    @EnvironmentObject var model: ViewModel
    @State var tabIndex = 0
    
    var body: some View {
        
        TabView(selection: $tabIndex) {
            
            ForEach(0..<model.specials.count, id: \.self) { index in
                ZStack {
                    VStack(spacing: 5) {
                        Text(Constants.specials)
                            .foregroundColor(.black)
                            .bold()
                            .padding(.top, 2)
                        Image(model.specials[index].image)
                            .resizable()
                            .clipped()
                        
                        Text(model.specials[index].title)
                            .foregroundColor(.black)
                            .bold()
                            .padding(.bottom, 5)
                    }
                }
                .background(.gray)
                .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .tag(index)
                .padding(.bottom, 50)
                .padding(.horizontal, 10)
                .padding(.top,8)
            }
        }
        .tabViewStyle(.page)
    }
}

struct SpecialsView_Previews: PreviewProvider {
    static var previews: some View {
        SpecialsView()
            .environmentObject(ViewModel())
    }
}
