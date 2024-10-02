//
//  MovieTitleResponse.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 01/10/24.
//

import Foundation

struct MovieTitleResponse: Codable, Hashable {
    var results: [MovieDetailModel]
}
