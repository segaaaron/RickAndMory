//
//  CharacterPresenter.swift
//  RickAndMorthyApp
//
//  Created by Miguel Saravia on 11/7/23.
//

import Foundation
import Combine
import SwiftUI


final class CharacterPresenter: ObservableObject {
    @Published public private(set) var characterList: [Result] = []
    
    var currentPage = 1
    private var subscriber = Set<AnyCancellable>()
    private var cancellable: AnyCancellable?
    
    func getList(with page: Int) {
        
        var params: [String: String] = [:]
        params["page"] = "\(page)"
        
        let service = ServiceApi()
        if let requestProvider: URLRequest = RequestProvider(method: .GET, params: params, endPoint: .character).getRequest() {
            service.publisherService(requestProvider, decodableModel: CharacterResponse.self)
                .receive(on: DispatchQueue.main)
                .sink { completion in
                    if case .failure(let error) = completion {
                        print("error \(error.localizedDescription)")
                    }
                } receiveValue: { response in
                    self.currentPage += 1
                    if let list = response.results {
                        print("URL QUE LLAMA", requestProvider.url?.absoluteString, self.currentPage)
                        self.characterList.append(contentsOf: list)
                    }
                }
                .store(in: &subscriber)
        }
    }
}


//var params: [String: String] = [:]
//params["page"] = "\(currentPage)"
