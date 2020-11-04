//
//  GameViewModel.swift
//  Tappy Hands
//
//  Created by Failyn Kaye M. Sedik on 11/3/20.
//

import Foundation

protocol GameDelegate: class {
    func gameViewModel(
        _ gameViewModel: GameViewModel,
        tapMeButtonTitle title: String,
        shouldEnableTapMeButton shouldEnable: Bool
    )
    func gameViewModel(
        _ gameViewModel: GameViewModel,
        gameTime time: String,
        shouldEnableTapMeButton shouldEnable: Bool
    )
    func gameViewModel(_ gameViewModel: GameViewModel, newScore score: String)
    func gameViewModel(_ gameViewModel: GameViewModel, showEndGameWithScore score: String)
}

class GameViewModel {
    
    // MARK: - Delegate
    
    weak var delegate: GameDelegate?
    
    // MARK: - Properties
    
    private var countdownTimer: Timer = Timer()
    private var gameTimer: Timer = Timer()
    
    // MARK: - Property Observers
    
    private var tapCount: Int = 0 {
        didSet {
            delegate?.gameViewModel(self, newScore: score)
        }
    }
    
    private var countdownTime: Int = 3 {
        didSet {
            delegate?.gameViewModel(
                self,
                tapMeButtonTitle: tapMeButtonTitle,
                shouldEnableTapMeButton: shouldEnableTapMeButton
            )
        }
    }
    
    private var gameTime: Int = 10 {
        didSet {
            delegate?.gameViewModel(
                self, gameTime: String(gameTime),
                shouldEnableTapMeButton: shouldEnableTapMeButton
            )
        }
    }
    
    // MARK: - Outputs
    
    /// User's current score.
    private var score: String {
        return String(tapCount)
    }
    
    private var tapMeButtonTitle: String {
        return countdownTime == 0 ? "Tap Me" : String(countdownTime)
    }
    
    private var shouldEnableTapMeButton: Bool {
        return countdownTime == 0 && gameTime > 0
    }
    
    // MARK: - Initializer
    
    init(delegate: GameDelegate?) {
        self.delegate = delegate
    }
    
}

// MARK: - Internal APIs

extension GameViewModel {
    
    /// Set initial values for `tapCount`, `countdownTime` and `gameTime`.
    func setInitialValues() {
        tapCount = 0
        countdownTime = 3
        gameTime = 10
    }
    
    /// Starts the countdown for starting the game.
    func startCountdownTimer() {
        countdownTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak self] (timer) in
            guard let strongSelf = self else { return }
            
            strongSelf.countdownTime -= 1
            
            if strongSelf.countdownTime == 0 {
                strongSelf.countdownTimer.invalidate()
                strongSelf.startGameTimer()
            }
        })
    }
    
    /// Starts the timer for the actual game.
    func startGameTimer() {
        gameTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak self] (timer) in
            guard let strongSelf = self else { return }
            
            strongSelf.gameTime -= 1
            
            if strongSelf.gameTime == 0 {
                strongSelf.gameTimer.invalidate()
                strongSelf.saveHighScore()
                strongSelf.showEndGame(afterDelay: 2.0)
            }
        })
    }
    
    /// Saves the user's current score as the new high score ONLY IF either it's greater
    /// than the current high score or there's no existing high score yet.
    func saveHighScore() {
        let highScore: String? = UserDefaults.standard.value(forKey: "HighScore") as? String
        
        if highScore == nil || (Int(score) ?? 0) > (Int(highScore ?? "0") ?? 0) {
            UserDefaults.standard.setValue(score, forKey: "HighScore")
        }
    }
    
    /// Show the end game screen after the given delay.
    func showEndGame(afterDelay delayTime: TimeInterval) {
        Timer.scheduledTimer(withTimeInterval: delayTime, repeats: false, block: { [weak self] (timer) in
            guard let strongSelf = self else { return }
            strongSelf.delegate?.gameViewModel(strongSelf, showEndGameWithScore: String(strongSelf.tapCount))
        })
    }
    
    func didTapTapMe() {
        tapCount += 1
    }
    
}
