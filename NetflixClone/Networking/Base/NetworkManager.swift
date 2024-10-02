//
//  NetworkManager.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 01/10/24.
//

import Foundation

final class NetworkManager {
    let apiHandler: APIHandlerDelegate
    let responseHandler: ResponseHandlerDelegate
    
    init(apiHandler: APIHandlerDelegate,
         responseHandler: ResponseHandlerDelegate) {
        self.apiHandler = apiHandler
        self.responseHandler = responseHandler
    }
    
    func fetchRequest<T:Codable>(type: T.Type,
                                 url: URL,
                                 completion: @escaping(Result<T, APIError>) -> Void) {
        apiHandler.fetchData(url: url) { result in
            switch result {
            case .success(let data):
                self.responseHandler.fetchModel(type: type,
                                                data: data) { response in
                    switch response {
                    case .success(let model):
                        completion(.success(model))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
