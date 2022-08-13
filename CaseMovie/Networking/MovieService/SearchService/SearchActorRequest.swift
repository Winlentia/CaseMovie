//
//  SearchActorRequest.swift
//  CaseMovie
//
//  Created by Winlentia on 13.08.2022.
//

import Foundation

class SearchActorRequest: NetworkRequest {
    init(query: String) {
        super.init()
        self.path = "search/person?query=\(query)"
    }
}

struct SearchActorResponse: Codable {
    let page: Int?
    let results: [Actor]?
    let totalPages: Int?
    let totalResults: Int?
}


struct Actor: Codable {
    let adult: Bool?
    let gender: Int?
    let id: Int?
    let knownFor: [Movie]?
    let knownForDepartment: String?
    let name: String?
    let popularity: Double?
    let profilePath: String?
}

