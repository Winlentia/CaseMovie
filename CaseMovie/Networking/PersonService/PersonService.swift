//
//  PersonService.swift
//  CaseMovie
//
//  Created by Winlentia on 14.08.2022.
//

import Foundation
import Alamofire

protocol PersonServiceProtocol {
    func getPersonDetail(id: Int, completion:@escaping (Result<PersonDetail, AFError>) -> Void)
}

class PersonService: NetworkService, PersonServiceProtocol {
    func getPersonDetail(id: Int, completion: @escaping (Result<PersonDetail, AFError>) -> Void) {
        self.performRequest(request: PersonDetailRequest(id: id)) { result in
            completion(result)
        }
    }
    
}
