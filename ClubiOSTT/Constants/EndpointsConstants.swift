//
//  EndpointsConstants.swift
//  Club
//
//  Created by Florian Pygmalion on 10/01/2022.
//

import Foundation

/** Constants related to the endpoints */
enum EndpointsConstants {

    // MARK: - Private properties

    /** The base url for staging */
    private static let stagingBaseUrl = ""
    
    // MARK: - Properties

    /** Base url to make API calls */
    static var baseURL: String {
        return stagingBaseUrl
    }
  
    /** BaseURL of the User service on the API */
    static var userURL: String {
        return "\(baseURL)/v1/users"
    }

}
