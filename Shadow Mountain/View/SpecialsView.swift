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
        ZStack {
            TabView(selection: $tabIndex) {
                
                ForEach(0..<model.specialsArray.count, id: \.self) { i in
                    ZStack {
                    VStack(spacing: 5) {
                        Text(Constants.specials)
                            .foregroundColor(.black)
                            .fontWeight(.light)
                            .padding(.top, 2)
                        
                        Image(uiImage: model.specialsArray[i].image ?? UIImage())
                            .resizable()
                        //                            .clipped()
                        
                        Text(model.specialsArray[i].title)
                            .foregroundColor(.black)
                            .fontWeight(.light)
                            .padding(.bottom, 5)
                    }
                    .background(.white.opacity(0.9))
                    .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke( LinearGradient(colors: [.black.opacity(1), .black.opacity(1)], startPoint: .bottom, endPoint: .top), lineWidth: 0.5))
                    
                    .shadow(color: .white.opacity(0.3), radius: 5)
                    .tag(i)
                    .padding(.bottom, 40)
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    
                                    Image("cupSquare")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 70)
                                        .offset(x: 120, y: -100)
                        
                }
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
