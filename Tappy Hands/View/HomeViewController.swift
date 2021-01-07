//
//  HomeViewController.swift
//  Tappy Hands
//
//  Created by Failyn Kaye M. Sedik on 10/31/20.
//

import GoogleMobileAds
import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    private var viewModel: HomeViewModel = HomeViewModel()
    
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
        label.font = UIDevice.current.userInterfaceIdiom == .pad ?
            UIFont.systemFont(ofSize: 65, weight: .black) :
            UIFont.systemFont(ofSize: 40, weight: .black)
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
        label.font = UIDevice.current.userInterfaceIdiom == .pad ?
            UIFont.systemFont(ofSize: 90, weight: .black) :
            UIFont.systemFont(ofSize: 70, weight: .black)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let startGameButton: THButton = {
        let button: THButton = THButton(type: .custom)
        button.setup(
            withTitle: "Start Game",
            font: UIDevice.current.userInterfaceIdiom == .pad ?
                UIFont.systemFont(ofSize: 80, weight: .black) :
                UIFont.systemFont(ofSize: 40, weight: .black),
            textColor: UIColor.white
        )
        button.backgroundColor = UIColor(rgb: 0x4370CC, alpha: 0.85)
        button.clipsToBounds = true
        button.layer.cornerRadius = 4.0
        return button
    }()
    
    private lazy var adBannerView: GADBannerView = {
        let view: GADBannerView = GADBannerView(
            adSize: kGADAdSizeSmartBannerPortrait
        )
        view.backgroundColor = .white
        view.delegate = self
//        view.adUnitID = "ca-app-pub-3567467818788987/8902501347"
        // TODO: Delete since this is only a test unit ID
        view.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        view.rootViewController = self
        view.load(GADRequest())
        view.isHidden = true
        return view
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Additional View/Subviews Configuration
        view.backgroundColor = .white
        
        // MARK: Selector Setup
        startGameButton.addTarget(
            self, action: #selector(didTapStartGame),
            for: .touchUpInside
        )
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        highScoreValueLabel.text = viewModel.highScore
    }
    
}

// MARK: - Initial Setup

extension HomeViewController {
    
    private func setupUI() {
        // MARK: Subviews
        view.addSubviews(
            backgroundImageView, logoImageView,
            highScoreTitleLabel, highScoreValueLabel,
            startGameButton,
            adBannerView
        )
        
        // MARK: Constraint Setup
        NSLayoutConstraint.make([
            // Background
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // App logo
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            logoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            logoImageView.heightAnchor.constraint(equalTo: startGameButton.heightAnchor),
            
            // High Score title common constraint
            highScoreTitleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 8),
            highScoreTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            highScoreTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            // High Score value common constraint
            highScoreValueLabel.topAnchor.constraint(equalTo: highScoreTitleLabel.bottomAnchor, constant: 8),
            highScoreValueLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            highScoreValueLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            // Start Game button
            startGameButton.heightAnchor.constraint(equalTo: logoImageView.heightAnchor),
            startGameButton.topAnchor.constraint(equalTo: highScoreValueLabel.bottomAnchor, constant: 8),
            startGameButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            startGameButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            startGameButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24),
            
            // Ad Banner view
            adBannerView.heightAnchor.constraint(equalToConstant: 50),
            adBannerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            adBannerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            adBannerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            NSLayoutConstraint.make([
                // High Score title
                highScoreTitleLabel.heightAnchor.constraint(equalToConstant: 95),
                
                // High Score value
                highScoreValueLabel.heightAnchor.constraint(equalToConstant: 220)
            ])
        } else {
            NSLayoutConstraint.make([
                // High Score title
                highScoreTitleLabel.heightAnchor.constraint(equalToConstant: 75),
                
                // High Score value
                highScoreValueLabel.heightAnchor.constraint(equalToConstant: 180)
            ])
        }
    }
    
}

// MARK: - Selectors

extension HomeViewController {
    
    @objc private func didTapStartGame() {
        let gameVC = GameViewController()
        gameVC.modalPresentationStyle = .fullScreen
        gameVC.modalTransitionStyle = .crossDissolve
        present(gameVC, animated: true, completion: nil)
    }
    
}

// MARK: - GADBannerViewDelegate

extension HomeViewController: GADBannerViewDelegate {
    
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        bannerView.isHidden = false
    }
    
    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        bannerView.isHidden = true
    }
    
}
