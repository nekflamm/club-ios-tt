//
//  UserWorker.swift
//  Club
//
//  Created by Florian Pygmalion on 07/01/2022.
//

import RxSwift
import Foundation

/** Worker to manage user manipulation (get/set) implementing `UserWorkerLogic` protocol */
class UserWorker: UserWorkerLogic {

    // MARK: - Properties

    /** Common instance of the `UserWorkerLogic` protocol */
    static let shared: UserWorkerLogic = UserWorker()

    // MARK: - Private properties
    
    /** A subject to the (optional) current connected user */
    private let userSubject = BehaviorSubject<User?>(value: nil)

    /** Client to do some http request following the protocol `HTTPClient` here a Alamofire implementation */
    private let httpClient: HTTPClient = FakeHTTPClient()
    
    // MARK: - Initializers
    
    private init() {}

    // MARK: - Functions

    /** Refers to `refresh` function from the `UserWorkerLogic` protocol */
    func refresh() -> Single<TLResponse<User>> {
        let url = "\(EndpointsConstants.userURL)/me"

        return httpClient.request(url: url, method: .get, parameters: nil)
            .mapToTLResponse { RefreshUserError($0) }
            .do(onSuccess: { response in
                self.userSubject.onNext(response.data)
            })
            .catch { error in .just(.error(error)) }
    }

    /** Refers to `getUser` function from the `UserWorkerLogic` protocol */
    func getUser() -> Observable<User?> {
        return userSubject
    }
    
    /** Refers to `getContentRequest` function from the `UserWorkerLogic` protocol */
    func getContentRequest() -> Single<TLResponse<[ContentRequest]>> {
        return Single.create { emitter -> Disposable in
            
            let data = [
                ContentRequest(id: UUID().uuidString,
                               createdAt: Date(),
                               title: "Video shoutout", description: "I'll shot a short video of me to shoutout your name", price: 999)
            ]
            
            Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
                emitter(.success(TLResponse.success(data: data)))
            }
            
            return Disposables.create()
        }
        
        
        
       // return Single.just(TLResponse.success(data: []))
    }

}
