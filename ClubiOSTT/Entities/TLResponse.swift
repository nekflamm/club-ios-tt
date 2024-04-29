//
//  TLResponseX.swift
//  Club
//
//  Created by Kévin Empociello on 19/11/2021.
//

import Foundation

typealias BasicTLResponse = TLResponse<Bool>

/** New TLResponse */
struct TLResponse<T> {
    
    // MARK: - Properties
    
    let success: Bool
    let errors: [Error]?
    let data: T?
    
    // MARK: - Functions
    
    /**
     Build a successful `TLResponse<T>`
     - parameter data: The response's data as T.
     - returns: A successful `TLResponse<T>`
     */
    static func success(data: T? = nil) -> TLResponse<T> {
        return TLResponse<T>(success: true, errors: nil, data: data)
    }
    
    /**
     Build an errored `TLResponse`
     - parameter error: The error `Error`
     - returns: An errored `TLResponse`
     */
    static func error(_ error: Error) -> TLResponse<T> {
        return TLResponse(success: false, errors: [error], data: nil)
    }
    
    /**
     Build an errored `TLResponse` containing several errors
     - parameter errors: The array of `Error`
     - returns: An errored `TLResponse`
     */
    static func error(_ errors: [Error]?) -> TLResponse<T> {
        return TLResponse(success: false, errors: errors, data: nil)
    }
}

/** HTTPResponse representing */
struct HTTPResponse<T: Codable>: Codable {
    let success: Bool
    let error: String?
    let data: T?
}

