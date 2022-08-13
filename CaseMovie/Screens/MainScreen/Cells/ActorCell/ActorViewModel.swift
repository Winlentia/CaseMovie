//
//  ActorViewModel.swift
//  CaseMovie
//
//  Created by Winlentia on 13.08.2022.
//

import Foundation

struct ActorViewModel {
    let actor: Actor
    let seperatorString = " | "
    
    init(actor: Actor){
        self.actor = actor
    }
    
    var title: String {
        actor.name ?? ""
    }
    
    var popularJobs: String {
        var popularJobs: String = ""
        if let knownMovies = actor.knownFor {
            
            for (indx,movie) in knownMovies.enumerated() {
                guard let title = movie.title else { break }
                if indx == knownMovies.count - 1 {
                    popularJobs = popularJobs + title
                    break
                }
                popularJobs = popularJobs + title + seperatorString
            }
        }
        return popularJobs
    }
}
