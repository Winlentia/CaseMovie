//
//  PersonDetailRequest.swift
//  CaseMovie
//
//  Created by Winlentia on 14.08.2022.
//

import Foundation

class PersonDetailRequest: NetworkRequest {
    init(id: Int) {
        super.init()
        self.path = "person/\(id)"
    }
}

struct PersonDetail: Codable {
    let adult: Bool?
    let alsoKnownAs: [String]?
    let biography: String?
    let birthday: String?
    let deathday: String?
    let gender: Int?
    let homepage: String?
    let id: Int?
    let imdbId: String?
    let knownForDepartment: String?
    let name: String?
    let placeOfBirth: String?
    let popularity: Double?
    let profilePath: String?
}
