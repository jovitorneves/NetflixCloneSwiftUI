//
//  SuggestListView.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 02/10/24.
//

import SwiftUI
internal import SDWebImageSwiftUI

struct SuggestListView: View {
    
    private enum Constants {
        static let zeroPointEightValue: CGFloat = 0.8
        static let pointZeroNineValue: CGFloat = 0.09
        static let pointOneOneValue: CGFloat = 0.11
        static let onePointZeroValue: CGFloat = 1.0
        static let oneValue: CGFloat = 1
        static let twoValue: CGFloat = 2
        static let fourValue: CGFloat = 4
        static let fiveValue: CGFloat = 5
        static let sixValue: CGFloat = 6
        static let eightValue: CGFloat = 8
        static let tenValue: CGFloat = 10
        static let twentyValue: CGFloat = 20
        static let twentyFiveValue: CGFloat = 25
        static let ninetyValue: CGFloat = 90
        static let twoHundredTwentyValue: CGFloat = 220
        static let sixHundredFiftyValue: CGFloat = 650
        static let scrollViewName: String = "SCROLLVIEW"
    }
    
    var list: MovieDetailModel
        
    var body: some View {
        GeometryReader {
            let size = $0.size
            let rect = $0.frame(in: .named(Constants.scrollViewName))
            
            HStack(spacing: -Constants.twentyFiveValue, content: {
                VStack(alignment: .center,
                       spacing: Constants.sixValue, content: {
                    Text(list.title ?? String())
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                    
                    RatingView(rating: list.voteAverage ?? 0.0)
                        .padding(.top, Constants.tenValue)
                    
                    if isIPad() {
                        Spacer(minLength: Constants.tenValue)
                        Text(list.overview ?? String())
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .multilineTextAlignment(.center)
                    }
                
                    Spacer(minLength: Constants.tenValue)
                    HStack(spacing: Constants.fourValue) {
                        Text(String(format: "%.0f",
                                    list.popularity ?? 0.0))
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundStyle(.blue)
                        Text("Views")
                            .font(.caption)
                            .foregroundStyle(.gray)
                        
                        Spacer(minLength: .zero)
                        
                        Image(systemName: "chevron.right")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                })
                .padding(Constants.twentyValue)
                .frame(width: size.width/Constants.twoValue,
                       height: size.height * Constants.zeroPointEightValue )
                .background{
                    RoundedRectangle(cornerRadius: Constants.tenValue,
                                     style: .continuous)
                        .fill(Color.black)
                        .shadow(color: .white.opacity(Constants.pointOneOneValue),
                                radius: Constants.eightValue,
                                x: Constants.fiveValue,
                                y: Constants.fiveValue)
                        .shadow(color: .white.opacity(Constants.pointOneOneValue),
                                radius: Constants.eightValue,
                                x: -Constants.fiveValue,
                                y: -Constants.fiveValue)
                }
                .zIndex(Constants.oneValue)
                
                ZStack{
                    WebImage(url: URL(string: UrlsConstants.imageURL+(list.posterPath ?? String())))
                        .resizable()
                        .placeholder(Image(LocalizableNetflixClone.placeholderImg.localized,
                                           bundle: Bundle(for: NetworkManager.self)))
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width/Constants.twoValue,
                               height: size.height)
                        .clipShape(RoundedRectangle(cornerRadius: Constants.tenValue,
                                                    style: .continuous))
                        .shadow(color: .white.opacity(Constants.pointZeroNineValue),
                                radius: Constants.eightValue,
                                x: Constants.fiveValue,
                                y: Constants.fiveValue)
                        .shadow(color: .white.opacity(Constants.pointZeroNineValue),
                                radius: Constants.eightValue,
                                x: -Constants.fiveValue,
                                y: -Constants.fiveValue)
                }
                .frame(maxWidth: .infinity,
                       maxHeight: .infinity)
                
            })
            .frame(width: size.width)
            .rotation3DEffect(.init(degrees: convertOffSetRotation(rect)),
                              axis: (x: Constants.oneValue,
                                     y: .zero,
                                     z: .zero),
                              anchor: .bottom,
                              anchorZ: Constants.oneValue,
                              perspective: Constants.zeroPointEightValue)
        }
        .frame(height: isIPad() ? Constants.sixHundredFiftyValue : Constants.twoHundredTwentyValue)
    }
    
    private func convertOffSetRotation(_ rect: CGRect) -> Double {
        let cardHeight = rect.height + Constants.twentyValue
        let minY = rect.minY - Constants.twentyValue
        let progress = minY < .zero ? (minY / cardHeight) : .zero
        let constrainedProgress = min(-progress, Constants.onePointZeroValue)
        return (constrainedProgress * Constants.ninetyValue)
    }
}

#Preview {
    SuggestListView(list: MovieDetailModel(id: 0,
                                           title: "The Godfather",
                                           originalTitle: "The Godfather",
                                           posterPath: "/3bhkrj58Vtu7enYsRolD1fZdja1.jpg",
                                           releaseDate: "1972-03-14",
                                           voteAverage: 8.69,
                                           popularity: 108.775))
}
