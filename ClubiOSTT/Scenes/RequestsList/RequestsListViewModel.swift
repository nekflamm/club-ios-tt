//
//  RequestsListViewModel.swift
//  Club
//
//  Created by Adrien Carvalot on 07/09/2022.
//

import Foundation
import RxCocoa
import RxSwift
import UIKit

/** ViewModel used by `RequestsListViewController` */
class RequestsListViewModel: BaseViewModel {

    // MARK: - Input/Output

    struct Input {
        let isLoading: Binder<Bool>
        let closeTap: ControlEvent<Void>
        let viewDidAppear: ControlEvent<Void>
        let addRequestTap: ControlEvent<Void>
        let requestTap: Observable<ContentRequestUI>
        let placeholderHidden: Binder<Bool>
    }

    struct Output {
        let requestsDatasource: Driver<[ContentRequestsListSection]>
    }

    // MARK: - Private properties

    /** Instance of the `GetContentRequestsUseCaseLogic` */
    private let getContentRequestsUseCase: GetContentRequestsUseCaseLogic = GetContentRequestsUseCase.shared
    
    /** Common instance of the `hapticFeedbackManager` protocol */
    private let hapticFeedbackManager = HapticFeedbackManager.shared
    
    // MARK: - Functions

    /**
     Transforming `RequestsListViewModel.Input` given by the `RequestsListViewController`
     into `RequestsListViewModel.Output` get by the `RequestsListViewController`
     - parameter input: object which refers to the `RequestsListViewModel.Input` structure
     - returns: The output created from the input
     */
    func transform(input: Input) -> Output {
        input.isLoading.onNext(true)

        /** Setup the Analytics events logging */
        setupAnalytics(with: input)
        
        /** Builds the requests datasource from the user's content requests */
        let datasource: Observable<[ContentRequestsListSection]> = getContentRequestsUseCase.get()
            .asObservable()
            .do(onNext: { _ in input.isLoading.onNext(false) })
            .map { self.buildRequestsDatasource(from: $0.data ?? []) }
            .do(onNext: { input.placeholderHidden.onNext(!$0.isEmpty) })
                
        input.closeTap
            .subscribe(onNext: { self.close.onNext(TLNavigateClose()) })
            .disposed(by: disposeBag)

        input.requestTap.subscribe(onNext: { request in
            print("Request tapped = \(request)")
        }).disposed(by: disposeBag)
        
        return Output(requestsDatasource: datasource.asDriver(onErrorJustReturn: []))
    }

    /**
     Builds the requests datasource from a list of requests the user have.
     - parameter requests: The list of user's requests.
     - returns: An array of sections containing the model of the items (requests) to display.
     */
    private func buildRequestsDatasource(from requests: [ContentRequest]) -> [ContentRequestsListSection] {
        guard !requests.isEmpty else { return [] }
        
        let requestsModel = requests.map {
            ContentRequestUI(id: $0.id,
                             title: $0.title,
                             description: $0.description,
                             price: $0.price.getDisplayablePrice())
        }
        
        return [ContentRequestsListSection(items: requestsModel)]
    }
    
//    /**
//     Handle the deletion of the content request asked by the user to display an try again error popup if needed
//     - parameter response: The response to handle as `BasicTLResponse`
//     */
//    private func handleDeleteContentRequestResponse(_ response: BasicTLResponse) {
//        guard let error = response.errors?.first, !response.success else { return }
//
//        /** Completion called when close button is tapped, only log an analytics event */
//        let closeCompletion = {}
//
//        /** Completion called when retry button is tapped to retry to save the content request again */
//        //let actionCompletion = { self.retry.onNext(()) }
//
////        popup.onNext(TLPopupViewModel.tryAgain(message: error.localizedDescription,
////                                               actionCompletion: actionCompletion,
////                                               closeCompletion: closeCompletion))
//    }
    
}
