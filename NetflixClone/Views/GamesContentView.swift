//
//  GamesContentView.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 03/10/24.
//

import SwiftUI

struct GamesContentView: View {
    
    private enum Constants {
        static let zeroPointOneValue: CGFloat = 0.1
        static let pointFiveValue: CGFloat = 0.5
        static let twoValue: CGFloat = 2
        static let tenValue: CGFloat = 10
        static let fifteenValue: CGFloat = 15
    }
    
    @StateObject private var viewModel: GamesViewModel
    
    init(viewModel: GamesViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: Constants.tenValue) {
                    let random = viewModel.randomGame.randomElement()
                    NavigationLink {
                        GamesDetailContentView(gameModel: random ?? viewModel.defaulValue)
                    } label: {
                        Image(random?.image ?? "moneyMovers",
                              bundle: Bundle(for: NetworkManager.self))
                            .resizable()
                            .scaledToFill()
                            .frame(width: rect().width,
                                   height: rect().height/Constants.twoValue)
                            .clipped()
                            .overlay {
                                ZStack{
                                    LinearGradient(colors: [.black.opacity(Constants.zeroPointOneValue),
                                                            .clear,
                                                            .black.opacity(Constants.zeroPointOneValue),
                                                            .black.opacity(Constants.pointFiveValue)],
                                                   startPoint: .top,
                                                   endPoint: .bottom)
                                }
                            }
                            .padding(.vertical, Constants.fifteenValue)
                    }
                    GamesListView(section: $viewModel.gamesSection)
                }
            }
            .scrollIndicators(.hidden)
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    HStack{
                        Button(action: {},
                               label: {
                            Text(LocalizableNetflixClone.gamesName.localized)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                        })
                        Spacer()
                    }
                }
            }
        }
    }
}

#Preview {
    GamesContentView(viewModel: GamesViewModel(service: GamesManager()))
}
