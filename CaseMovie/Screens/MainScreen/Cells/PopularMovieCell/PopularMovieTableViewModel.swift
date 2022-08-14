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
    
    var imageUrl: String? {
        if let imagePath = movie.posterPath {
            return "https://image.tmdb.org/t/p/w200\(imagePath)"
        } else {
            return nil
        }
    }
    
    var releaseDate: String {
        if let releaseDate = movie.releaseDate, let year = Date.from(string: releaseDate)?.getYear() {
            return "Release Date: \(year)"
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
