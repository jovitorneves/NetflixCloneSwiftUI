//
//  ProfileViewRepresentable.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 05/10/24.
//

import SwiftUI

struct ProfileViewRepresentable: UIViewRepresentable {
    
    var image: String
    var text: String
    
    func makeUIView(context: Context) -> ProfileView {
        return ProfileView(image: image,
                           text: text)
    }
    
    func updateUIView(_ uiView: ProfileView,
                      context: Context) {
        uiView.updateUI(image: image, text: text)
    }
}
