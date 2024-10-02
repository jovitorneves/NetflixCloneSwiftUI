//
//  APIHandler.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 01/10/24.
//

import Foundation

final class APIHandler: APIHandlerDelegate {
    func fetchData(url: URL,
                   completion: @escaping (Result<Data, APIError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.NoData))
                return
            }
            let result = try? JSONSerialization.jsonObject(with: data,
                                                           options: .allowFragments)
            debugPrint("URL------",url)
            debugPrint(result as Any)
            completion(.success(data))
        }.resume()
    }
}
