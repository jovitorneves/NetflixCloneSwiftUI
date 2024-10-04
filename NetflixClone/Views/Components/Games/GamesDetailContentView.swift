//
//  GamesDetailContentView.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 03/10/24.
//

import SwiftUI

struct GamesDetailContentView: View {
    
    private enum Constants {
        static let pointThreeValue: CGFloat = 0.3
        static let tenValue: CGFloat = 10
        static let fifteenValue: CGFloat = 15
        static let twentyValue: CGFloat = 20
        static let fortyValue: CGFloat = 40
        static let fourHundredValue: CGFloat = 400
    }
    
    @Environment(\.dismiss) private var dismiss
    @State private var isShow: Bool = false
    private var gameModel : GamesModel
    
    init(gameModel: GamesModel) {
        self.gameModel = gameModel
    }
    
    var body: some View {
        NavigationStack{
            ZStack(content: {
                VStack(alignment: .leading, spacing: Constants.fifteenValue, content: {
                    Image(gameModel.image,
                          bundle: Bundle(for: NetworkManager.self))
                        .resizable()
                        .frame(height: Constants.fourHundredValue)
                        .overlay(alignment: .topLeading) {
                            Button(action: {
                                dismiss()
                            }, label: {
                                HStack{
                                    Image(systemName: "arrowshape.turn.up.backward.fill")
                                        .font(.title)
                                        .foregroundStyle(.white)
                                        .padding(Constants.tenValue)
                                        .background(.white.opacity(Constants.pointThreeValue))
                                        .clipShape(RoundedRectangle(cornerRadius: Constants.tenValue))
                                }
                                .padding(.top, Constants.fortyValue)
                                .padding(.horizontal, Constants.twentyValue)
                            })
                        }
    
                    SubTitleGameView(gameModel: gameModel)
                    ScrollView {
                        NavigationGameButton(isShow: $isShow)
                        DescriptionGameView(description: gameModel.descrip)
                            .padding(.bottom, Constants.twentyValue)
                    }
                })
            })
            .fullScreenCover(isPresented: $isShow, content: {
                if let url = URL(string: gameModel.url) {
                    SafariView(url: url)
                } else {
                    EmptyView()
                }
                
            })
            .ignoresSafeArea()
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    GamesDetailContentView(gameModel:
                            GamesModel(name: "CHRISTMAS MAZE MANIA",
                                       descrip: "Begin a festive journey in our Christmas maze game! Guide Santa using your mouse, touch, or keyboard through captivating mazes to bring joy to waiting children. Find optimal paths, deliver heartwarming gifts, and immerse yourself in holiday spirit across 15 challenging levels. Spread Christmas cheer in this enchanting game!",
                                       image: "christmasMaze",
                                       url: "https://html5.gamedistribution.com/fd8440d9ed374f06b745cb299cb61819/?gd_sdk_referrer_url=https://gamedistribution.com/games/christmas-maze-mania")
    )
}
