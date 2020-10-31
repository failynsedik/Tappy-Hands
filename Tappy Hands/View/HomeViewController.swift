//
//  HomeViewController.swift
//  Tappy Hands
//
//  Created by Failyn Kaye M. Sedik on 10/31/20.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - View Properties
    
    private let backgroundImageView: UIImageView = {
        let imageView: UIImageView = UIImageView(image: #imageLiteral(resourceName: "img_background"))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let logoImageView: UIImageView = {
        let imageView: UIImageView = UIImageView(image: #imageLiteral(resourceName: "img_logo"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let highScoreTitleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "High Score"
        label.font = UIFont.systemFont(ofSize: 40, weight: .black)
        label.textColor = UIColor(rgb: 0x3272EE)
        label.backgroundColor = .white
        label.textAlignment = .center
        label.clipsToBounds = true
        label.layer.cornerRadius = 4.0
        return label
    }()
    
    private let highScoreValueLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "0"
        label.font = UIFont.systemFont(ofSize: 70, weight: .black)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let startGameButton: THButton = {
        let button: THButton = THButton(type: .custom)
        button.setup(
            withTitle: "Start Game",
            font: UIFont.systemFont(ofSize: 40, weight: .black),
            textColor: UIColor.white
        )
        button.backgroundColor = UIColor(rgb: 0x4370CC, alpha: 0.85)
        button.clipsToBounds = true
        button.layer.cornerRadius = 4.0
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Additional View/Subviews Configuration
        view.backgroundColor = .white
        
        // MARK: Subviews
        view.addSubviews(
            backgroundImageView, logoImageView,
            highScoreTitleLabel, highScoreValueLabel,
            startGameButton
        )
        
        // MARK: Constraint Setup
        NSLayoutConstraint.make([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            logoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            logoImageView.heightAnchor.constraint(equalTo: startGameButton.heightAnchor),
            highScoreTitleLabel.heightAnchor.constraint(equalToConstant: 75),
            highScoreTitleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 8),
            highScoreTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            highScoreTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            highScoreValueLabel.heightAnchor.constraint(equalToConstant: 180),
            highScoreValueLabel.topAnchor.constraint(equalTo: highScoreTitleLabel.bottomAnchor, constant: 8),
            highScoreValueLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            highScoreValueLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            startGameButton.heightAnchor.constraint(equalTo: logoImageView.heightAnchor),
            startGameButton.topAnchor.constraint(equalTo: highScoreValueLabel.bottomAnchor, constant: 8),
            startGameButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            startGameButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            startGameButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24)
        ])
    }
    
}
