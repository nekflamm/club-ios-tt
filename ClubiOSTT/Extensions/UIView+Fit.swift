//
//  UIView+Fit.swift
//  Boilerplate
//
//  Created by Kévin Empociello on 12/10/2020.
//

import UIKit

/** Extension to manage fitting view on a parent */
extension UIView {

    /**
      Add the current view into the `container` and add layout constraints to place it
     - parameter container: The container view (will be the parent of the current view)
     */
    func fitInView(_ container: UIView, top: CGFloat = 0, bottom: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.frame = container.frame

        container.addSubview(self)

        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal,
                           toItem: container, attribute: .leading,
                           multiplier: 1.0, constant: 0).isActive = true

        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal,
                           toItem: container, attribute: .trailing,
                           multiplier: 1.0, constant: 0).isActive = true

        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal,
                           toItem: container, attribute: .top,
                           multiplier: 1.0, constant: top).isActive = true

        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal,
                           toItem: container, attribute: .bottom,
                           multiplier: 1.0, constant: bottom).isActive = true
    }
}
