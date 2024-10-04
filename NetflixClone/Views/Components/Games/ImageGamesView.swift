//
//  ImageGamesView.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 03/10/24.
//

import SwiftUI

struct ImageGamesView: View {
    
    private enum Constants {
        static let pointTwoFiveValue: CGFloat = 2.5
        static let eightValue: CGFloat = 8
        static let twentyValue: CGFloat = 20
    }
    
    let list: GamesModel
    
    var body: some View {
        VStack(spacing: Constants.eightValue) {
            Image(list.image,
                  bundle: Bundle(for: NetworkManager.self))
                .resizable()
                .scaledToFill()
                .frame(width: rect().width / Constants.pointTwoFiveValue,
                       height: rect().width / Constants.pointTwoFiveValue)
                .clipShape(RoundedRectangle(cornerRadius: Constants.twentyValue))
        }
    }
}

#Preview {
    ZStack {
        Color.white
            .opacity(0.5)
            .edgesIgnoringSafeArea(.all)
        ImageGamesView(list: GamesModel(name: "Winter",
                                        descrip: "Winter",
                                        image: "christmasMaze",
                                        url: "Winter"))
    }
}
