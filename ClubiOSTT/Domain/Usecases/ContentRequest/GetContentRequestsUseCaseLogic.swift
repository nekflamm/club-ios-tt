//
//  GetContentRequestsUseCaseLogic.swift
//  Club
//
//  Created by Adrien Carvalot on 09/09/2022.
//

import RxSwift
import Foundation

/**
 Use to get the creator's content requests
 Usecase logic protocol to communicate between ViewModel and UseCase
 */
protocol GetContentRequestsUseCaseLogic {

    // MARK: - Functions
    
    /**
     Get the list of content request of the creator, as `TLResponse`
     - returns: A Single of the response with error, success & data
     */
    func get() -> Single<TLResponse<[ContentRequest]>>
    
}
