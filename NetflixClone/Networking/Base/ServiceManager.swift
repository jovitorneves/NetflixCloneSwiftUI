//
//  ServiceManager.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 01/10/24.
//

import Foundation
import Combine

final class ServiceManager<T: Codable> {
    
    private let networkManager: NetworkManager = NetworkManager(apiHandler: APIHandler(),
                                                                responseHandler: ResponseHandler())
    var cancellables = Set<AnyCancellable>()
    
    func handlerRequestPublisher(url: URL) -> Future<T, Error> {
        return Future<T, Error> { promise in
            self.networkManager.fetchRequest(type: T.self,
                                             url: url) {  result in
                switch result {
                case .success(let models):
                    promise(.success(models))
                case .failure(let error):
                    promise(.failure(error))
                }
            }
        }
    }
}
