//
//  BaseUrl.swift
//  RickAndMorthyApp
//
//  Created by Miguel Saravia on 11/7/23.
//

import Foundation


final class BaseUrl: NSObject {
    func getBaseURL(_ key: String) -> String? {
        let bundle = Bundle.main
        guard let path = bundle.path(forResource: "Enviroment", ofType: "plist"),
              let url = NSDictionary(contentsOfFile: path) else { return nil }
        return url[key] as? String
    }
}
