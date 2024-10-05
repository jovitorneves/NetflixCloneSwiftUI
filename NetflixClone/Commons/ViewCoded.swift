//
//  ViewCoded.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 05/10/24.
//

import Foundation

protocol ViewCoded {
    func addViews()
    func addConstraints()
    func setupViews()
    func setupViewCode()
}

extension ViewCoded {
    func setupViewCode() {
        addViews()
        addConstraints()
        setupViews()
    }
}
