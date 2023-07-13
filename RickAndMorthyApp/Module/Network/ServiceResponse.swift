//
//  ServiceResponse.swift
//  RickAndMorthyApp
//
//  Created by Miguel Saravia on 10/7/23.
//

import Foundation
import UIKit

struct ServiceResponse: Codable, Identifiable {
    var id: UUID
    let characters, locations, episodes: String
}
