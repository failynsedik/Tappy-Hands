//
//  UIButton+Attribute.swift
//  Tappy Hands
//
//  Created by Failyn Kaye M. Sedik on 11/1/20.
//

import UIKit

/// `UIButton`extension for setting up an attributed button.
extension UIButton {
    
    func setup(
        withTitle title: String,
        font: UIFont, textColor: UIColor,
        backgroundColor: UIColor = .clear
    ) {
        let attributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: textColor,
            NSAttributedString.Key.backgroundColor: backgroundColor
        ]
        
        let attributedTitle: NSAttributedString = NSAttributedString(
            string: title,
            attributes: attributes
        )
        
        self.setAttributedTitle(attributedTitle, for: .normal)
    }
    
}
