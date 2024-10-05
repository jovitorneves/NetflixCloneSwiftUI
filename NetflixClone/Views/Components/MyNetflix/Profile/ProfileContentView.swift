//
//  ProfileContentView.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 05/10/24.
//

import SwiftUI

struct ProfileContentView: View {
    
    private enum Constants {
        static let eightValue: CGFloat = 8
        static let eightyValue: CGFloat = 80
        static let twoHundredFiftyValue: CGFloat = 250
        static let threeHundredValue: CGFloat = 300
    }
    
    var image: String
    var name: String
    
    var body: some View {
        VStack {
            ProfileViewRepresentable(image: image,
                                     text: name)
            .frame(width: Constants.threeHundredValue,
                       height: Constants.twoHundredFiftyValue)
                .padding()
        }
    }
}

#Preview {
    ProfileContentView(image: "bikeStuntRacing",
                       name: "NetflixClone")
}
