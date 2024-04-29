//
//  TLRoundedView.swift
//  Club
//
//  Created by Florian Pygmalion on 20/04/2022.
//

import UIKit

/** Class used to get a rounded UIView */
class TLRoundedView: TLDesignableView {

    // MARK: - Overrides

    override func layoutSubviews() {
        super.layoutSubviews()

        layer.roundCorners(radius: bounds.height * 0.5)
    }

}
