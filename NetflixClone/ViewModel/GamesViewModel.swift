//
//  GamesViewModel.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 03/10/24.
//

import Foundation
import Combine

final class GamesViewModel: ObservableObject {
    
    @Published var gamesSection: [GamesSectionModel] = []
    @Published var randomGame: [GamesModel] = []
    
    private var service: GamesManagerDelegate
    private let typeJson: String = "json"
    private let defaultMock: String = "defaultGamesMock"
    private let decoder = JSONDecoder()
    
    init(service: GamesManagerDelegate) {
        self.service = service
        Task(priority: .utility) {
            try await getGamesList()
        }
    }
    
    var defaulValue: GamesModel {
        if let path = Bundle(for: NetworkManager.self).path(forResource: defaultMock,
                                                            ofType: typeJson) {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let gamesModelResponse = try decoder.decode(GamesModel.self,
                                                            from: data)
                return gamesModelResponse
            } catch {
                return GamesModel()
            }
        } else {
            return GamesModel()
        }
    }
}

extension GamesViewModel {
    @MainActor
    func getGamesList() async throws {
        let winter = try await service.getWinterSelection()
        let exclusive = try await service.getExclusiveGames()
        let nano = try await service.getNonoGames()
        let brain = try await service.getBrainTeaser()
        let hotGames = try await service.getHotGames()
        let random = [winter,
                      exclusive,
                      nano,
                      brain,
                      hotGames]
        randomGame = random.randomElement() ?? []
        gamesSection.append(.Winter(model: winter))
        gamesSection.append(.exclusive(model: exclusive))
        gamesSection.append(.nano(model: nano))
        gamesSection.append(.brain(model: brain))
        gamesSection.append(.hotGames(model: hotGames))
    }
}
