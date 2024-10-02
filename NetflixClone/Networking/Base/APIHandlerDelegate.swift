//
//  APIHandlerDelegate.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 01/10/24.
//

import Foundation

protocol APIHandlerDelegate {
    func fetchData(url: URL,
                   completion: @escaping(Result<Data, APIError>) -> Void)
}
