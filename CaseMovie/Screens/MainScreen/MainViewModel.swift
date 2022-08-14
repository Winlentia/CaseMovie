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
    var searchData = SearchResult()
    
    var searchQuery: String = ""
    
    init(movieService: MovieServiceProtocol = MovieService(), searchService: SearchServiceProtocol = SearchService()){
        self.movieService = movieService
        self.searchService = searchService
    }
    
    var reloadCompletion: (() -> Void)?
    
    var isSearchActive: Bool {
        !searchQuery.isEmpty
    }
    
}

//MARK: TableView
extension MainViewModel {
    func numberOfSections() -> Int {
        if isSearchActive {
            return searchData.numberOfSections()
        } else {
            return 1
        }
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        if isSearchActive {
            return searchData.numberOfRowsInSection(section: section)
        } else {
            return popularMovieData.count
        }
    }
}

//MARK: Service
extension MainViewModel {
    func fetchMovies() {
        if isPaginationCompleted || isSearchActive {
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
        searchQuery = query.getSearchQuery()
        
        if searchQuery.isEmpty {
            self.reloadCompletion?()
            return
        }
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        searchService.searchMovies(query: searchQuery) {[weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                dispatchGroup.leave()
                if let movies = response.results {
                    self.searchData.movieResults = movies
                }
            case .failure(let error):
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.enter()
        searchService.searchPersons(query: searchQuery) {[weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                dispatchGroup.leave()
                if let persons = response.results {
                    self.searchData.personResults = persons
                }
            case .failure(let error):
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            self.reloadCompletion?()
        }
    }
}

class SearchResult {
    var results: [SearchSectionType] = []
    var movieResults: [Movie] = [] {
        didSet {
            reloadSearchResults()
        }
    }
    var personResults: [Person] = [] {
        didSet {
            reloadSearchResults()
        }
    }
    
    private func reloadSearchResults() {
        results.removeAll()
        if !movieResults.isEmpty {
            results.append(.Movie)
        }
        if !personResults.isEmpty {
            results.append(.Person)
        }
    }

    func numberOfSections() -> Int {
        return results.count
    }
    
    func numberOfRowsInSection(section: Int) -> Int{
        switch results[section]{
        case.Movie:
            return movieResults.count
        case .Person:
            return personResults.count
        }
    }
}

enum SearchSectionType {
    case Movie
    case Person
}

