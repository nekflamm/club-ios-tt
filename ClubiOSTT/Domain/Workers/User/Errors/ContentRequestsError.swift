//
//  ContentRequestsError.swift
//  ClubiOSTT
//
//  Created by Kévin Empociello on 4/29/24.
//

import Foundation

/** Error enum object to manage content request errors */
enum ContentRequestsError: Error {

    case unspecified
    case cannotRetrieve

    init(_ description: String?) {
        switch description {
        default:
            self = .unspecified
        }
    }

}

// MARK: - Extension to manage localized error

extension ContentRequestsError: LocalizedError {

    /** Key to use when display is needed */
    public var errorDescription: String? {
        switch self {
        case .unspecified:
            return "contentRequestsList.error.generic"
        case .cannotRetrieve:
            return "contentRequestsList.error.cannotRetrieve"
        }
    }

}
