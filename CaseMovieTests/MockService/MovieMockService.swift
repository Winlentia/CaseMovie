//
//  MovieMockService.swift
//  CaseMovieTests
//
//  Created by Winlentia on 13.08.2022.
//

import Foundation
import Alamofire

class MovieMockService: MovieServiceProtocol {
    func getPopularMovies(pageId: Int, completion: @escaping (Result<PopularMoviesResponse, AFError>) -> Void) {
        //TODO:
    }
    
    func getMovieDetail(id: Int, completion: @escaping (Result<MovieDetailResponse, AFError>) -> Void) {
        if id == 361743 {
            let movieDetail: MovieDetailResponse = MovieDetailResponse.loadFromJsonString(string: TestConstants.MockStrings.movieDetail)
            completion(.success(movieDetail))
        } else {
           completion(.failure(AFError.responseSerializationFailed(reason: .inputFileNil)))
                    
        }
    }
    
    
}
