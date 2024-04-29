//
//  GetContentRequestsUseCaseLogic.swift
//  Club
//
//  Created by Adrien Carvalot on 09/09/2022.
//

import RxSwift
import Foundation

/**
 Usecase logic protocol to communicate between ViewModel and UseCase
 Use to get the creator's content requests
 */
protocol GetContentRequestsUseCaseLogic {

    // MARK: - Functions
    
    /**
     Get the current tutorial step of the content requests
     - returns: An `Observable` of the optional step, nil if there's no step left
     */
    func get() -> Single<TLResponse<[ContentRequest]>>
    
}
