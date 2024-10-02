//
//  ResponseHandlerDelegate.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 01/10/24.
//

import Foundation

protocol ResponseHandlerDelegate {
    func fetchModel<T: Codable>(type: T.Type,
                                data: Data,
                                completion: (Result<T, APIError>) -> Void)
}
