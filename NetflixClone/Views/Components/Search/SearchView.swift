//
//  SearchView.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 02/10/24.
//

import SwiftUI
internal import SDWebImageSwiftUI

struct SearchView: View {
    
    private enum Constants {
        static let tenValue: CGFloat = 10
        static let fifteenValue: CGFloat = 15
        static let oneHundredFiftyValue: CGFloat = 150
        static let twoHundredValue: CGFloat = 200
    }
    
    var gridItemLayout = [
        GridItem(.adaptive(minimum: Constants.oneHundredFiftyValue,
                           maximum: Constants.oneHundredFiftyValue)),
        GridItem(.adaptive(minimum: Constants.oneHundredFiftyValue,
                           maximum: Constants.oneHundredFiftyValue)),
        GridItem(.adaptive(minimum: Constants.oneHundredFiftyValue,
                           maximum: Constants.oneHundredFiftyValue))
    ]
    
    @Binding var searchModel: [MovieDetailModel]
    @Binding var isLoading: Bool
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItemLayout,
                      spacing: Constants.fifteenValue,
                      content: {
                ForEach(searchModel, id: \.self) { model in
                    WebImage(url: URL(string: UrlsConstants.imageURL+(model.posterPath ?? String())))
                        .resizable()
                        .placeholder(Image(LocalizableNetflixClone.placeholderImg.localized,
                                           bundle: Bundle(for: NetworkManager.self)))
                        .frame(height: Constants.twoHundredValue)
                        .shimmering(active: isLoading,
                                    animation: .bouncy)
                }
            })
            .padding(.horizontal, Constants.tenValue)
        }
    }
}

#Preview {
    SearchView(searchModel: .constant([
        MovieDetailModel(id: 0,
                        posterPath: "/3bhkrj58Vtu7enYsRolD1fZdja1.jpg"),
        MovieDetailModel(id: 1,
                        posterPath: "/7IiTTgloJzvGI1TAYymCfbfl3vT.jpg"),
        MovieDetailModel(id: 2,
                        posterPath: "/hek3koDUyRQk7FIhPXsa6mT2Zc3.jpg"),
        MovieDetailModel(id: 3,
                        posterPath: "/ow3wq89wM8qd5X7hWKxiRfsFf9C.jpg"),
        MovieDetailModel(id: 4,
                        posterPath: "/39wmItIWsg5sZMyRUHLkWBcuVCM.jpg")
    ]),
               isLoading: .constant(false))
}
