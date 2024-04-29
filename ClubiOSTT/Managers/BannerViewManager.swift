//
//  BannerViewManager.swift
//  Club
//
//  Created by Florian Pygmalion on 07/09/2022.
//

import UIKit
import Foundation

/** Manages the displaying of the `BannerView`. */
class BannerViewManager {

    // MARK: - Properties

    /** Reference to the `BannerViewManagerDelegate` instanciating this manager */
    weak var delegate: BannerViewManagerDelegate?

    // MARK: - Private properties

    /** The parent view where the `BannerView` should be shown. */
    private var parentView: UIView?

    /** Contains the `BannerView` displayed. */
    private var bannerView: BannerView?

    /** The default frame the banner view should have. */
    private let defaultBannerFrame: CGRect

    /** Indicates the visible duration of a banner view. */
    private let visibleDuration: TimeInterval = 1.2

    /** Top constraint used to move the banner view */
    private var topConstraint: NSLayoutConstraint?

    /** A work item we use to store the dismiss logic so we can cancel it when needed */
    private var workItem: DispatchWorkItem? = nil
    
    // MARK: - Initializers

    init() {
        let screenRect = UIScreen.main.bounds
        let bannerHeight: CGFloat = 92

        defaultBannerFrame = CGRect(x: 0,
                                   y: 0,
                                   width: screenRect.width,
                                   height: bannerHeight)
    }

    // MARK: - Functions

    /**
     Build a `BannerView` from a given `BannerViewUI`, add it
     as subview in a given view and then show it on view.
     - parameter model: The ui model containing the needed data to create the `BannerView`.
     - parameter parentView: The parent view where the `BannerView` should be added.
     */
    open func receive(model: BannerViewUI) {
        guard let bannerViewContainer = delegate?.getBannerContainerView() ?? UIApplication.shared.currentKeyWindow,
              bannerView == nil else { return }

        self.parentView = bannerViewContainer

        let bannerView = buildBannerView(from: model)
        bannerViewContainer.addSubview(bannerView)

        NSLayoutConstraint.activate([
            bannerView.leadingAnchor.constraint(equalTo: bannerViewContainer.leadingAnchor, constant: 0),
            bannerViewContainer.trailingAnchor.constraint(equalTo: bannerView.trailingAnchor, constant: 0),
            bannerView.heightAnchor.constraint(equalToConstant: defaultBannerFrame.height)
        ])

        topConstraint = bannerView.topAnchor.constraint(equalTo: bannerViewContainer.topAnchor,
                                                        constant: -defaultBannerFrame.height)
        topConstraint?.isActive = true

        /** Add pan gesture to handle swiping up to dismiss the banner */
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        bannerView.addGestureRecognizer(panGesture)
        
        /** We need to force layoutIfNeeded to avoid some weird UI glitches */
        bannerViewContainer.layoutIfNeeded()

        self.bannerView = bannerView

        showBannerView()
    }

    /** Shows the `BannerView` by animating their constraints. */
    private func showBannerView() {
        topConstraint?.constant = 0
 
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
            self.parentView?.layoutIfNeeded()
        }, completion: { _ in
            self.workItem = DispatchWorkItem {
                self.animateDismiss()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + self.visibleDuration, execute: self.workItem!)
        })
    }

    /**
     Builds a `BannerView` from a `BannerViewUI` and returns it.
     - parameter model: The model containing the needed data to configure the banner view.
     - returns: The `BannerView` build from the data
     */
    private func buildBannerView(from model: BannerViewUI) -> BannerView {
        let bannerView = BannerView(frame: defaultBannerFrame)
        bannerView.configure(with: model)
        bannerView.translatesAutoresizingMaskIntoConstraints = false

        return bannerView
    }

    /**
     Handle the pan gesture of the banner to dismiss it
     - parameter model: The model containing the needed data to configure the banner view.
     */
    @objc func handlePan(_ recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.parentView)
        switch recognizer.state {
            
        case .began, .changed:
            guard translation.y < 0 else { return }
            self.topConstraint?.constant = translation.y
        case .ended, .cancelled, .failed:
            return animateDismiss()
        default:
            return
        }
    }
    
    /** Animate the dimiss of the view after the end of the timer or a pan gesture from the user */
    func animateDismiss() {
        workItem?.cancel()
        guard bannerView != nil else { return }
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn) {
            self.topConstraint?.constant = self.defaultBannerFrame.height * -1
            self.parentView?.layoutIfNeeded()
        } completion: {_ in
            self.bannerView?.removeFromSuperview()
            self.bannerView = nil
        }
    }
}
