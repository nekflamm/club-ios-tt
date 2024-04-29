//
//  GetUserUseCaseLogic.swift
//  Club
//
//  Created by Florian Pygmalion on 10/01/2022.
//

import RxSwift

/**
 User usecase logic protocol to communicate between ViewModel and UseCase
 Get the logged user
 */
protocol GetUserUseCaseLogic {
    
    // MARK: - Functions
    
    /**
     Get an Observable on the `User` object to get the last version of it
     - returns: The observable on the user.
     */
    func getUser() -> Observable<User?>
    
    /**
     Refresh the current user and returns a basic response as a Single.
     - returns: A Single of the refresh user response, indicating whether the refresh has succeed or not.
     */
    func refreshUser() -> Single<BasicTLResponse>
}
