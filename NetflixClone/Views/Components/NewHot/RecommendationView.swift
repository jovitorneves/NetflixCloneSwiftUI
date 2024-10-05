//
//  RecommendationView.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 05/10/24.
//

import SwiftUI
internal import SDWebImageSwiftUI

struct RecommendationView: View {
    
    private enum Constants {
        static let tenValue: CGFloat = 10
        static let fifteenValue: CGFloat = 15
        static let twentyValue: CGFloat = 20
        static let fourHundredFiftyValue: CGFloat = 450
    }
    
    @ObservedObject var viewModel: NewHotViewModel
    var resp: MovieDetailModel
    var isLoading: Bool

    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            VStack {
                HStack(alignment: .top,
                       spacing: Constants.tenValue) {
                    DateNewHotView(viewModel: viewModel,
                                   date: resp.releaseDate ?? String())
                    Spacer()
                    WebImage(url: URL(string: UrlsConstants.imageURL + (resp.posterPath ?? String())))
                        .placeholder(Image(LocalizableNetflixClone.placeholderImg.localized,
                                           bundle: Bundle(for: NetworkManager.self)))
                        .resizable()
                        .scaledToFill()
                        .frame(height: size.height - Constants.twentyValue)
                        .clipShape(RoundedRectangle(cornerRadius: Constants.fifteenValue,
                                                    style: .continuous))
                }
            }
            .padding(.horizontal, Constants.fifteenValue)
            .padding(.vertical, Constants.twentyValue)
            .shimmering(active: isLoading)
        }
        .frame(height: Constants.fourHundredFiftyValue)
    }
}

#Preview {
    RecommendationView(viewModel: NewHotViewModel(serviceManger: HomeManager(serviceManager: HomeService())),
                       resp: MovieDetailModel(id: 2,
                                              title: "Forrest Gump",
                                              originalTitle: "Forrest Gump",
                                              posterPath: "/arw2vcBveWOVZr6pxd9XTd1TdQa.jpg",
                                              releaseDate: "1972-03-14",
                                              voteAverage: 8.69,
                                              popularity: 108.775),
                       isLoading: false)
}
