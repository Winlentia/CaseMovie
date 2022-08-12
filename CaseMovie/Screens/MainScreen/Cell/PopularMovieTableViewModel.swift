//
//  PopularMovieTableViewModel.swift
//  CaseMovie
//
//  Created by Winlentia on 11.08.2022.
//

import Foundation

class PopularMovieTableViewModel {
    let movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    var title: String {
        movie.title ?? ""
    }
    
    var imageUrl: String {
        let imagePath = movie.posterPath ?? ""
        return "https://image.tmdb.org/t/p/w200/\(imagePath)"
    }
    
    var releaseDate: String {
        if let releaseDate = movie.releaseDate {
            return "Release Date: \(releaseDate)"
        } else {
            return ""
        }
    }
    
    var scoreLabel: String {
        if let vote = movie.voteAverage {
            return "⭐️ \(vote)"
        } else {
            return ""
        }
    }
}
