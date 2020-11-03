//
//  GameViewModel.swift
//  Tappy Hands
//
//  Created by Failyn Kaye M. Sedik on 11/3/20.
//

import Foundation

protocol GameDelegate: class {
    func gameViewModel(_ gameViewModel: GameViewModel, newScore score: String)
}

class GameViewModel {
    
    // MARK: - Properties
    
    weak var delegate: GameDelegate?
    
    // MARK: - Inputs
    
    private var tapCount: Int = 0 {
        didSet {
            delegate?.gameViewModel(self, newScore: String(tapCount))
        }
    }
    
    // MARK: - Initializer
    
    init(delegate: GameDelegate?) {
        self.delegate = delegate
    }
    
}

// MARK: - Internal APIs

extension GameViewModel {
    
    func didTapTapMe() {
        tapCount += 1
    }
    
}
