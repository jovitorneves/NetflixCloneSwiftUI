//
//  ProfileView.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 05/10/24.
//

import UIKit

class ProfileView: UIView {
    
    private enum Constants {
        static let eightValue: CGFloat = 8
        static let eightyValue: CGFloat = 80
        static let initView: String = "init(coder:) has not been implemented"
    }
    
    private(set) lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.layoutMargins = .init(top: .zero,
                                        left: .zero,
                                        bottom: .zero,
                                        right: .zero)
        stackView.spacing = Constants.eightValue
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private(set) lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private(set) lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = .zero
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(image: String,
         text: String) {
        super.init(frame: .zero)
        photoImageView.image = UIImage(named: image,
                                       in: Bundle(for: NetworkManager.self),
                                       compatibleWith: nil)
        nameLabel.text = text
        setupViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError(Constants.initView)
    }
    
    func updateUI(image: String,
                  text: String) {
        photoImageView.image = UIImage(named: image,
                                       in: Bundle(for: NetworkManager.self),
                                       compatibleWith: nil)
        nameLabel.text = text
    }
}

// MARK: - ViewCoded
extension ProfileView: ViewCoded {
    func addViews() {
        addSubview(stackView)
        stackView.addArrangedSubview(photoImageView)
        stackView.addArrangedSubview(nameLabel)
    }
    
    func addConstraints() {
        setupConstraintsStackView()
        setupConstraintsPhotoImageView()
    }
    
    private func setupConstraintsStackView() {
        addConstraints([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func setupConstraintsPhotoImageView() {
        addConstraints([
            photoImageView.heightAnchor.constraint(equalToConstant: Constants.eightyValue),
            photoImageView.widthAnchor.constraint(equalToConstant: Constants.eightyValue)
        ])
    }
    
    func setupViews() {
        // intentionally not implemented
    }
}
