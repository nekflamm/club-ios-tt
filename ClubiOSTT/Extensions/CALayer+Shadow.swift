//
//  CALayer+Shadow.swift
//  Boilerplate
//
//  Created by Kévin Empociello on 02/06/2021.
//

import UIKit

/**
Extension CALayer to be reuse for all UIView components
 */
extension CALayer {

    /**
     Verify the different sublayers to round all corners and insert a sublayer with a shadow
     Mainly used to add shadow on a UIView containing a UIImageView
     */
    func addShadowWithRoundedCorners() {
        if let contents = self.contents {
            masksToBounds = false
            sublayers?
                .filter { $0.frame.equalTo(self.bounds) }
                .forEach { $0.roundCorners(radius: self.cornerRadius) }
            self.contents = nil

            if let sublayer = sublayers?.first,
                sublayer.name == "Identifier" {
                sublayer.removeFromSuperlayer()
            }

            let contentLayer = CALayer()

            contentLayer.name = "Identifier"
            contentLayer.contents = contents
            contentLayer.frame = bounds
            contentLayer.cornerRadius = cornerRadius
            contentLayer.masksToBounds = true

            insertSublayer(contentLayer, at: 0)
        }
    }

    /**
     Add shadow to the layer
     - parameter offset: The shadow offset.
     - parameter opacity: The shadow opacity.
     - parameter radius: The shadow radius.
     - parameter color: The shadow color.
     */
    func addShadow(offset: CGSize, opacity: Float, radius: CGFloat, color: UIColor = .black) {
        self.shadowOffset = offset
        self.shadowOpacity = opacity
        self.shadowRadius = radius
        self.shadowColor = color.cgColor

        if cornerRadius != 0 {
            addShadowWithRoundedCorners()
        }
    }

    /** Remove shadow */
    func removeShadow() {
        self.shadowOffset = .zero
        self.shadowOpacity = 0
        self.shadowRadius = 0
        self.shadowColor = UIColor.clear.cgColor

        if let sublayer = sublayers?.first,
            sublayer.name == "Identifier" {
            sublayer.removeFromSuperlayer()
        }
    }

}
