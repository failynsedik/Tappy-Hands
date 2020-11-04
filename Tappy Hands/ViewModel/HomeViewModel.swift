//
//  HomeViewModel.swift
//  Tappy Hands
//
//  Created by Failyn Kaye M. Sedik on 11/4/20.
//

import Foundation

class HomeViewModel {
    
    // MARK: - Outputs
    
    var highScore: String {
        return (UserDefaults.standard.value(forKey: "HighScore") as? String) ?? "0"
    }
    
    // MARK: - Initializer
    
    init() { }
    
}
