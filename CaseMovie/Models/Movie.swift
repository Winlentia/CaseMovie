//
//  Movie.swift
//  CaseMovie
//
//  Created by Winlentia on 11.08.2022.
//

import Foundation

struct Movie: Codable {
    let id: Int?
    let title: String?
    let adult: Bool?
    let backdropPath: String?
    let genreIds: [Int]?
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let releaseDate: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
}
