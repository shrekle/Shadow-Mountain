//
//  BlankView.swift
//  Shadow Mountain
//
//  Created by adrian garcia on 3/9/23.
//

import SwiftUI

struct BlankView: View {
    var body: some View {
        VStack {
            Rectangle()
                .fill((LinearGradient(gradient: .init(colors: [.black, .white]), startPoint: .bottom, endPoint: .top)))
                .ignoresSafeArea()
                
        }
//        .background(LinearGradient(gradient: .init(colors: [.black, .white]), startPoint: .bottom, endPoint: .top))
    }
}

struct BlankView_Previews: PreviewProvider {
    static var previews: some View {
        BlankView()
    }
}
