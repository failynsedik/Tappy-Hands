//
//  THButton.swift
//  Tappy Hands
//
//  Created by Failyn Kaye M. Sedik on 11/1/20.
//

import UIKit

class THButton: UIButton {
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

// MARK: - Overriden Methods

extension THButton {
    
    override var isHighlighted: Bool {
        get {
            return super.isHighlighted
        } set {
            DispatchQueue.main.async {
                UIView.animate(withDuration: 0.2, animations: {
                    self.alpha = newValue ? 0.5 : 1.0
                })
            }
            
            super.isHighlighted = newValue
        }
    }
    
}
