//
//  GamesModel.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 03/10/24.
//

import Foundation

struct GamesModel: Identifiable, Hashable, Codable {
    let id: UUID = .init()
    let name: String
    let descrip: String
    let image: String
    let url: String
    
    init(name: String = String(),
         descrip: String = String(),
         image: String = String(),
         url: String = String()) {
        self.name = name
        self.descrip = descrip
        self.image = image
        self.url = url
    }
}
