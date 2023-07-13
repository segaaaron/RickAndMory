//
//  RequestApi.swift
//  RickAndMorthyApp
//
//  Created by Miguel Saravia on 11/7/23.
//

import Foundation


protocol RequestProtocol: AnyObject {
    var method: HTTPMETHOD { get }
    var params: [String: String]? { get }
    var endPoint: ENDPOINT { get }
    var baseUrl: String { get }
}

final class RequestProvider: RequestProtocol {
    var method: HTTPMETHOD
    var params: [String: String]?
    var endPoint: ENDPOINT
    var baseUrl: String {
        guard let customUrl = BaseUrl().getBaseURL("baseUrl") else {
            return "-1"
        }
        return customUrl
    }
    
    init(method: HTTPMETHOD, params: [String : String]? = [:], endPoint: ENDPOINT) {
        self.method = method
        self.params = params
        self.endPoint = endPoint
    }
    
    func getRequest() -> URLRequest? {
        let paramString: [String: String] = params?.compactMapValues { $0 } ?? [:]
        
        var component = URLComponents(string: baseUrl + endPoint.path)
        
        if method == .GET {
            component?.queryItems = paramString.map {(key, value) in
                URLQueryItem(name: key, value: value)
            }
        }
        
        guard let currentUrl = component?.url else {
            return nil
        }
        
        var request = URLRequest(url: currentUrl)
        
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        return request
    }
    
}
