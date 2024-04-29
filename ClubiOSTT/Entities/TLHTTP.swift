//
//  TLHTTP.swift
//  Boilerplate
//
//  Created by Kévin Empociello on 20/10/2020.
//

import Foundation

/**
 This enum specifies all HTTP headers (ex: "Authorization")
 */
enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

/** This enum specifies all HTTP methods (ex: "POST") */
enum TLHTTPMethod: String {
    case post = "POST"
    case get = "GET"
    case put = "PUT"
    case delete = "DELETE"
    case patch = "PATCH"
}

/**
 This enum specifies all API content types (ex: "application/json")
 */
enum ContentType: String {
    case json = "application/json"
}
