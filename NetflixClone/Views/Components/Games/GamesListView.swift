//
//  GamesListView.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 03/10/24.
//

import SwiftUI

struct GamesListView: View {
    
    private enum Constants {
        static let twelveValue: CGFloat = 12
        static let fifteenValue: CGFloat = 15
    }
    
    @Binding var section: [GamesSectionModel]
    
    var body: some View {
        ForEach(section) { section in
            VStack(spacing: Constants.fifteenValue) {
                HStack {
                    Text(section.id.capitalizesFirst())
                        .foregroundStyle(Color.white)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal, Constants.fifteenValue)
                
                ScrollView(.horizontal) {
                    HStack(spacing: Constants.twelveValue) {
                        switch section {
                        case .Winter(let model):
                            NavigateToGame(model: model)
                        case .exclusive(let model):
                            NavigateToGame(model: model)
                        case .nano(let model):
                            NavigateToGame(model: model)
                        case .brain(let model):
                            NavigateToGame(model: model)
                        case .hotGames(let model):
                            NavigateToGame(model: model)
                        }
                    }
                    .padding(.horizontal, Constants.fifteenValue)
                }
                .scrollIndicators(.hidden)
            }
        }
    }
}

#Preview {
    let gamesSection: [GamesSectionModel] = [
        .Winter(model: [
            GamesModel(name: "Winter",
                       descrip: "Winter",
                       image: "moneyMovers",
                       url: "Winter")
        ]),
        .exclusive(model: [
            GamesModel(name: "Exclusive",
                       descrip: "Exclusive",
                       image: "wormsArenaIo",
                       url: "Exclusive")
        ]),
        .nano(model: [
            GamesModel(name: "Nano",
                       descrip: "Nano",
                       image: "sniperShooter",
                       url: "Nano")
        ]),
        .brain(model: [
            GamesModel(name: "Nano",
                       descrip: "Nano",
                       image: "hippoSupermarket",
                       url: "Nano")
        ]),
        .hotGames(model: [
            GamesModel(name: "Hot Games",
                       descrip: "Hot Games",
                       image: "mrBeanJump",
                       url: "Hot Games")
        ])
    ]
    GamesListView(section: .constant(gamesSection))
}
