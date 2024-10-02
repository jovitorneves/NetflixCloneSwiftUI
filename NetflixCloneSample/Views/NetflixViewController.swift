//
//  NetflixViewController.swift
//  NetflixCloneSample
//
//  Created by J. Vitor Neves on 01/10/24.
//

import UIKit
import SwiftUI
import NetflixClone

class NetflixViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let tabBarUIView = TabBar()
        let hostingController = UIHostingController(rootView: tabBarUIView)

        navigationController?.isNavigationBarHidden = true
        addChild(hostingController)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(hostingController.view)

        NSLayoutConstraint.activate([
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        hostingController.didMove(toParent: self)
    }

    @objc
    func presentTabBarUIView() {
        let tabBarUIView = TabBar()
        let hostingController = UIHostingController(rootView: tabBarUIView)

        navigationController?.pushViewController(hostingController,
                                                 animated: true)
    }
}
