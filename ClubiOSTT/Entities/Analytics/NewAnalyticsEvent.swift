//
//  NewAnalyticsEvent.swift
//  Club
//
//  Created by Kévin Naudin on 09/11/2022.
//

import Foundation

/** Protocol defining the requirements for new analytics event */
protocol NewAnalyticsEvent {

    /** Name of the screen */
    var contextName: String { get }

    /** Name of the event */
    var eventName: String { get }

    /** Parameters of the event, automatically built */
    var parameters: [String: Any]? { get }
}
