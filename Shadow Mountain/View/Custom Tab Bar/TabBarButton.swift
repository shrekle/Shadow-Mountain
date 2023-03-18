//
//  TabBarButton.swift
//  chatAppCWC
//
//  Created by adrian garcia on 3/14/23.
//

import SwiftUI

struct TabBarButton: View {
    
    var buttonText: String
    var image: String
    var isActive: Bool
    
    var body: some View {
        GeometryReader { geo in
            
            if isActive {
                Rectangle()
                    .foregroundColor(.white)
                    .frame(width: geo.size.width, height: 5)
//                    .padding(.leading, geo.size.width/4)
                   
            }
            
            VStack(spacing: 4) {
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .padding(.top)
                
                Text(buttonText)
//                    .font(.tabBar)
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }// Geo    }
    }
}

struct CustomTabBarButton_Previews: PreviewProvider {
    static var previews: some View {
        TabBarButton(buttonText: "Chat", image: "bubble.left", isActive: true)
    }
}
