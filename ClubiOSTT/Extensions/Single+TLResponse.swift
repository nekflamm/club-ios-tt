//
//  Single+TLResponse.swift
//  Club
//
//  Created by Arthur ARNAUD on 06/03/2023.
//

import RxSwift

// MARK: - Extension HTTPResponse

extension PrimitiveSequence where Trait == SingleTrait {
    /**
     Map a `Single` of `HTTPResponse` into a `Single` of `TLResponse`
     - parameter errorHandler: Error mapping
     - returns: A `Single` of `TLResponse` of `T`
     */
    func mapToTLResponse<T: Codable>(
        _ errorHandler: @escaping (String?) -> Error
    ) -> Single<TLResponse<T>> where PrimitiveSequence.Element == HTTPResponse<T> {
        
        return mapToTLResponse(T.self, errorHandler: errorHandler)
    }
    
    /**
     Map a `Single` of `HTTPResponse` into a `Single` of `TLResponse` with specified type
     - parameter type: The type of generic T
     - parameter errorHandler: Error mapping
     - returns: A `Single` of `TLResponse` of `T`
     */
    func mapToTLResponse<T: Codable>(
        _ type: T.Type,
        errorHandler: @escaping (String?) -> Error
    ) -> Single<TLResponse<T>> where PrimitiveSequence.Element == HTTPResponse<T> {
        return map { response in
            let errors = response.error == nil ? nil : [errorHandler(response.error)]

            return TLResponse(success: response.success,
                              errors: errors,
                              data: response.data)
        }
    }
    
    /**
     Map a `Single` of `HTTPResponse<Bool>` into a `Single` of `BasicTLResponse`
     */
    func mapToBasicTLResponse(_ errorHandler: @escaping (String?) -> Error) -> Single<BasicTLResponse> where PrimitiveSequence.Element == HTTPResponse<Bool> {
        return map { response in
            let errors = response.error == nil ? nil : [errorHandler(response.error)]
            
            return BasicTLResponse(success: response.success,
                                   errors: errors,
                                   data: response.data)
        }
    }
}
