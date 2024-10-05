//
//  NewHotViewModel.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 05/10/24.
//

import Foundation

final class NewHotViewModel: ObservableObject {
    
    @Published var imageAnimation: Bool = false
    @Published var newHotModel: [MovieDetailModel] = []
    @Published var homeSection: [HomeSection] = []
    @Published var activeTag: String = "Upcoming Movies"
    @Published var isloading: Bool = false
    
    private var serviceManger: HomeManagerDelegate
    
    init(serviceManger: HomeManagerDelegate) {
        self.serviceManger = serviceManger
        Task{
            try await manageHomeResponse()
        }
    }
}

// MARK: - Funcationality and Business Logic
extension NewHotViewModel {
}

// MARK: - API Response Handler
extension NewHotViewModel {
    
    @MainActor
    func manageHomeResponse() async throws {
        isloading = true
        let popularResult = try await fetchPopular()
        let trendingMovieResult = try await fetchTrendingMovies()
        let trendingTvResult = try await fetchTrendingTv()
        let upComingResult = try await fetchUpComing()
        let topRatedResult = try await fetchTopRated()
        homeSection.append(.upComing(model: upComingResult))
        homeSection.append(.popular(model: popularResult))
        homeSection.append(.trendingTv(model: trendingTvResult))
        homeSection.append(.topRate(model: topRatedResult))
        homeSection.append(.trendingMovies(model: trendingMovieResult))
        fetchUserRecomendation(list: homeSection[0])
        isloading = false
    }
    
    @MainActor
    func fetchPopular() async throws -> [MovieDetailModel] {
        guard let popularUrl = URL(string: UrlsConstants.discoverUrl) else { return [] }
        let popularResult = try await serviceManger.getTrendingMovies(url: popularUrl)
        return popularResult
    }
    
    @MainActor
    func fetchTrendingMovies() async throws -> [MovieDetailModel] {
        guard let trendingUrl = URL(string: UrlsConstants.trandingMovie) else { return [] }
        let trendingResult = try await serviceManger.getTrendingMovies(url: trendingUrl)
        return trendingResult
    }
    
    @MainActor
    func fetchTrendingTv() async throws -> [MovieDetailModel] {
        guard let trendingUrl = URL(string: UrlsConstants.trendingTv) else { return [] }
        let trendingResult = try await serviceManger.getTrendingMovies(url: trendingUrl)
        return trendingResult
    }
    
    @MainActor
    func fetchUpComing() async throws -> [MovieDetailModel] {
        guard let trendingUrl = URL(string: UrlsConstants.getUpComing) else { return [] }
        let trendingResult = try await serviceManger.getTrendingMovies(url: trendingUrl)
        return trendingResult
    }
    
    @MainActor
    func fetchTopRated() async throws -> [MovieDetailModel] {
        guard let trendingUrl = URL(string: UrlsConstants.getTopRated) else { return [] }
        let trendingResult = try await serviceManger.getTrendingMovies(url: trendingUrl)
        return trendingResult
    }
    
    public func fetchUserRecomendation(list: HomeSection) {
        newHotModel.removeAll()
        
        switch list {
            case .upComing(model: let model): self.newHotModel = model
            case .popular(model: let model): self.newHotModel = model
            case .trendingTv(model: let model): self.newHotModel = model
            case .topRate(model: let model): self.newHotModel = model
            case .trendingMovies(model: let model): self.newHotModel = model
        }
    }
    
    public func handlerDate(dateString: String, format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let originalDate = dateFormatter.date(from: dateString) {
            
            let desiredDateFormatter = DateFormatter()
            desiredDateFormatter.dateFormat = format
            
            let formattedDateString = desiredDateFormatter.string(from: originalDate)
            return formattedDateString
        } else {
            return String()
        }
    }
}
