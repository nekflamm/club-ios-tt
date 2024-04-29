//
//  AnalyticsEvent.swift
//  Club
//
//  Created by Adrien Carvalot on 06/01/2022.
//

import Foundation

/** Protocol defining the requirements for analytics event */
protocol AnalyticsEvent {

    /** Name of the screen */
    var screenName: String { get }

    /** Name of the event */
    var name: String { get }

    /** Parameters of the event, automatically built */
    var parameters: [String: Any]? { get }
}

/** Gives access to common events properties. */
extension AnalyticsEvent {

    /** Common mandatory key for several events */
    var screenKey: String { "screen" }
}
