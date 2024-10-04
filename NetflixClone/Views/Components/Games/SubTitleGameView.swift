//
//  SubTitleGameView.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 03/10/24.
//

import SwiftUI

struct SubTitleGameView: View {
    
    private enum Constants {
        static let tenValue: CGFloat = 10
        static let fifteenValue: CGFloat = 15
        static let fiftyValue: CGFloat = 50
    }
    
    var gameModel: GamesModel
    
    var body: some View {
        HStack(spacing: Constants.tenValue) {
            Image(gameModel.image,
                  bundle: Bundle(for: NetworkManager.self))
                .resizable()
                .frame(width: Constants.fiftyValue,
                       height: Constants.fiftyValue)
                .clipShape(RoundedRectangle(cornerRadius: Constants.tenValue))
            VStack(alignment: .leading, spacing: Constants.tenValue) {
                Text(gameModel.name)
                    .font(.headline)
                    .fontWeight(.semibold)
                Text(LocalizableNetflixClone.gamesName.localized)
                    .font(.caption2)
                    .fontWeight(.medium)
            }
        }
        .padding(.horizontal, Constants.fifteenValue)
    }
}

#Preview {
    SubTitleGameView(gameModel: GamesModel(name: "Winter",
                                           descrip: "Winter",
                                           image: "mrBeanJump",
                                           url: "Winter")
    )
}
