//
//  SpecialsSheetView.swift
//  Shadow Mountain
//
//  Created by adrian garcia on 3/10/23.
//

import SwiftUI

struct SpecialsSheetView: View {
    
    @EnvironmentObject var model: ViewModel
    
    var special: ProductModel
    
    /// CUSTOM TAB BAR
    
    var body: some View {
        ZStack {
            VStack {
                Spacer().padding(.top, 10)
                Image("greenSpatter")
                    .resizable()
                    .scaledToFit()
                    .ignoresSafeArea()
                    
            }
            VStack {
                ZStack {
                    Image(uiImage: special.image!)
                        .resizable()
                        .scaledToFill()
                    
                    VStack {
                        Spacer()
                        ZStack {
                            
                            //  deez two rectangles i use to darken the green color, bottom rec is set to low opacity black
                            Rectangle()
                                .frame(maxWidth: .infinity, maxHeight: 40)
                                .foregroundColor(.green)
                                .overlay {
                                    Rectangle()
                                        .frame(maxWidth: .infinity, maxHeight: 40)
                                        .foregroundColor(.black
                                            .opacity(0.35))
                                }
                                                        
                            Text(special.title)
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .shadow(radius: 5)
                        }   //  Zstack
                    }   //  Vstack
                }   //  Zstack
                .frame(height: 300)
                .ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    LazyVStack(spacing: 10) {
                        ProductCard(product: special)
                            .padding(.horizontal, 40)
                    }
                }   //  scrollView
            }   //  Vstack
           
        }
        .background(.white)
    }
}

struct SpecialsSheetView_Previews: PreviewProvider {
    static var previews: some View {
        SpecialsSheetView(special: ViewModel().specialsArray[0])
    }
}
