//
//  SampleViewController.swift
//  WeatherForecast-Sample
//
//  Created by J. Vitor Neves on 19/09/24.
//

import UIKit
import NetflixClone

class SampleViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var openButton: UIButton!
    
    // MARK: - Properties
    private var netflixViewController = NetflixViewController()
    
    // MARK: - Cicly life
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        openButton?.accessibilityIdentifier = "openFrameworkButton"
    }
    
    // MARK: - Actions
    @IBAction func openButtonAction(_ sender: UIButton) {
        navigationController?.pushViewController(netflixViewController,
                                                 animated: true)
    }
}
