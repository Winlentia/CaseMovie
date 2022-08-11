//
//  MainViewModel.swift
//  CaseMovie
//
//  Created by Winlentia on 11.08.2022.
//

import Foundation

class MainViewModel {
    private let movieService: MovieServiceProtocol
    
    private var currentPage = 1
    
    private var isPaginationCompleted: Bool = false
    
    var popularMovieData: [Movie] = []
    
    init(movieService: MovieServiceProtocol) {
        self.movieService = movieService
    }
    
    var reloadCompletion: (() -> Void)?
    
    func fetchMovies() {
        if isPaginationCompleted {
            return
        }
        movieService.getPopularMovies(pageId: currentPage) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                print(response)
                guard let popularMovies = response.results else { return }
                self.popularMovieData.append(contentsOf: popularMovies)
                if let totalPage = response.totalPages, totalPage > self.currentPage {
                    self.currentPage += 1
                } else {
                    self.isPaginationCompleted = true
                }
                self.reloadCompletion?()
            case .failure(let error):
                //TODO: handle failure
                print(error)
            }
        }
    }
    
}
