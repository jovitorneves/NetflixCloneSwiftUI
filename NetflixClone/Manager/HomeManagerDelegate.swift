//
//  HomeManagerDelegate.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 01/10/24.
//

import Foundation

protocol HomeManagerDelegate {
    func getPopularMovies(url: URL) async throws -> [MovieDetailModel]
    func getTrendingMovies(url: URL) async throws -> [MovieDetailModel]
    func getTrendingTV(url: URL) async throws -> [MovieDetailModel]
    func getUpComing(url: URL) async throws -> [MovieDetailModel]
    func getTopRated(url: URL) async throws -> [MovieDetailModel]
}
