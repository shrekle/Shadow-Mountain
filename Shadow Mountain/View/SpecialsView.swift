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
        
        VStack(spacing: 0) {
            
            TabView(selection: $tabIndex) {
                
                ForEach(0..<model.specialsArray.count, id: \.self) { i in
                    
                    VStack(spacing: 5) {
                        Text(Constants.specials)
                            .foregroundColor(.black)
                            .fontWeight(.light)
                            .padding(.top, 2)
                        
                        Image(uiImage: model.specialsArray[i].image ?? UIImage())
                            .resizable()
                            .clipped()
                        
                        Text(model.specialsArray[i].title)
                            .foregroundColor(.black)
                            .fontWeight(.light)
                            .padding(.bottom, 5)
                    }
                    .background(.white)
                    .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke( LinearGradient(colors: [.black.opacity(1), .black.opacity(1)], startPoint: .bottom, endPoint: .top), lineWidth: 0.5))
//                        .blendMode(.overlay)
//                    )
//                    .shadow(color: .white, radius: 10)
                    .shadow(radius: 5)
//                    .shadow(radius: 10)
                    .tag(i)
                    .padding(.bottom, 40)
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                }
            }
            .tabViewStyle(.page)
        }
    }
}

struct SpecialsView_Previews: PreviewProvider {
    static var previews: some View {
        SpecialsView()
            .environmentObject(ViewModel())
    }
}
