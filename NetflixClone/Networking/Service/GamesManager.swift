//
//  GamesManager.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 03/10/24.
//

import Foundation

final class GamesManager: GamesManagerDelegate {
    
    private let typeJson: String = "json"
    private let decoder = JSONDecoder()
    
    private func getMockFile(type: GamesMockFile) -> [GamesModel] {
        if let path = Bundle(for: NetworkManager.self).path(forResource: type.rawValue,
                                                            ofType: typeJson) {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let gamesModelResponse = try decoder.decode([GamesModel].self,
                                                            from: data)
                return gamesModelResponse
            } catch {
                return []
            }
        } else {
            return []
        }
    }

    func getWinterSelection() async -> [GamesModel] {
        getMockFile(type: .winterSelectionMock)
    }
    
    func getExclusiveGames() async throws -> [GamesModel] {
        getMockFile(type: .exclusiveGamesMock)
    }
    
    func getNonoGames() async throws -> [GamesModel] {
        getMockFile(type: .nonoGamesMock)
    }
    
    func getBrainTeaser() async throws -> [GamesModel] {
        getMockFile(type: .brainTeaserMock)
    }
    
    func getHotGames() async throws -> [GamesModel] {
        getMockFile(type: .hotGamesMock)
    }
}
