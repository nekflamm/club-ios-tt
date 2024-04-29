//
//  UserWorkerLogic.swift
//  Club
//
//  Created by Florian Pygmalion on 07/01/2022.
//

import RxSwift

/** Protocol to implement in order to do some user taks like update, create, refresh... */
protocol UserWorkerLogic {

    /**
     Get the user from remote and notify it on observable provided by `getUser()`
     - returns: A `Single` of `TLResponse` of `User`
     */
    func refresh() -> Single<TLResponse<User>>

    /**
     Get an Observable on the `User` object to get the last version of it
     - returns: The observable on the user.
     */
    func getUser() -> Observable<User?>
    
    /**
     Retrieve the list of content request for a creator as `TLResponse`
     - returns: The response (success/error) and data if existing
     */
    func getContentRequest() -> Single<TLResponse<[ContentRequest]>>
}
