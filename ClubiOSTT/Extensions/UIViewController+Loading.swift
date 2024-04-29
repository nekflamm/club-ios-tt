//
//  UIViewController+Loading.swift
//  Club
//
//  Created by Kévin Empociello on 23/11/2020.
//

import UIKit

/** UIViewController extension to manage loading */
extension UIViewController {

    /** Display the loading screen */
    func startLoading() {
        if view.layer.sublayers?.reversed().first(where: { $0.name == "loadingShadow" }) == nil {
            createGradientLayer()
        }

        if view.subviews.reversed().first(where: { $0 is TLLoadingView }) == nil {
            self.view.addSubview(TLLoadingView(frame: view.frame))
        }
    }

    /** Dismiss the loading screen */
    func stopLoading() {
        view.isUserInteractionEnabled = true

        for view in view.subviews.reversed() where view is TLLoadingView {
            view.removeFromSuperview()
        }

        for sublayer in view.layer.sublayers?.reversed() ?? [] where sublayer.name == "loadingShadow" {
            sublayer.removeFromSuperlayer()
        }
    }

    /** Create the radial gradient layer */
    private func createGradientLayer() {
        let gradientLayer = CAGradientLayer()

        gradientLayer.frame = CGRect(x: (UIScreen.main.bounds.width / 2) * -1,
                                     y: 0,
                                     width: UIScreen.main.bounds.width * 2,
                                     height: UIScreen.main.bounds.height)
        gradientLayer.type = .radial
        gradientLayer.name = "loadingShadow"
        gradientLayer.colors = [UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor, UIColor.clear.cgColor]

        let center = CGPoint(x: 0.5, y: 0.5)
        let animation = CABasicAnimation(keyPath: "colors")

        gradientLayer.startPoint = center
        gradientLayer.endPoint = CGPoint(x: 0, y: 0)

        animation.fromValue = [UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor, UIColor.clear.cgColor]
        animation.toValue = [UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor, UIColor.clear.cgColor]
        animation.duration = 0.2

        gradientLayer.add(animation, forKey: nil)
        self.view.layer.addSublayer(gradientLayer)
    }
}
