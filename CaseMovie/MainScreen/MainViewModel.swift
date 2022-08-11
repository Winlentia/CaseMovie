//
//  MainViewModel.swift
//  CaseMovie
//
//  Created by Winlentia on 11.08.2022.
//

import Foundation

class MainViewModel {
    let movieService: MovieServiceProtocol
    
    var currentPage = 1
    
    var popularMovieData: [Movie] = []
    
    init(movieService: MovieServiceProtocol) {
        self.movieService = movieService
    }
    var reloadCompletion: (() -> Void)?
    
    func fetchMovies() {
        movieService.getPopularMovies(pageId: currentPage) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                print(response)
                guard let popularMovies = response.results else { return }
                self.popularMovieData.append(contentsOf: popularMovies)
                self.reloadCompletion?()
            case .failure(let error):
                print(error)
            }
        }
    }
}
