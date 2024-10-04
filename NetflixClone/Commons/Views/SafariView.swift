//
//  SafariView.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 03/10/24.
//

import Foundation
import SwiftUI
import SafariServices

public struct SafariView: UIViewControllerRepresentable {

    let url: URL

    public func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    public func updateUIViewController(_ uiViewController: SFSafariViewController,
                                       context: UIViewControllerRepresentableContext<SafariView>) {
        // intentionally not implemented
    }
}
