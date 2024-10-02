//
//  SearchService.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 02/10/24.
//

import Foundation
import Combine

final class SearchService: SearchServiceDelegate {
    func apiDiscover(with url: URL) -> Future<MovieTitleResponse, Error> {
        let router = ServiceManager<MovieTitleResponse>()
        return router.handlerRequestPublisher(url: url)
    }
    
    func apiSearch(with url: URL) -> Future<MovieTitleResponse, Error> {
        let router = ServiceManager<MovieTitleResponse>()
        return router.handlerRequestPublisher(url: url)
    }
}
