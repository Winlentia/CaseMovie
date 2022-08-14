//
//  Person.swift
//  CaseMovie
//
//  Created by Winlentia on 14.08.2022.
//

import Foundation

struct Person: Codable {
    let adult: Bool?
    let gender: Int?
    let id: Int?
    let knownFor: [Movie]?
    let knownForDepartment: String?
    let name: String?
    let popularity: Double?
    let profilePath: String?
}
