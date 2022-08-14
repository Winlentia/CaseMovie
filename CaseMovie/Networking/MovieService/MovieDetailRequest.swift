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




