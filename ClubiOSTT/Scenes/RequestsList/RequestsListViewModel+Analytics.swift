//
//  RequestsListViewModel+Analytics.swift
//  Club
//
//  Created by Adrien Carvalot on 07/09/2022.
//

import Foundation

// MARK: - Analytics extension to implement every methods related to Analytics

extension RequestsListViewModel {

    /**
     Setup the logging of Analytics events.
     - parameter input: object which refers to the `LinksListViewModel.Input` structure
     */
    func setupAnalytics(with input: Input) {

        /** `screen` analytics events */
        sendAnalytics(RequestsListAnalytic.screen)
        
        /** `addButton` analytics events */
        input.addRequestTap.subscribe(onNext: {
            self.sendAnalytics(RequestsListAnalytic.addButton)
        }).disposed(by: disposeBag)
        
        /** `requestButton` analytics events */
        input.requestTap.subscribe(onNext: {
            self.sendAnalytics(RequestsListAnalytic.requestButton(requestId: $0.id))
        }).disposed(by: disposeBag)
    }

}
