//
//  MovieDetailRequest.swift
//  CaseMovie
//
//  Created by Winlentia on 11.08.2022.
//

import Foundation

final class MovieDetailRequest: NetworkRequest {
    init(id: Int) {
        super.init()
        self.path = "movie/\(id)"
    }
}

struct MovieDetailResponse: Decodable {
    let id: Int?
    let title: String?
    let adult: Bool?
    let backdropPath: String?
    let genreIds: [Int]?
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let popularity: String?
    let posterImagePath: String?
    let releaseDate: String?
    let video: Bool?
    let vote: Double?
    let voteCount: Int?
    let budget: Int?
    let genres: [Genre]?
    let homepage: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case adult
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case popularity
        case posterImagePath = "poster_path"
        case releaseDate = "release_date"
        case video
        case vote = "vote_average"
        case voteCount = "vote_count"
        case budget
        case genres
        case homepage
    }
}

struct Genre: Decodable {
    let id: Int
    let name: String
}
