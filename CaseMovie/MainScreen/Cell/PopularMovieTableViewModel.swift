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
}
