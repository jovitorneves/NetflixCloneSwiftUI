//
//  NavigateToGameView.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 03/10/24.
//

import SwiftUI

struct NavigateToGame: View {
    let model: [GamesModel]
    
    var body: some View {
        ForEach(model, id: \.self) { game in
            NavigationLink {
                GamesDetailContentView(gameModel: game)
            } label: {
                ImageGamesView(list: game)
            }
        }
    }
}

#Preview {
    NavigateToGame(model: [
        GamesModel(name: "CHRISTMAS MAZE MANIA",
                   descrip: "Begin a festive jouin this enchanting game!",
                   image: "christmasMaze",
                   url: "mania"),
        GamesModel(name: "CHRISTMAS MAZE MANIA",
                   descrip: "Begin a festive journey cheer in this enchanting game!",
                   image: "christmasMaze",
                   url: "mania")
    ])
}
