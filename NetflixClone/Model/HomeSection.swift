//
//  HomeSection.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 01/10/24.
//

import Foundation

enum HomeSection: Identifiable {
    case trendingMovies(model: [MovieDetailModel])
    case trendingTv(model: [MovieDetailModel])
    case popular(model: [MovieDetailModel])
    case upComing(model: [MovieDetailModel])
    case topRate(model: [MovieDetailModel])

    var id: String {
        switch self {
        case .trendingMovies:
            return "trending Movies"
        case .trendingTv:
            return "trending Tv"
        case .popular:
            return "popular"
        case .upComing:
            return "Upcoming Movies"
        case .topRate:
            return "Top rated"
        }
    }
}

extension HomeSection: Hashable {
    static func == (lhs: HomeSection,
                    rhs: HomeSection) -> Bool {
        switch (lhs, rhs) {
        case (.trendingMovies, .trendingMovies),
             (.trendingTv, .trendingTv),
             (.popular, .popular),
             (.upComing, .upComing),
             (.topRate, .topRate):
            return true
        default:
            return false
        }
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
