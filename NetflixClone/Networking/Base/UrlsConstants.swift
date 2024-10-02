//
//  UrlsConstants.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 01/10/24.
//

import Foundation

struct UrlsConstants {
    static let apiKey = "a5fc4f2410d2f0d1b05961e942a0b745"
    static let baseURl = "https://api.themoviedb.org/3"
    static let imageURL = "https://image.tmdb.org/t/p/w500/"
    static let popularUrl = baseURl+"/movie/popular?api_key="+apiKey
    static let trandingMovie = baseURl+"/trending/movie/day?api_key="+apiKey
    static let trendingTv = baseURl+"/trending/tv/day?api_key="+apiKey
    static let getUpComing = baseURl+"/movie/upcoming?api_key="+apiKey
    static let getTopRated = baseURl+"/movie/top_rated?api_key="+apiKey
    static let discoverUrl = baseURl+"/discover/movie?api_key="+apiKey
    static let searchUrl = baseURl+"/search/movie?api_key="+apiKey
}
