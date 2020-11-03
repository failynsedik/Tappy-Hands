//
//  UIView+Shadow.swift
//  Tappy Hands
//
//  Created by Failyn Kaye M. Sedik on 11/3/20.
//

import UIKit

extension UIView {
    
    /// Adds a shadow to a `UIView`.
    /// - Parameters:
    ///   - x: Shadow offset's `width`
    ///   - y: Shadow offset's `height`
    ///   - blur: Shadow radius
    ///   - color: Shadow's color
    ///   - shadowOpacity: Shadow's opacity
    func addShadow(
        x: CGFloat,
        y: CGFloat,
        blur: CGFloat,
        color: UIColor,
        shadowOpacity: Float
    ) {
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize(width: x, height: y)
        self.layer.shadowRadius = blur
        
        // Render and cache the layer
        self.layer.shouldRasterize = true
        // Make sure the cache is retina (the default is 1.0)
        self.layer.rasterizationScale = UIScreen.main.scale
    }
    
}
