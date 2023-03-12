//
//  SpecialsView.swift
//  CoffeeShop
//
//  Created by adrian garcia on 10/25/22.
//

import SwiftUI

struct SpecialsCaruselView: View {
    
    @EnvironmentObject var model: ViewModel
    @State var tabIndex = 0
    @State var crap = 0
    @State var isPresented = false
    
    @State var special: ProductModel? = nil
    
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
                            .background()
                            .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
//                            .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke( LinearGradient(colors: [.black.opacity(1), .black.opacity(1)], startPoint: .bottom, endPoint: .top), lineWidth: 0.5))
                            .padding(.bottom, 40)
                            .padding(.horizontal, 20)
                            .padding(.top, 20)
                            .shadow(radius: 5)
                            //                            .shadow(color: .white.opacity(0.3), radius: 5)
                            .tag(i)
                            
                            Image("cupSquare")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 60)
                                .offset(x: 130, y: -110) // work with 40 padding perfect
                            
                        }
                        .onTapGesture {
                            
                            special = model.specialsArray[i]
                            
//                            model.printArrays(int: i)
//                            isPresented = true
//                            print("crap \(crap)")
                        }
                        .sheet(item: $special, content: { product in
                            SpecialsSheetView(special: product)
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.fraction(0.6)])
                        })
                        
//                        .sheet(isPresented: $isPresented) {
//
//                            ///Swiftful †hinking...#7 multiple sheets video, use binding
//                            ///use the $item on the sheet, seems like that one will work
//                            SpecialsSheetView(special: model.specialsArray[tabIndex]) //    why does this not work wehn i use the index with the specials array
//                                .presentationDetents([.fraction(0.6)])
//                                .presentationDragIndicator(.visible)
//                        }
                    }
//                .onTapGesture {
//                    isPresented = true
//                    print("crap \(crap)")
//                }
                }
                .tabViewStyle(.page)
            }
            
        }
    }
    
    struct SpecialsView_Previews: PreviewProvider {
        static var previews: some View {
            SpecialsCaruselView()
                .environmentObject(ViewModel())
        }
    }
