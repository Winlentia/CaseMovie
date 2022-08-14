//
//  PersonDetailViewModel.swift
//  CaseMovie
//
//  Created by Winlentia on 14.08.2022.
//

import Foundation

class PersonDetailViewModel {
    let personId: Int
    let service: PersonServiceProtocol
    var personData: PersonDetail?
    var updateUI: (() -> Void)?
    
    init(personId: Int, service: PersonServiceProtocol = PersonService()){
        self.service = service
        self.personId = personId
        fetchPersonDetail()
    }
    
    func fetchPersonDetail() {
        service.getPersonDetail(id: personId) {[weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let result):
                self.personData = result
                self.updateUI?()
            case .failure(let err):
                print(err)
            }
            
        }
    }
    
    var navigationTitle: String {
        personData?.name ?? "Person"
    }
    
    var title: String {
        personData?.name ?? ""
    }
    
    var subTitle: String {
        "TODOOOOOO"
    }
    
    var biography: String {
        personData?.biography ?? ""
    }
    
    var profileImageUrl: String {
        let imagePath = personData?.profilePath ?? ""
        return "https://image.tmdb.org/t/p/w500\(imagePath)"
    }
    
    
}
