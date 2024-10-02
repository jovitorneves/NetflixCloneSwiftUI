//
//  APIError.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 01/10/24.
//

import Foundation

enum APIError: Error {
    case BadUrl
    case NoData
    case DecodingError
}
