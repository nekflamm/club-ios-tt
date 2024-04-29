//
//  HTTPClient.swift
//  Boilerplate
//
//  Created by Kévin Empociello on 20/10/2020.
//

import RxSwift
import Foundation

/** Protocol managing a HTTPRequest, to an API for example. */
protocol HTTPClient {

    /**
     A HTTP Client can make a request with a bearer token that return a generic typed `Single<HTTPResponse>`
     - parameter url: Absolute string URL
     - parameter method: HTTP method to use (TL custom enum: POST, GET etc.)
     - parameter headers: Custom headers to add or replace
     - parameter parameters: Parameters to send (["foo": "bar"])
     - parameter authenticated: Bool to define if we want to be authenticated for this request
     - returns: A `Single` to get notify of the response
     */
    func request<T: Codable>(url: String,
                             method: TLHTTPMethod,
                             headers: [String: String],
                             parameters: [String: Any]?,
                             authenticated: Bool) -> Single<HTTPResponse<T>>

    /**
     A HTTP Client can make a request as raw Data with a bearer token that return a `Single<Data>`
     - parameter url: Absolute string URL
     - parameter method: HTTP method to use (TL custom enum: POST, GET etc.)
     - parameter parameters: Parameters to send (["foo": "bar"])
     - returns: A `Single` to get notify of the response
     */
    func requestRawData(url: String,
                        method: TLHTTPMethod,
                        headers: [String: String],
                        parameters: [String: Any]?) -> Single<Data>
}

extension HTTPClient {
    /**
     A HTTP Client can make a request with a bearer token that return a generic typed `Single<HTTPResponse>`
     - parameter url: Absolute string URL
     - parameter method: HTTP method to use (TL custom enum: POST, GET etc.)
     - parameter headers: Heards to send (["foo": "bar"])
     - parameter parameters: Parameters to send (["foo": "bar"])
     - parameter authenticated: Bool to define if we want to be authenticated for this request defaulted to true
     - returns: A `Single` to get notify of the response
     */
    func request<T: Codable>(url: String,
                             method: TLHTTPMethod,
                             headers: [String: String] = [:],
                             parameters: [String: Any]?,
                             authenticated: Bool = true) -> Single<HTTPResponse<T>> {
        return request(url: url,
                       method: method,
                       headers: headers,
                       parameters: parameters,
                       authenticated: authenticated)
    }
    
    /**
     A HTTP Client can make a request with a bearer token that return a generic typed `Single<HTTPResponse>`
     - parameter url: Absolute string URL
     - parameter method: HTTP method to use (TL custom enum: POST, GET etc.)
     - parameter headers: Heards to send (["foo": "bar"])     
     - parameter parameters: Parameters to send (["foo": "bar"])
     - returns: A `Single` to get notify of the response
     */
    func requestRawData(url: String,
                        method: TLHTTPMethod,
                        headers: [String: String] = [:],
                        parameters: [String: Any]?) -> Single<Data> {
        return requestRawData(url: url,
                              method: method,
                              headers: headers,
                              parameters: parameters)
    }
}
