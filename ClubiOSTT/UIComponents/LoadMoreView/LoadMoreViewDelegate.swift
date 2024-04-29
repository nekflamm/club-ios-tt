//
//  LoadMoreViewDelegate.swift
//  Club
//
//  Created by Kevin on 07/01/2021.
//

import Foundation

/**
 Protocol which permits to send info
 which permits to send information to its delegate
 */
protocol LoadMoreViewDelegate: AnyObject {

    /** Tells the delegate that the retry button has been touched */
    func didTouchRetryButton()
}
