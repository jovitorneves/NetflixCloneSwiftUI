//
//  HeaderView.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 01/10/24.
//

import SwiftUI
internal import SDWebImageSwiftUI

struct HeaderView: View {
    
    private enum Constants {
        static let zeroPointOneValue: CGFloat = 0.1
        static let zeroPointEightValue: CGFloat = 0.8
        static let onePointZeroValue: CGFloat = 1.0
        static let fifteenValue: CGFloat = 15
        static let twentyValue: CGFloat = 20
    }
    
    var bannerImage: URL?
    
    var body: some View {
        ZStack {
            VStack {
                WebImage(url: bannerImage)
                    .resizable()
                    .placeholder(Image(LocalizableNetflixClone.placeholderImg.localized))
                    .scaledToFill()
                    .clipShape(RoundedRectangle(cornerRadius: Constants.fifteenValue))
                    .overlay {
                        ZStack(alignment: .bottom) {
                            LinearGradient(colors: [.black.opacity(Constants.zeroPointOneValue),
                                                    .clear,
                                                    .black.opacity(Constants.zeroPointOneValue),
                                                    .black.opacity(Constants.zeroPointEightValue)],
                                           startPoint: .top,
                                           endPoint: .bottom)
                            RoundedRectangle(cornerRadius: Constants.fifteenValue)
                                .stroke(.white, lineWidth: Constants.onePointZeroValue)
                            HStack(spacing: Constants.twentyValue) {
                                TopButtonView(type: .play,
                                              image: LocalizableNetflixClone.playImg.localized,
                                              title: LocalizableNetflixClone.playName.localized) {
                                    print("Play")
                                }
                                TopButtonView(type: .add,
                                              image: LocalizableNetflixClone.plusImg.localized,
                                              title: LocalizableNetflixClone.myListName.localized) {
                                    print("My List")
                                }
                            }
                            .padding(.horizontal, Constants.twentyValue)
                            .padding(.bottom)
                        }
                    }
            }
        }
    }
}

#Preview {
    HeaderView(bannerImage: URL(string: UrlsConstants.imageURL+"/3bhkrj58Vtu7enYsRolD1fZdja1.jpg"))
}
