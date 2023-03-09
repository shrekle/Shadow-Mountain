//
//  CategoriesView.swift
//  CoffeeShop
//
//  Created by adrian garcia on 10/26/22.
//

import SwiftUI

struct CategoriesView: View {
    
    @EnvironmentObject var model: ViewModel
    
    let columns: [GridItem] = [
        GridItem(.flexible(minimum: 90)),
        GridItem(.flexible(minimum: 90))
    ]
    
    var body: some View {
        
        LazyVGrid(columns: columns) {
            
            ForEach(model.categoriesArray) { category in
                NavigationLink {
                    ProductView(category: category)
                } label: {
                    HomeButton(category: category)
                }
                //                NavigationLink(value: category) {
                //                    HomeButton(category: category)
                //                }
            }
           
        }
//        .background(.yellow)
        //        .navigationDestination(for: CategoryModel.self) { category in
        //            ProductView(category: category)
        //                .toolbar {
        //                    ToolbarItem(placement: .navigationBarTrailing) {
        //                        Image("logoBlack")
        //                            .resizable()
        //                            .aspectRatio(contentMode: .fit)
        //                            .frame(width: 95, height: 60)
        //                            .clipShape(Circle())
        //                            .padding(.top)
        //                    }
        //                }
        //        }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
            .environmentObject(ViewModel())
    }
}
