//
//  String+Extensions.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 01/10/24.
//

import Foundation

extension String {
    func capitalizesFirst() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
