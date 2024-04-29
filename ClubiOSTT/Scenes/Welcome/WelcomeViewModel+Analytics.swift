//
//  WelcomeViewModel+Analytics.swift
//  Club
//
//  Created by Adrien Carvalot on 06/01/2022.
//

import RxSwift

// MARK: - Analytics extension to implement every methods related to Analytics

extension WelcomeViewModel {
    
    /** Setup Analytics evens. */
    func setupAnalytics(with input: Input) {
        
        /** `screen` analytics events */
        sendAnalytics(WelcomeAnalytic.screen)
        
        /** `continueButton` analytics events */
        input.continueTap.subscribe(onNext: {
            self.sendAnalytics(WelcomeAnalytic.continueButton)
        }).disposed(by: disposeBag)
    }
    
}
