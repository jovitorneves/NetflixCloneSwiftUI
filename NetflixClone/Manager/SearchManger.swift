//
//  SearchManger.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 02/10/24.
//

import Foundation
import Combine

final class SearchManger: SearchMangerDelegate  {
    
    private var serviceManager: SearchServiceDelegate
    private var cancellables = Set<AnyCancellable>()
    
    init(serviceManager: SearchServiceDelegate) {
        self.serviceManager = serviceManager
    }
    
    func getDisCover(url: URL) async throws -> [MovieDetailModel] {
        return await withCheckedContinuation { continuation in
            serviceManager.apiDiscover(with: url)
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
    
    func getSearch(url: URL) async throws -> [MovieDetailModel] {
        return await withCheckedContinuation { continuation in
            serviceManager.apiSearch(with: url)
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
