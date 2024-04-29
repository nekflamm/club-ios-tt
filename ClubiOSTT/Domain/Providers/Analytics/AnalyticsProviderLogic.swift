//
//  AnalyticsProviderLogic.swift
//  Club
//
//  Created by Maxime Silla Pellicer on 21/11/2022.
//

/**
 Analytics worker logic protocol to communicate between UseCase and Provider
 - Use to send analytics events depending on user actions
 */
protocol AnalyticsProviderLogic {

    // MARK: - Functions

    /**
     Send an event to analytics
     - parameter event: Custom event
     */
    func send(event: AnalyticsEvent)
    
    /**
     Send an event to analytics
     - parameter event: Custom event
     */
    func send(event: NewAnalyticsEvent)
    
    /**
     Set a specific user property
     - parameter key: User property key
     - parameter value: User property value
     */
    func setUserProperty(key: String, value: String?)
    
}
