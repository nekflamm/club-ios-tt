//
//  RoundedButton.swift
//  Club
//
//  Created by Adrien Carvalot on 10/01/2022.
//

import UIKit

/** Button that is always rounded. */
class RoundedButton: HapticButton {
    
    // MARK: - Overrides
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.roundCorners(radius: bounds.height * 0.5)
    }
    
}
