//
//  RefreshUserError.swift
//  Club
//
//  Created by Adrien Carvalot on 12/01/2022.
//

import Foundation

/** Error enum object to manage refresh user error */
enum RefreshUserError: Error {

    case unspecified

    init(_ description: String?) {
        switch description {
        default:
            self = .unspecified
        }
    }

}

// MARK: - Extension to manage localized error

extension RefreshUserError: LocalizedError {

    /** Key to use when display is needed */
    public var errorDescription: String? {
        switch self {
        case .unspecified:
            return "refreshUser.error.default"
        }
    }

}
