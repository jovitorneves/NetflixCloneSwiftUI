//
//  HomeService.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 01/10/24.
//

import Foundation
import Combine

final class HomeService : HomeServiceDelegate {

    func apiTrendingMovie(with url: URL) -> Future<MovieTitleResponse, Error> {
        let router = ServiceManager<MovieTitleResponse>()
        return router.handlerRequestPublisher(url: url)
    }

    func apiTrendingTv(with url: URL) -> Future<MovieTitleResponse, Error> {
        let router = ServiceManager<MovieTitleResponse>()
        return router.handlerRequestPublisher(url: url)
    }
    
    func apiPopular(with url: URL) -> Future<MovieTitleResponse, Error> {
        let router = ServiceManager<MovieTitleResponse>()
        return router.handlerRequestPublisher(url: url)
    }
    
    func apiUpComing(with url: URL) -> Future<MovieTitleResponse, Error> {
        let router = ServiceManager<MovieTitleResponse>()
        return router.handlerRequestPublisher(url: url)
    }
    
    func apiTopRated(with url: URL) -> Future<MovieTitleResponse, Error> {
        let router = ServiceManager<MovieTitleResponse>()
        return router.handlerRequestPublisher(url: url)
    }
}
