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
    func searchPersons(query: String, completion:@escaping (Result<SearchPersonResponse,AFError>) -> Void)
}

class SearchService: NetworkService, SearchServiceProtocol {
    func searchMovies(query: String, completion: @escaping (Result<MoviesResponse, AFError>) -> Void) {
        self.performRequest(request: SearchMovieRequest(query: query)) { result in
            completion(result)
        }
    }
    
    func searchPersons(query: String, completion: @escaping (Result<SearchPersonResponse, AFError>) -> Void) {
        self.performRequest(request: SearchActorRequest(query: query)) { result in
            completion(result)
        }
    }
    

    
}
