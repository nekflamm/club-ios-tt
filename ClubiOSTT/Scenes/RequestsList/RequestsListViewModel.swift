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
        let args: RequestsListArguments?
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

    func transform(input: Input) -> Output {
        input.isLoading.onNext(true)
        setupAnalytics(with: input)
        
        let datasource: Observable<[ContentRequestsListSection]> = getContentRequestsUseCase.get().asObservable()
            .do(onNext: { _ in input.isLoading.onNext(false) })
            .map { self.handleRequestsResponse(from: $0) }
            .do(onNext: { input.placeholderHidden.onNext(!$0.isEmpty) })
                
        input.closeTap
            .subscribe(onNext: { self.close.onNext(TLNavigateClose()) })
            .disposed(by: disposeBag)

        input.requestTap.subscribe(onNext: { request in
            self.hapticFeedbackManager.vibrate(.light)
            print("Request tapped = \(request)")
        }).disposed(by: disposeBag)
        
        return Output(requestsDatasource: datasource.asDriver(onErrorJustReturn: []))
    }

    private func handleRequestsResponse(from resp: TLResponse<[ContentRequest]>) -> [ContentRequestsListSection] {
        guard resp.success, let data = resp.data else {
            handleError(from: resp.errors?.first)
            return []
        }

        let requestsModel = data.map {
            ContentRequestUI(id: $0.id,
                             title: $0.title,
                             description: $0.description,
                             price: $0.price.getDisplayablePrice())
        }
                
        return requestsModel.isEmpty ? [] : [ContentRequestsListSection(items: requestsModel)]
    }
    
    private func handleError(from error: Error?) {
        guard let error = error else { return }
        
        hapticFeedbackManager.vibrate(.error)
        popup.onNext(TLPopupViewModel.error(message: error.localizedDescription))
    }
}
