//
//  TLDesignableView.swift
//  Boilerplate
//
//  Created by Adrien Carvalot on 14/10/2020.
//

import UIKit

/** Configurable TL view. */
@IBDesignable
class TLDesignableView: UIView {
    
    /** Shortcut to change `cornerRadius` directly from the view. */
    @IBInspectable var cornerRadius: CGFloat {
        get { layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
    
    /** Shortcut to change `borderWidth` directly from the view. */
    @IBInspectable var borderWidth: CGFloat {
        get { layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
    /** Shortcut to change `borderColor` directly from the view. */
    @IBInspectable var borderColor: UIColor? {
        get {
            guard let borderColor = layer.borderColor else { return nil }
            return UIColor(cgColor: borderColor)
        }
        set { layer.borderColor = newValue?.cgColor }
    }

    @IBInspectable var gradientBorder: Bool = false

    // MARK: - Overrides functions

    override func layoutSubviews() {
        super.layoutSubviews()

        if gradientBorder {
            addGradientBorderColor()
        }
    }

    // MARK: - Private functions

    /** Add the gradient border color around the estimed income */
    private func addGradientBorderColor() {

        let gradient = CAGradientLayer()
        gradient.frame =  CGRect(origin: .zero, size: frame.size)
        gradient.colors = [UIColor.custom.limeGradientStart.cgColor, UIColor.custom.limeTurquoise.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 0)
        gradient.cornerRadius = layer.cornerRadius

        let shape = CAShapeLayer()
        shape.lineWidth = 2
        shape.path = UIBezierPath(roundedRect: bounds,
                                  cornerRadius: layer.cornerRadius).cgPath
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        gradient.mask = shape

        layer.addSublayer(gradient)
    }
    
}
