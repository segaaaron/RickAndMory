//
//  Network.swift
//  RickAndMorthyApp
//
//  Created by Miguel Saravia on 10/7/23.
//

import Foundation
import Combine

protocol NetworkSession: AnyObject {
    func publisherService<T: Decodable>(_ request: URLRequest, decodableModel: T.Type) -> AnyPublisher<T, APIError>
}

final class ServiceApi: NetworkSession {
    
    func publisherService<T>(_ request: URLRequest, decodableModel: T.Type) -> AnyPublisher<T, APIError> where T: Decodable {
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap({ result in
                guard let httpResponse = result.response as? HTTPURLResponse else {
                    throw APIError.generalError
                }
                if (200..<300) ~= httpResponse.statusCode {
                    print("STATUS CODE RESPONSE  ===>", httpResponse.statusCode)
                    return result.data
                } else {
                    throw APIError.customError
                }
            })
            .decode(type: T.self, decoder: JSONDecoder() )
            .mapError({ error -> APIError in
                if let error = error as? APIError {
                    return error
                }
                return APIError.generalError
            })
            .eraseToAnyPublisher()
    }
}
