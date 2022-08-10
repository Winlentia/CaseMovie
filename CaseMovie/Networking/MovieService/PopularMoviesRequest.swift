//
//  PopularMoviesRequest.swift
//  CaseMovie
//
//  Created by Winlentia on 11.08.2022.
//

import Foundation

final class PopularMoviesRequest: NetworkRequest {
    init(page: Int) {
        super.init()
        self.path = "movie/popular?page=\(page)"
    }
}

struct PopularMoviesResponse: Decodable {
    let page: Int?
    let results: [Movie]?
    let totalPages: Int?
    let totalResults: Int?

    private enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct Movie: Decodable {
    let id: Int?
    let title: String?
    let adult: Bool?
    let backdropPath: String?
    let genreIds: [Int]?
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let popularity: Double?
    let posterImagePath: String?
    let releaseDate: String?
    let video: Bool?
    let vote: Double?
    let voteCount: Int?
    
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
    }
}

