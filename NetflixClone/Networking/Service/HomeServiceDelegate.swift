//
//  HomeServiceDelegate.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 01/10/24.
//

import Foundation
import Combine

protocol HomeServiceDelegate {
    func apiTrendingMovie(with url: URL) -> Future<MovieTitleResponse, Error>
    func apiTrendingTv(with url: URL) -> Future<MovieTitleResponse, Error>
    func apiPopular(with url: URL) -> Future<MovieTitleResponse, Error>
    func apiUpComing(with url: URL) -> Future<MovieTitleResponse, Error>
    func apiTopRated(with url: URL) -> Future<MovieTitleResponse, Error>
}
