//
//  UtilEnum.swift
//  RickAndMorthyApp
//
//  Created by Miguel Saravia on 10/7/23.
//

import Foundation

enum SeletedTab: Hashable {
    case characters
    case locations
    case episodes
}

enum HTTPMETHOD: String {
    case GET = "get"
    case POST = "post"
}

enum ENDPOINT {
    case character
    case location
    case episodes
    
    var path: String {
        switch self {
        case .character:
            return "/character"
        case .location:
            return "/location"
        case .episodes:
            return "/episode"
        }
    }
    
}
