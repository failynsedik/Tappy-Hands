//
//  GameResultViewController.swift
//  Tappy Hands
//
//  Created by Failyn Kaye M. Sedik on 11/4/20.
//

import UIKit

class GameResultViewController: UIViewController {
    
    // MARK: - Properties
    
    private var viewModel: GameViewModel!
    
    // MARK: - View Properties
    
    private let backgroundImageView: UIImageView = {
        let imageView: UIImageView = UIImageView(image: #imageLiteral(resourceName: "img_background"))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
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
    
    private let shareScoreTitleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Share Score"
        label.font = UIFont.systemFont(ofSize: 30, weight: .black)
        label.textColor = UIColor(rgb: 0x3272EE)
        label.backgroundColor = .white
        label.textAlignment = .center
        label.clipsToBounds = true
        label.layer.cornerRadius = 4.0
        return label
    }()
    
    private let shareViaTwitterButton: THButton = {
        let button: THButton = THButton(type: .custom)
        button.setup(
            withTitle: "Share via Twitter",
            font: UIFont.systemFont(ofSize: 25, weight: .black),
            textColor: UIColor.white
        )
        button.backgroundColor = UIColor(rgb: 0x4370CC, alpha: 0.85)
        button.clipsToBounds = true
        button.layer.cornerRadius = 4.0
        return button
    }()
    
    private let shareViaEmailButton: THButton = {
        let button: THButton = THButton(type: .custom)
        button.setup(
            withTitle: "Share via Email",
            font: UIFont.systemFont(ofSize: 25, weight: .black),
            textColor: UIColor.white
        )
        button.backgroundColor = UIColor(rgb: 0x4370CC, alpha: 0.85)
        button.clipsToBounds = true
        button.layer.cornerRadius = 4.0
        return button
    }()
    
    private let shareViaSMSButton: THButton = {
        let button: THButton = THButton(type: .custom)
        button.setup(
            withTitle: "Share via SMS",
            font: UIFont.systemFont(ofSize: 25, weight: .black),
            textColor: UIColor.white
        )
        button.backgroundColor = UIColor(rgb: 0x4370CC, alpha: 0.85)
        button.clipsToBounds = true
        button.layer.cornerRadius = 4.0
        return button
    }()
    
    private let restartButton: THButton = {
        let button: THButton = THButton(type: .custom)
        button.setup(
            withTitle: "Restart",
            font: UIFont.systemFont(ofSize: 50, weight: .black),
            textColor: UIColor.white
        )
        button.backgroundColor = UIColor(rgb: 0x4370CC, alpha: 0.85)
        button.clipsToBounds = true
        button.layer.cornerRadius = 4.0
        return button
    }()
    
    // MARK: - Initializers
    
    init(score: String) {
        super.init(nibName: nil, bundle: nil)
        
        scoreValueLabel.text = score
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Selector Setup
        
        // MARK: Subviews
        view.addSubviews(
            backgroundImageView,
            scoreTitleLabel, scoreValueLabel,
            shareScoreTitleLabel,
            shareViaTwitterButton,
            shareViaEmailButton,
            shareViaSMSButton,
            restartButton
        )
        
        // MARK: Constraint Setup
        NSLayoutConstraint.make([
            // Background
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // Score title
            scoreTitleLabel.heightAnchor.constraint(equalToConstant: 60),
            scoreTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            scoreTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            scoreTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            // Score value
            scoreValueLabel.heightAnchor.constraint(equalToConstant: 63.5),
            scoreValueLabel.topAnchor.constraint(equalTo: scoreTitleLabel.bottomAnchor, constant: 8),
            scoreValueLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            scoreValueLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            // Share score title
            shareScoreTitleLabel.heightAnchor.constraint(equalToConstant: 60),
            shareScoreTitleLabel.topAnchor.constraint(equalTo: scoreValueLabel.bottomAnchor, constant: 8),
            shareScoreTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            shareScoreTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            // Share via Twitter button
            shareViaTwitterButton.heightAnchor.constraint(equalToConstant: 40),
            shareViaTwitterButton.topAnchor.constraint(equalTo: shareScoreTitleLabel.bottomAnchor, constant: 8),
            shareViaTwitterButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            shareViaTwitterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            // Share via Email button
            shareViaEmailButton.heightAnchor.constraint(equalToConstant: 40),
            shareViaEmailButton.topAnchor.constraint(equalTo: shareViaTwitterButton.bottomAnchor, constant: 8),
            shareViaEmailButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            shareViaEmailButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            // Share via SMS button
            shareViaSMSButton.heightAnchor.constraint(equalToConstant: 40),
            shareViaSMSButton.topAnchor.constraint(equalTo: shareViaEmailButton.bottomAnchor, constant: 8),
            shareViaSMSButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            shareViaSMSButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            // Restart button
            restartButton.topAnchor.constraint(equalTo: shareViaSMSButton.bottomAnchor, constant: 8),
            restartButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            restartButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            restartButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24)
        ])
    }
    
}