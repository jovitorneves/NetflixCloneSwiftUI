//
//  SuggestionView.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 02/10/24.
//

import SwiftUI

struct SuggestionView: View {
    
    private enum Constants {
        static let fifteenValue: CGFloat = 15
        static let twentyValue: CGFloat = 20
        static let twoHundredTwentyValue: CGFloat = 220
    }
    
    var discoverModel: [MovieDetailModel]
    var isLoading: Bool
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(spacing: Constants.fifteenValue) {
                    ForEach(discoverModel, id: \.self) { item in
                        SuggestListView(list: item)
                            .shimmering(active: isLoading, animation: .bouncy)
                    }
                }
                .padding(.horizontal, Constants.fifteenValue)
                .padding(.vertical, Constants.twentyValue)
                .padding(.bottom, bottomPadding(geometry.size))
            }
            .scrollIndicators(.never)
            .coordinateSpace(name: "SCROLLVIEW")
        }
        .padding(.top, Constants.fifteenValue)
    }
    
    private func bottomPadding(_ size: CGSize = .zero) -> CGFloat {
        let cardHeight: CGFloat = Constants.twoHundredTwentyValue
        let scrollHeight: CGFloat = size.height
        return scrollHeight - cardHeight - Constants.twentyValue
    }
}

#Preview {
    SuggestionView(discoverModel: [
        MovieDetailModel(id: 0,
                         title: "The Godfather",
                         originalTitle: "The Godfather",
                         posterPath: "/3bhkrj58Vtu7enYsRolD1fZdja1.jpg",
                         releaseDate: "1972-03-14",
                         voteAverage: 8.69,
                         popularity: 108.775),
        MovieDetailModel(id: 1,
                         title: "기생충",
                         originalTitle: "기생충",
                         posterPath: "/7IiTTgloJzvGI1TAYymCfbfl3vT.jpg",
                         releaseDate: "1972-03-14",
                         voteAverage: 8.69,
                         popularity: 10),
        MovieDetailModel(id: 2,
                         title: "Forrest Gump",
                         originalTitle: "Forrest Gump",
                         posterPath: "/arw2vcBveWOVZr6pxd9XTd1TdQa.jpg",
                         releaseDate: "1972-03-14",
                         voteAverage: 8.69,
                         popularity: 108.775)
    ],
                   isLoading: false)
}
