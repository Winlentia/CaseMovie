//
//  SearchMovieRequest.swift
//  CaseMovie
//
//  Created by Winlentia on 13.08.2022.
//

import Foundation

class SearchMovieRequest: NetworkRequest {
    init(query: String) {
        super.init()
        self.path = "search/movie?query=\(query)"
    }
    
}
