//
//  GetUserUseCase.swift
//  Club
//
//  Created by Florian Pygmalion on 10/01/2022.
//

import RxSwift
import Foundation

/** Implementation of the `GetUserUseCaseLogic` protocol */
class GetUserUseCase: GetUserUseCaseLogic {

    // MARK: - Properties

    /** Singleton instance */
    static let shared: GetUserUseCaseLogic = GetUserUseCase()

    // MARK: - Private properties

    /** Singleton instance of the `UserWorkerLogic` */
    private let userWorker: UserWorkerLogic = UserWorker.shared

    /** Rx dispose bag */
    private let disposeBag = DisposeBag()
    
    // MARK: - Initialisers
    
    private init() {}

    // MARK: - Functions

    /** Refers to the `getUser` function of the `GetUserUseCaseLogic` */
    func getUser() -> Observable<User?> {
        return userWorker.getUser()
    }

    /** Refers to the `refreshUser` function of the `GetUserUseCaseLogic` */
    func refreshUser() -> Single<BasicTLResponse> {
        return userWorker.refresh()
            .map { BasicTLResponse(success: $0.success, errors: $0.errors, data: nil) }
    }
}
