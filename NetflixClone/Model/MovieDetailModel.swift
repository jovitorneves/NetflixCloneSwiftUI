//
//  MovieDetailModel.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 01/10/24.
//

import Foundation

struct MovieDetailModel: Codable, Hashable {
    var id: Int?
    var overview: String?
    var title: String?
    var originalTitle: String?
    var posterPath: String?
    var releaseDate: String?
    var video: Bool?
    var voteAverage: Float?
    var popularity: Double?
    var mediaType: String?
    
    init(id: Int? = nil,
         overview: String? = nil,
         title: String? = nil,
         originalTitle: String? = nil,
         posterPath: String? = nil,
         releaseDate: String? = nil,
         video: Bool? = nil,
         voteAverage: Float? = nil,
         popularity: Double? = nil,
         mediaType: String? = nil) {
        self.id = id
        self.overview = overview
        self.title = title
        self.originalTitle = originalTitle
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.video = video
        self.voteAverage = voteAverage
        self.popularity = popularity
        self.mediaType = mediaType
    }
}
