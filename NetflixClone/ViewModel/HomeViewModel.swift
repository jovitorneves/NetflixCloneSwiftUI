//
//  HomeViewModel.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 01/10/24.
//

import Foundation
import Combine

final class HomeViewModel : ObservableObject {
    
    @Published var imageAnimation: Bool = false
    @Published var homeSection: [HomeSection] = []
    @Published var activeTag: String = "trending Movies"
    @Published var isloading: Bool = false
    
    private var bannerModel: MovieDetailModel?
    private var serviceManger: HomeManagerDelegate
    
    init(serviceManger: HomeManagerDelegate) {
        self.serviceManger = serviceManger
    }
}
 
// MARK: - Funcationality and Business Logic
extension HomeViewModel {
    var bannerImage: URL? {
        return URL(string: UrlsConstants.imageURL+(bannerModel?.posterPath ?? String()))
    }
}

// MARK: - API Response Handler
extension HomeViewModel {
    
    @MainActor
    func manageHomeResponse() async throws {
        isloading = true
        homeSection.removeAll()
        let popularResult = try await fetchPopular()
        let trendingMovieResult = try await fetchTrendingMovies()
        let trendingTvResult = try await fetchTrendingTv()
        let upComingResult = try await fetchUpComing()
        let topRatedResult = try await fetchTopRated()
        guard let banner = popularResult.randomElement() else { return }
        homeSection.append(.trendingMovies(model: trendingMovieResult))
        homeSection.append(.popular(model: popularResult))
        homeSection.append(.trendingTv(model: trendingTvResult))
        homeSection.append(.upComing(model: upComingResult))
        homeSection.append(.topRate(model: topRatedResult))
        bannerModel = banner
        isloading = false
    }
    
    @MainActor
    private func fetchPopular()  async throws -> [MovieDetailModel] {
        guard let popularUrl = URL(string: UrlsConstants.discoverUrl) else { return [] }
        let popularResult = try await serviceManger.getTrendingMovies(url: popularUrl)
        return popularResult
    }
    
    @MainActor
    private func fetchTrendingMovies()  async throws -> [MovieDetailModel]{
        guard let trendingUrl = URL(string: UrlsConstants.trandingMovie) else { return [] }
        let trendingResult = try await serviceManger.getTrendingMovies(url: trendingUrl)
        return trendingResult
    }
    
    @MainActor
    private func fetchTrendingTv()  async throws -> [MovieDetailModel]{
        guard let trendingUrl = URL(string: UrlsConstants.trendingTv) else { return [] }
        let trendingResult = try await serviceManger.getTrendingMovies(url: trendingUrl)
        return trendingResult
    }
    
    @MainActor
    private func fetchUpComing()  async throws -> [MovieDetailModel]{
        guard let trendingUrl = URL(string: UrlsConstants.getUpComing) else { return [] }
        let trendingResult = try await serviceManger.getTrendingMovies(url: trendingUrl)
        return trendingResult
    }
    
    @MainActor
    private func fetchTopRated()  async throws -> [MovieDetailModel]{
        guard let trendingUrl = URL(string: UrlsConstants.getTopRated) else { return [] }
        let trendingResult = try await serviceManger.getTrendingMovies(url: trendingUrl)
        return trendingResult
    }
}
