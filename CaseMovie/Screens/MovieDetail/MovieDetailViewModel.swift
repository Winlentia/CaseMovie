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
    var movieData: MovieDetail?
    
    init(movieId: Int, service: MovieServiceProtocol = MovieService()) {
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
                // TODO: handle error
                print("Function: \(#function), line: \(#line), error: \(error)")
            }
        }
    }
    private let seperatorString = " | "
    
    var navigationTitle: String {
        movieData?.title ?? ""
    }
    
    var title: String {
        movieData?.originalTitle ?? ""
    }
    
    var description: String {
        movieData?.overview ?? ""
    }
    
    var subTitle: String {
        var subTitle: String = ""
        
        if let releaseDate = Date.from(string: movieData?.releaseDate ?? "") {
            subTitle += releaseDate.getYear() + seperatorString
        }
        
        if let duration = movieData?.runtime {
            let durationTuple = minutesToHoursAndMinutes(duration)
             subTitle += "\(durationTuple.hours)h \(durationTuple.leftMinutes)m" + seperatorString
        }
        
        if let genres = movieData?.genres {
            for (index, genre) in genres.enumerated() {
                if index == genres.count - 1 {
                    subTitle += genre.name
                    break
                }
                subTitle += genre.name + ", "
            }
        }
        return subTitle
    }
    
    var scoreAndBudget: String {
        var scoreAndBudget: String = ""
        
        if let vote = movieData?.voteAverage, let voteCount = movieData?.voteCount {
            scoreAndBudget += "⭐️ \(vote) (\(voteCount))"
        }
        
        if let budget = movieData?.budget, budget != 0 {
            scoreAndBudget += seperatorString + "💵 \(budget.formattedWithSeparator)"
        }
        
        return scoreAndBudget
    }
    
    var imageUrl: String {
        let imagePath = movieData?.posterPath ?? ""
        return "https://image.tmdb.org/t/p/w500\(imagePath)"
    }
    
    var isImdbButtonHidden: Bool {
        imdbUrl != nil ? false : true
    }
    
    var imdbUrl: String? {
        if let imdbId = movieData?.imdbId {
            return "https://www.imdb.com/title/\(imdbId)/"
        }
        return nil
    }
    
    private func minutesToHoursAndMinutes(_ minutes: Int) -> (hours: Int, leftMinutes: Int) {
        return (minutes / 60, (minutes % 60))
    }
}
