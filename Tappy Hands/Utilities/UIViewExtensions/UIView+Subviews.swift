//
//  UIView+Subviews.swift
//  Tappy Hands
//
//  Created by Failyn Kaye M. Sedik on 11/1/20.
//

import UIKit

/// `UIView` extension for all computed properties and/or helper methods
/// related to a view's subviews.
extension UIView {
    
    /// Adds a single view or multiple views to the end of the receiver’s list of subviews.
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
    
}
