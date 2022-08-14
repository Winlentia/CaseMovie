//
//  MovieMockService.swift
//  CaseMovieTests
//
//  Created by Winlentia on 13.08.2022.
//

import Foundation
import Alamofire

class MovieMockService: MovieServiceProtocol {
    
    func getPopularMovies(pageId: Int, completion: @escaping (Result<MoviesResponse, AFError>) -> Void) {

        if pageId == 1 {
            let popularMovies: MoviesResponse = MoviesResponse.loadFromFile("PopularMoviesPage1")
            completion(.success(popularMovies))
        } else if pageId == 2 {
            let popularMovies: MoviesResponse = MoviesResponse.loadFromFile("PopularMoviesPage2")
            completion(.success(popularMovies))
        } else {
            completion(.failure(AFError.responseSerializationFailed(reason: .inputFileNil)))
        }
    }
    
    func getMovieDetail(id: Int, completion: @escaping (Result<MovieDetail, AFError>) -> Void) {
        if id == 361743 {
            let movieDetail: MovieDetail = MovieDetail.loadFromJsonString(string: TestConstants.MockStrings.movieDetail)
            completion(.success(movieDetail))
        } else {
           completion(.failure(AFError.responseSerializationFailed(reason: .inputFileNil)))
                    
        }
    }
    
    
}
