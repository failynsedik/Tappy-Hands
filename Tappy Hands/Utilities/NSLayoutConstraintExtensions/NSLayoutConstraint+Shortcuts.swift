//
//  NSLayoutConstraint+Shortcuts.swift
//  Tappy Hands
//
//  Created by Failyn Kaye M. Sedik on 11/1/20.
//

import UIKit

/// `NSLayoutConstraint` extension for all constraint-related shortcut methods toi make constraint implementation simpler and lesser.
extension NSLayoutConstraint {
    
    /// Activates the constraints and also disables `translatesAutoresizingMaskIntoConstraints`.
    static func make(_ constraints: [NSLayoutConstraint]) {
        constraints.forEach({
            ($0.firstItem as? UIView)?.translatesAutoresizingMaskIntoConstraints = false
            $0.isActive = true
        })
    }
    
}
