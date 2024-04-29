//
//  BaseViewModel.swift
//  Boilerplate
//
//  Created by Kévin Empociello on 16/10/2020.
//

import RxSwift
import RxCocoa
import Foundation

/** Parent class of ViewModel */
class BaseViewModel: NSObject {
    
    // MARK: - Input/Output
    
    struct Input {
        let viewDidAppear: ControlEvent<Void>
        let isLoading: Binder<Bool>
    }
    
    struct Output {
        let navigate: Driver<TLNavigate?>
        let close: Driver<TLNavigateClose?>
        let popup: Driver<TLPopupViewModel?>
        let actionSheet: Driver<ActionSheetUI?>
    }

    // MARK: - Properties
    
    /** Dispose bag for RxSwift */
    var disposeBag = DisposeBag()

    /** General navigation subject observed by the `BaseViewController` */
    let navigate = PublishSubject<TLNavigate?>()
    
    /** General close navigation subject observed by the `BaseViewController` */
    let close = PublishSubject<TLNavigateClose?>()

    /** General subject used to show / hide the loader in the screen */
    let isLoading = PublishSubject<Bool>()
    
    /** General subject used to detect when a view did appear */
    let viewDidAppear = PublishSubject<Void>()
    
    /** Rx subject which notify the view when a popup should be displayed */
    let popup = PublishSubject<TLPopupViewModel?>()
    
    /** Rx subject which notify the view when an action sheet should be displayed */
    let alertActions = PublishSubject<ActionSheetUI?>()

    // MARK: - Private properties

    /** Common instance of `AnalyticsProviderLogic` */
    private let analyticsProvider: AnalyticsProviderLogic = AnalyticsProvider.shared

    // MARK: - Functions
    
    func transform(input: Input) -> Output {

        /** Get notified when the loader should be update to be shown / hidden  */
        isLoading
            .bind(to: input.isLoading)
            .disposed(by: disposeBag)
        
        /** Get notified when a view didAppear  */
        input.viewDidAppear
            .bind(to: viewDidAppear)
            .disposed(by: disposeBag)

        return Output(navigate: self.navigate.asDriver(onErrorJustReturn: nil),
                      close: self.close.asDriver(onErrorJustReturn: nil),
                      popup: popup.asDriver(onErrorJustReturn: nil),
                      actionSheet: alertActions.asDriver(onErrorJustReturn: nil))
    }
    
    /**
     Log an analytics event easily.
     - parameter event: The event to log, containing name and properties.
     */
    func sendAnalytics(_ event: AnalyticsEvent) {
        analyticsProvider.send(event: event)
    }
    
    /**
     Log an analytics event easily.
     - parameter event: The event to log, containing name and properties.
     */
    func sendAnalytics(_ event: NewAnalyticsEvent) {
        analyticsProvider.send(event: event)
    }
    
    /** Unbind the `BaseViewModel`. Disposed the disposeBag */
    func unbind() {
        disposeBag = DisposeBag()
    }
    
}
