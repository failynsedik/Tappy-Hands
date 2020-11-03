//
//  GameViewController.swift
//  Tappy Hands
//
//  Created by Failyn Kaye M. Sedik on 11/3/20.
//

import UIKit

class GameViewController: UIViewController {
    
    // MARK: - View Properties
    
    private let backgroundImageView: UIImageView = {
        let imageView: UIImageView = UIImageView(image: #imageLiteral(resourceName: "img_background"))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let timeTitleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Time Remaining"
        label.font = UIFont.systemFont(ofSize: 30, weight: .black)
        label.textColor = UIColor(rgb: 0x3272EE)
        label.backgroundColor = .white
        label.textAlignment = .center
        label.clipsToBounds = true
        label.layer.cornerRadius = 4.0
        return label
    }()
    
    private let timeValueLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "10"
        label.font = UIFont.systemFont(ofSize: 45, weight: .black)
        label.textColor = .white
        label.textAlignment = .center
        label.addShadow(
            x: 2, y: 2,
            blur: 0,
            color: .black,
            shadowOpacity: 0.25
        )
        return label
    }()
    
    private let scoreTitleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Score"
        label.font = UIFont.systemFont(ofSize: 30, weight: .black)
        label.textColor = UIColor(rgb: 0x3272EE)
        label.backgroundColor = .white
        label.textAlignment = .center
        label.clipsToBounds = true
        label.layer.cornerRadius = 4.0
        return label
    }()
    
    private let scoreValueLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "0"
        label.font = UIFont.systemFont(ofSize: 45, weight: .black)
        label.textColor = .white
        label.textAlignment = .center
        label.addShadow(
            x: 2, y: 2,
            blur: 0,
            color: .black,
            shadowOpacity: 0.25
        )
        return label
    }()
    
    private let tapMeButton: THButton = {
        let button: THButton = THButton(type: .custom)
        button.setup(
            withTitle: "Tap Me",
            font: UIFont.systemFont(ofSize: 50, weight: .black),
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
        
        // MARK: Subviews
        view.addSubviews(
            backgroundImageView,
            timeTitleLabel, timeValueLabel,
            scoreTitleLabel, scoreValueLabel,
            tapMeButton
        )
        
        // MARK: Constraint Setup
        NSLayoutConstraint.make([
            // Background
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // Time title
            timeTitleLabel.heightAnchor.constraint(equalToConstant: 75),
            timeTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            timeTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            timeTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            // Time value
            timeValueLabel.heightAnchor.constraint(equalToConstant: 85),
            timeValueLabel.topAnchor.constraint(equalTo: timeTitleLabel.bottomAnchor, constant: 8),
            timeValueLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            timeValueLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            // Score title
            scoreTitleLabel.heightAnchor.constraint(equalToConstant: 75),
            scoreTitleLabel.topAnchor.constraint(equalTo: timeValueLabel.bottomAnchor, constant: 8),
            scoreTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            scoreTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            // Score value
            scoreValueLabel.heightAnchor.constraint(equalToConstant: 85),
            scoreValueLabel.topAnchor.constraint(equalTo: scoreTitleLabel.bottomAnchor, constant: 8),
            scoreValueLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            scoreValueLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            // Tap Me button
            tapMeButton.topAnchor.constraint(equalTo: scoreValueLabel.bottomAnchor),
            tapMeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            tapMeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            tapMeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24)
        ])
    }
    
}
