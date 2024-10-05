//
//  MyNetflixContentView.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 02/10/24.
//

import SwiftUI

struct MyNetflixContentView: View {
    
    private enum Constants {
        static let eightValue: CGFloat = 8
        static let eightyValue: CGFloat = 80
        static let nameImage: String = "bikeStuntRacing"
        static let nameLabel: String = "NetflixClone"
    }
    
    var body: some View {
        VStack {
            ProfileContentView(image: Constants.nameImage,
                               name: Constants.nameLabel)
        }
    }
}

#Preview {
    MyNetflixContentView()
}
