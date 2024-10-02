//
//  ResponseHandler.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 01/10/24.
//

import Foundation

final class ResponseHandler: ResponseHandlerDelegate {
    private let decoder = JSONDecoder()
    
    func fetchModel<T>(type: T.Type,
                       data: Data,
                       completion: (Result<T, APIError>) -> Void) where T : Decodable, T : Encodable {
        self.decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try? decoder.decode(type.self,
                                           from: data)
        if let responses = response {
            return completion(.success(responses))
        } else {
            return completion(.failure(.DecodingError))
        }
    }
}
