//
//  ActorViewModel.swift
//  CaseMovie
//
//  Created by Winlentia on 13.08.2022.
//

import Foundation

struct PersonTableViewModel {
    private let person: Person
    private let seperatorString = " | "
    
    init(actor: Person){
        self.person = actor
    }
    
    var title: String {
        person.name ?? ""
    }
    
    var popularJobs: String {
        var popularJobs: String = ""
        if let knownMovies = person.knownFor {
            
            for (indx,movie) in knownMovies.enumerated() {
                guard let title = movie.title, !title.isEmpty else { continue }
                if indx == knownMovies.count - 1 {
                    popularJobs = popularJobs + title
                    break
                }
                popularJobs = popularJobs + title + seperatorString
            }
        }
        return popularJobs
    }
    
    var imageUrl: String {
        let imagePath = person.profilePath ?? ""
        return "https://image.tmdb.org/t/p/w200/\(imagePath)"
    }
}
