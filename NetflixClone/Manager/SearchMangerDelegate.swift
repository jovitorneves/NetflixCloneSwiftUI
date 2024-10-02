//
//  SearchMangerDelegate.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 02/10/24.
//

import Foundation

protocol SearchMangerDelegate {
    func getDisCover(url: URL) async throws -> [MovieDetailModel]
    func getSearch(url: URL) async throws -> [MovieDetailModel]
}
