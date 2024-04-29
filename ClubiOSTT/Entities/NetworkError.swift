//
//  NetworkError.swift
//  Club
//
//  Created by Kévin Empociello on 19/11/2021.
//

import Foundation

/** Enum representing errors which can occurs during network tasks */
enum NetworkError: Error {
    case authTokenFailed
    case decodingFailed
    case requestFailed
    case timeout
    case unreachable
}

// MARK: - Extension to manage localized error
extension NetworkError: LocalizedError {

    /** Key to use when display is needed */
    public var errorDescription: String? {
        switch self {
        case .authTokenFailed:
            return "network.error.authTokenFailed"
        case .decodingFailed:
            return "network.error.decodingFailed"
        case .requestFailed:
            return "network.error.requestFailed"
        case .timeout:
            return "network.error.timeout"
        case .unreachable:
            return "network.error.unreachable"
        }
    }

}
