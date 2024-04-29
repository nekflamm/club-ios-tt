//
//  AnalyticsProvider.swift
//  Club
//
//  Created by Maxime Silla Pellicer on 21/11/2022.
//

/** Implementation of the `AnalyticsProviderLogic` protocol */
class AnalyticsProvider: AnalyticsProviderLogic {

    // MARK: - Properties

    /** Singleton instance */
    static let shared: AnalyticsProviderLogic = AnalyticsProvider()

    // MARK: - Private properties
    
    /** Singleton instance of the `AmplitudeProviderLogic` */
    //private let amplitudeProvider: AmplitudeProviderLogic = AmplitudeProvider.shared

    // MARK: - Initializer

    /** Doing this, we ensure the `AnalyticsProvider` is not instancied from outside */
    private init() {}
    
    // MARK: - Functions
    
    /** Refers to the `send(event:)` function of the `AnalyticsProviderLogic` */
    func send(event: AnalyticsEvent) {
        Log.v("Sending - \(event.name): \(event.parameters ?? [:])")
        
        //amplitudeProvider.send(event: event)
    }

    /** Refers to the `send(event:)` function of the `AnalyticsProviderLogic` */
    func send(event: NewAnalyticsEvent) {
        let parameters = event.parameters == nil ? "" : ": \(event.parameters!)"
        print("📊 Analytics sent: \(event.contextName).\(event.eventName)\(parameters)")
        
        //amplitudeProvider.send(event: event)
    }
    
    /** Refers to the `setUserProperty` function of the `AnalyticsProviderLogic` */
    func setUserProperty(key: String, value: String?) {
        //amplitudeProvider.setUserProperty(key: key, value: value)
    }
}
