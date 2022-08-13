//
//  MainViewModel.swift
//  CaseMovie
//
//  Created by Winlentia on 11.08.2022.
//

import Foundation

class MainViewModel {
    private let movieService: MovieServiceProtocol
    
    private let searchService: SearchServiceProtocol
    
    private var currentPage = 1
    
    private var isPaginationCompleted: Bool = false
    
    var popularMovieData: [Movie] = []
    
    init(movieService: MovieServiceProtocol = MovieService(), searchService: SearchServiceProtocol = SearchService()){
        self.movieService = movieService
        self.searchService = searchService
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
    
    func search(query: String){
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        searchService.searchMovies(query: query.getSearchQuery()) { result in
            switch result {
            case .success(let response):
                dispatchGroup.leave()
                print(response)
                print("Winlentia movieSearch Complete")
            case .failure(let error):
                dispatchGroup.leave()
                print(error)
            }
        }
        
        dispatchGroup.enter()
        searchService.searchActors(query: query.getSearchQuery()) { result in
            switch result {
            case .success(let response):
                dispatchGroup.leave()
                print(response)
                print("Winlentia actors Complete")
            case .failure(let error):
                dispatchGroup.leave()
                print(error)
            }
        }
        dispatchGroup.notify(queue: .main) {
            print("Winlentia Notify")
            self.reloadCompletion?()
        }
    }
    
}
