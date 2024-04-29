//
//  GetContentRequestsUseCase.swift
//  Club
//
//  Created by Adrien Carvalot on 09/09/2022.
//

import Foundation
import RxSwift

/** Implementation of the `GetContentRequestsUseCaseLogic` protocol */
class GetContentRequestsUseCase: GetContentRequestsUseCaseLogic {

    // MARK: - Properties

    /** Common instance of the `GetContentRequestsUseCaseLogic` protocol */
    static let shared: GetContentRequestsUseCaseLogic = GetContentRequestsUseCase()

    // MARK: - Private properties

    /** Singleton instance of the `UserWorkerLogic` */
    private let userWorker: UserWorkerLogic = UserWorker.shared

    // MARK: - Initializers

    private init() {}

    // MARK: - Functions
    
    /** Refers to the `get` function of the `GetContentRequestsUseCaseLogic`. */
    func get() -> Single<TLResponse<[ContentRequest]>> {
        return userWorker.getContentRequest()
            .map { TLResponse<[ContentRequest]>(success: $0.success,
                                                errors: $0.errors,
                                                data: $0.data?.sorted { $0.createdAt < $1.createdAt })}
    }
    
}
