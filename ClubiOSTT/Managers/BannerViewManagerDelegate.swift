//
//  BannerViewManagerDelegate.swift
//  Club
//
//  Created by Florian Pygmalion on 17/02/2023.
//

import UIKit

/** Protocol of the `BannerViewManagerDelegate` to communicate with bannerView implementers  */
protocol BannerViewManagerDelegate: AnyObject {

    // MARK: - Functions

    /**
     Get the optional view on which banners will be added
     - returns: A `UIView?`
     */
    func getBannerContainerView() -> UIView?

}
