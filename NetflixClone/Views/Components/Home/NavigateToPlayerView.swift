//
//  NavigateToPlayerView.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 01/10/24.
//

import SwiftUI
internal import SDWebImageSwiftUI

struct NavigateToPlayerView: View {
    
    private enum Constants {
        static let twoFiftyFiveValue: CGFloat = 2.8
        static let threePointFiveValue: CGFloat = 3.5
        static let eightValue: CGFloat = 8
        static let tenValue: CGFloat = 10
    }
    
    let model: [MovieDetailModel]
    let size: CGSize
    var isloading: Bool = false
    
    var body: some View {
        ForEach(model, id: \.self) { movie in
            imageView(size: size,
                      url: movie.posterPath ?? String())
        }
    }
    
    private func imageView(size: CGSize, url: String) -> some View {
        WebImage(url: URL(string: UrlsConstants.imageURL+url))
            .placeholder(Image(LocalizableNetflixClone.placeholderImg.localized,
                               bundle: Bundle(for: NetworkManager.self)))
            .resizable()
            .scaledToFill()
            .clipShape(RoundedRectangle(cornerRadius: Constants.eightValue))
            .frame(width: size.width/Constants.twoFiftyFiveValue,
                   height: isIPad() ? size.height/Constants.twoFiftyFiveValue : size.height/Constants.threePointFiveValue)
            .background(RoundedRectangle(cornerRadius: Constants.tenValue))
            .shimmering(active: isloading,
                        animation: .bouncy)
    }
}

#Preview {
    let exampleMovies: [MovieDetailModel] = [
        MovieDetailModel(id: 0,
                         title: "The Godfather",
                         originalTitle: "The Godfather",
                         posterPath: "/3bhkrj58Vtu7enYsRolD1fZdja1.jpg",
                         releaseDate: "1972-03-14",
                         video: false,
                         voteAverage: 8.69,
                         popularity: 108.775,
                         mediaType: String())
    ]
    NavigateToPlayerView(model: exampleMovies,
                         size: CGSize(width: 375, height: 667),
                         isloading: false)
}
