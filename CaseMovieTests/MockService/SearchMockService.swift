//
//  SearchMockService.swift
//  CaseMovieTests
//
//  Created by Winlentia on 14.08.2022.
//

import Foundation
import Alamofire

class SearchMockService: SearchServiceProtocol {
    func searchMovies(query: String, completion: @escaping (Result<MoviesResponse, AFError>) -> Void) {
        if query == "harry+po" {
            let moviesResponse: MoviesResponse = MoviesResponse.loadFromFile("searchMovieHarry+po")
            completion(.success(moviesResponse))
        } else {
            completion(.failure(AFError.responseSerializationFailed(reason: .inputFileNil)))
        }
    }
    
    func searchPersons(query: String, completion: @escaping (Result<SearchPersonResponse, AFError>) -> Void) {
        if query == "harry+po" {
            let peopleResponse: SearchPersonResponse = SearchPersonResponse.loadFromFile("searchPeopleHarry+po")
            completion(.success(peopleResponse))
        } else {
            completion(.failure(AFError.responseSerializationFailed(reason: .inputFileNil)))
        }
    }
    
    
}
