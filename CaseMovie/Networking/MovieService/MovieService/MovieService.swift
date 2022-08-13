//
//  MovieService.swift
//  CaseMovie
//
//  Created by Winlentia on 11.08.2022.
//

import Foundation
import Alamofire

protocol MovieServiceProtocol {
    func getPopularMovies(pageId: Int, completion:@escaping (Result<MoviesResponse,AFError>) -> Void)
    func getMovieDetail(id: Int, completion:@escaping (Result<MovieDetailResponse,AFError>) -> Void)
}

final class MovieService: NetworkService, MovieServiceProtocol {
    func getMovieDetail(id: Int, completion: @escaping (Result<MovieDetailResponse, AFError>) -> Void) {
        self.performRequest(request: MovieDetailRequest(id: id)) { result in
            completion(result)
        }
    }
    
    func getPopularMovies(pageId: Int, completion: @escaping (Result<MoviesResponse, AFError>) -> Void) {
        self.performRequest(request: PopularMoviesRequest(page: pageId)) { result in
            completion(result)
        }
    }
    
    
}
