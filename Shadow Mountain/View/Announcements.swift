//
//  Announcements.swift
//  Shadow Mountain
//
//  Created by adrian garcia on 3/18/23.
//

import SwiftUI

struct Announcements: View {
    var body: some View {
        Spacer()
        
        Image("announcement")
            .resizable()
            .scaledToFit()
            .cornerRadius(10)
            .shadow(radius: 5)
            .padding()
        
        Spacer()
    }
}

struct Announcements_Previews: PreviewProvider {
    static var previews: some View {
        Announcements()
    }
}
