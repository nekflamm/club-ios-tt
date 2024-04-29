//
//  Single+Error.swift
//  Club
//
//  Created by Kévin Naudin on 01/03/2023.
//

import RxSwift

// MARK: - Extension TLResponse

extension PrimitiveSequence where Trait == SingleTrait {
    
    /**
     Map a `Single` of `TLResponse` into a `Single` of `Void` in case of success
     If the TLResponse contains an error, throw it
     */
    func mapToVoidOrError<T: Codable>() -> Single<Void> where PrimitiveSequence.Element == TLResponse<T> {
        return map { response -> Void in
            if let error = response.errors?.first {
                throw error
            }

            return ()
        }
    }
    
}
