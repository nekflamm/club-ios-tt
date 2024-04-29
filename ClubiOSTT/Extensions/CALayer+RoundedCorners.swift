//
//  CALayer+RoundedCorners.swift
//  Club
//
//  Created by Florian Pygmalion on 20/01/2022.
//

import UIKit

/** Extension used to rounded the corners of a `CALayer`. */
extension CALayer {

    /**
     Rounding only some given corners.
     - parameter corners: The corners to round.
     - parameter radius: The radius of the rounded.
     */
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        let roundedMask = CAShapeLayer()

        roundedMask.path = path.cgPath
        mask = roundedMask
    }

    /**
     Rounding Corners and updating the shadow if it's needed
     - parameter radius: Future radius value
     */
    func roundCorners(radius: CGFloat) {
        self.cornerRadius = radius
        if shadowOpacity != 0 {
            addShadowWithRoundedCorners()
        }
    }

}
