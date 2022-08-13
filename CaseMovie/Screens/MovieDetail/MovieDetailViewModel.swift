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
        
        if let releaseDate = Date().from(string: movieData?.releaseDate ?? "") {
            subTitle = subTitle + releaseDate.getYear() + seperatorString
        }
        
        if let duration = movieData?.runtime {
            let durationTuple = minutesToHoursAndMinutes(duration)
             subTitle = subTitle + "\(durationTuple.hours)h \(durationTuple.leftMinutes)m" + seperatorString
        }
        
        if let genres = movieData?.genres {
            for (indx,genre) in genres.enumerated() {
                if indx == genres.count - 1 {
                    subTitle = subTitle + genre.name
                    break
                }
                subTitle = subTitle + genre.name + ", "
            }
        }
        return subTitle
    }
    
    var scoreAndBudget: String {
        var scoreAndBudget: String = ""
        
        if let vote = movieData?.voteAverage, let voteCount = movieData?.voteCount {
            scoreAndBudget = scoreAndBudget + "⭐️ \(vote) (\(voteCount))"
        }
        
        if let budget = movieData?.budget, budget != 0 {
            scoreAndBudget = scoreAndBudget + seperatorString + "💵 \(budget)"
        }
        
        return scoreAndBudget
    }
    
    
    var imageUrl: String {
        let imagePath = movieData?.posterPath ?? ""
        return "https://image.tmdb.org/t/p/w500\(imagePath)"
    }
    
    private func minutesToHoursAndMinutes(_ minutes: Int) -> (hours: Int , leftMinutes: Int) {
        return (minutes / 60, (minutes % 60))
    }
}
