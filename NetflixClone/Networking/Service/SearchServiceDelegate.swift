//
//  SearchServiceDelegate.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 02/10/24.
//

import Foundation
import Combine

protocol SearchServiceDelegate {
    func apiDiscover(with url: URL) -> Future<MovieTitleResponse, Error>
    func apiSearch(with url: URL) -> Future<MovieTitleResponse, Error>
}
