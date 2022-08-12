//
//  MovieDetailViewModel.swift
//  CaseMovie
//
//  Created by Winlentia on 12.08.2022.
//

import Foundation

class MovieDetailViewModel {
    
    let movieId: Int
    let service: MovieServiceProtocol
    var movieData: MovieDetailResponse?
    
    init(movieId: Int, service: MovieServiceProtocol = MovieService()){
        self.service = service
        self.movieId = movieId
        fetchMovieDetail()
    }
    
    var updateUI: (() -> Void)?
    
    func fetchMovieDetail() {
        service.getMovieDetail(id: movieId) { result in
            switch result {
            case .success(let response):
                self.movieData = response
                self.updateUI?()
            case .failure(let error):
                //TODO: handle error
                print(error)
            }
        }
    }
    
    var navigationTitle: String {
        movieData?.title ?? ""
    }
    
    var title: String {
        movieData?.originalTitle ?? ""
    }
    
    var imageUrl: String {
        let imagePath = movieData?.posterPath ?? ""
        return "https://image.tmdb.org/t/p/w500\(imagePath)"
    }
    
}
