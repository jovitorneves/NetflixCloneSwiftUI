//
//  HomeManager.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 01/10/24.
//

import Foundation
import Combine

final class HomeManager : HomeManagerDelegate {
    private var serviceManager: HomeServiceDelegate
    private var cancellables = Set<AnyCancellable>()
    
    init(serviceManager: HomeServiceDelegate) {
        self.serviceManager = serviceManager
    }
}

extension HomeManager {
    func getPopularMovies(url: URL) async throws -> [MovieDetailModel] {
        return await withCheckedContinuation { continuation in
            serviceManager.apiPopular(with: url)
                .receive(on: DispatchQueue.main)
                .sink { result in
                    switch result{
                    case .finished:
                        break
                    case .failure(let error):
                        print(error.localizedDescription)
                        continuation.resume(returning: [])
                    }
                } receiveValue: { resp in
                    continuation.resume(returning: resp.results)
                }.store(in: &cancellables)
        }
    }
    
    func getTrendingMovies(url: URL) async throws -> [MovieDetailModel] {
        return await withCheckedContinuation { continuation in
            serviceManager.apiTrendingMovie(with: url)
                .receive(on: DispatchQueue.main)
                .sink { result in
                    switch result{
                    case .finished:
                        break
                    case .failure(let error):
                        print(error.localizedDescription)
                        continuation.resume(returning: [])
                    }
                } receiveValue: { resp in
                    continuation.resume(returning: resp.results)
                }.store(in: &cancellables)
        }
    }
    
    func getTrendingTV(url: URL) async throws -> [MovieDetailModel] {
        return await withCheckedContinuation { continuation in
            serviceManager.apiTrendingMovie(with: url)
                .receive(on: DispatchQueue.main)
                .sink { result in
                    switch result{
                    case .finished:
                        break
                    case .failure(let error):
                        print(error.localizedDescription)
                        continuation.resume(returning: [])
                    }
                } receiveValue: { resp in
                    continuation.resume(returning: resp.results)
                }.store(in: &cancellables)
        }
    }
    
    func getUpComing(url: URL) async throws -> [MovieDetailModel] {
        return await withCheckedContinuation { continuation in
            serviceManager.apiTrendingMovie(with: url)
                .receive(on: DispatchQueue.main)
                .sink { result in
                    switch result{
                    case .finished:
                        break
                    case .failure(let error):
                        print(error.localizedDescription)
                        continuation.resume(returning: [])
                    }
                } receiveValue: { resp in
                    continuation.resume(returning: resp.results)
                }.store(in: &cancellables)
        }
    }
    
    func getTopRated(url: URL) async throws -> [MovieDetailModel] {
        return await withCheckedContinuation { continuation in
            serviceManager.apiTrendingMovie(with: url)
                .receive(on: DispatchQueue.main)
                .sink { result in
                    switch result{
                    case .finished:
                        break
                    case .failure(let error):
                        print(error.localizedDescription)
                        continuation.resume(returning: [])
                    }
                } receiveValue: { resp in
                    continuation.resume(returning: resp.results)
                }.store(in: &cancellables)
        }
    }
}
