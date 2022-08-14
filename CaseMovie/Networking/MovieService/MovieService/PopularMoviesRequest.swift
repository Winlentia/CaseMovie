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
        self.blocks = page == 1 ? true : false
    }
}

struct MoviesResponse: Codable {
    let page: Int?
    let results: [Movie]?
    let totalPages: Int?
    let totalResults: Int?

}


