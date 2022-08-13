//
//  SearchService.swift
//  CaseMovie
//
//  Created by Winlentia on 13.08.2022.
//

import Foundation
import Alamofire

protocol SearchServiceProtocol {
    func searchMovies(query: String, completion:@escaping (Result<MoviesResponse,AFError>) -> Void)
    func searchActors(query: String, completion:@escaping (Result<SearchActorResponse,AFError>) -> Void)
}

class SearchService: NetworkService, SearchServiceProtocol {
    func searchMovies(query: String, completion: @escaping (Result<MoviesResponse, AFError>) -> Void) {
        self.performRequest(request: SearchMovieRequest(query: query)) { result in
            completion(result)
        }
    }
    
    func searchActors(query: String, completion: @escaping (Result<SearchActorResponse, AFError>) -> Void) {
        self.performRequest(request: SearchActorRequest(query: query)) { result in
            completion(result)
        }
    }
    

    
}
