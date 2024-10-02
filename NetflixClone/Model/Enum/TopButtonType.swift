//
//  TopButtonType.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 01/10/24.
//

import Foundation

enum TopButtonType: Hashable, Identifiable {
    case play, add
    var id: TopButtonType { self }
}
