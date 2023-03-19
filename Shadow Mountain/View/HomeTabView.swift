//
//  HomeTabView.swift
//  Shadow Mountain
//
//  Created by adrian garcia on 3/18/23.
//

import SwiftUI

struct HomeTabView: View {
    
    @EnvironmentObject var model: ViewModel
    
    @State var tab: Tabs = .menu
    
    var body: some View {
        
            VStack(spacing: -15) {
               
                HeaderView()
                
                SpecialsCaruselView()
                    .aspectRatio(CGSize(width: 160, height: 145), contentMode: .fit)
                    .padding(.horizontal, 30)
                
                ScrollView {
                    CategoriesView()
                        .padding(.horizontal)
                        .padding(.bottom, 40)
                }
            }
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}

//Button("PRESS ME") {
//    model.getCrap()
//}
