//
//  TLBorderedView.swift
//  Club
//
//  Created by Kévin Empociello on 04/10/2023.
//

import Foundation
import UIKit

/** Custom UIView giving you a bordered rounded view */
class TLDashBorderedView: UIView {

    // MARK: - IBInspectable
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    @IBInspectable var dashWidth: CGFloat = 0
    @IBInspectable var dashColor: UIColor = .clear
    @IBInspectable var dashLength: CGFloat = 0
    @IBInspectable var betweenDashesSpace: CGFloat = 0

    // MARK: - Properties
    
    var dashBorder: CAShapeLayer?

    // MARK: - View lifecycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        dashBorder?.removeFromSuperlayer()
        
        let dashBorder = CAShapeLayer()
        dashBorder.lineWidth = dashWidth
        dashBorder.strokeColor = dashColor.cgColor
        dashBorder.lineDashPattern = [dashLength, betweenDashesSpace] as [NSNumber]
        dashBorder.frame = bounds
        dashBorder.fillColor = nil
        
        if cornerRadius > 0 {
            dashBorder.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        } else {
            dashBorder.path = UIBezierPath(rect: bounds).cgPath
        }
        
        layer.addSublayer(dashBorder)
        self.dashBorder = dashBorder
    }
}
