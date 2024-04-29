//
//  RequestsListAnalytic.swift
//  Club
//
//  Created by Adrien Carvalot on 07/09/2022.
//

import Foundation

/** `NewAnalyticsEvent` of the `RequestsListViewController` */
enum RequestsListAnalytic: NewAnalyticsEvent {

    // MARK: - Events

    case screen
    case closeButton
    case addButton
    case requestButton(requestId: String)
    
    // MARK: - AnalyticsEvent protocol conformance

    /** Refers to the `contextName` property of the `NewAnalyticsEvent` */
    var contextName: String {
        return "mobile_requestsList"
    }

    /** Refers to the `eventName` property of the `NewAnalyticsEvent` */
    var eventName: String {
        switch self {
        case .screen:
            return "screen"
        case .closeButton:
            return "close_button"
        case .addButton:
            return "add_button"
        case .requestButton:
            return "request_button"
//        case .optionsSheet:
//            return "optionsSheet"
//        case .optionsSheetEditButton:
//            return "optionsSheetEdit_button"
//        case .optionsSheetDeleteButton:
//            return "optionsSheetDelete_button"
        }
    }

    /** Refers to the `parameters` property of the `NewAnalyticsEvent` */
    var parameters: [String: Any]? {
        switch self {
        case .requestButton(let requestId):
            return [AnalyticsProperty.Text.id.rawValue: requestId]
        case .screen,
             .closeButton,
             .addButton:
            return nil
        }
    }

}
