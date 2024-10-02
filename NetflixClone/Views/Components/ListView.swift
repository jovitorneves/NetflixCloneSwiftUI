//
//  ListView.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 01/10/24.
//

import SwiftUI

struct ListView: View {
    
    private enum Constants {
        static let twelveValue: CGFloat = 12
        static let fifteenValue: CGFloat = 15
    }
    
    @ObservedObject var viewModel: HomeViewModel
    let size: CGSize

    var body: some View {
        ForEach(viewModel.homeSection) { section in
            VStack(spacing: Constants.fifteenValue) {
                HStack {
                    Text(section.id.capitalizesFirst())
                        .foregroundStyle(Color.white)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .shimmering(active: viewModel.isloading, animation: .bouncy)
                }
                .padding(.horizontal, Constants.fifteenValue)
                ScrollView(.horizontal) {
                    HStack(spacing: Constants.twelveValue) {
                        switch section {
                        case .trendingMovies(let movies):
                            NavigateToPlayer(model: movies,
                                             size: size,
                                             isloading: viewModel.isloading)
                        case .trendingTv(let tv):
                            NavigateToPlayer(model: tv,
                                             size: size,
                                             isloading: viewModel.isloading)
                        case .popular(let popular):
                            NavigateToPlayer(model: popular,
                                             size: size,
                                             isloading: viewModel.isloading)
                        case .upComing(let upComing):
                            NavigateToPlayer(model: upComing,
                                             size: size,
                                             isloading: viewModel.isloading)
                        case .topRate(let topRated):
                            NavigateToPlayer(model: topRated,
                                             size: size,
                                             isloading: viewModel.isloading)
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
    ListView(viewModel: HomeViewModel(serviceManger: HomeManager(serviceManager: HomeService())),
             size: CGSize(width: 375,
                          height: 667))
}
