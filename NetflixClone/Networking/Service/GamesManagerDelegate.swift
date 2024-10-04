//
//  GamesManagerDelegate.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 03/10/24.
//

import Foundation

protocol GamesManagerDelegate {
    func getWinterSelection() async throws -> [GamesModel]
    func getExclusiveGames() async throws -> [GamesModel]
    func getNonoGames() async throws -> [GamesModel]
    func getBrainTeaser() async throws -> [GamesModel]
    func getHotGames() async throws -> [GamesModel]
}
