//
//  WelcomeAnalytic.swift
//  Club
//
//  Created by Kévin Empociello on 07/06/2021.
//

import Foundation

/** `NewAnalyticsEvent` of the `WelcomeViewController` */
enum WelcomeAnalytic: NewAnalyticsEvent {
    
    // MARK: - Events
    
    case screen
    case continueButton
    
    // MARK: - NewAnalyticsEvent protocol conformance
    
    /** Refers to the `contextName` property of the `NewAnalyticsEvent` */
    var contextName: String {
        return "mobile_welcome"
    }
    
    /** Refers to the `eventName` property of the `NewAnalyticsEvent` */
    var eventName: String {
        switch self {
        case .screen:
            return "screen"
        case .continueButton:
            return "continue_button"
        }
    }
    
    /** Refers to the `parameters` property of the `NewAnalyticsEvent` */
    var parameters: [String: Any]? {
        switch self {
        case .screen,
                .continueButton:
            return nil
        }
    }
    
}
