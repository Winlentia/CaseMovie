//
//  PersonMockService.swift
//  CaseMovieTests
//
//  Created by Winlentia on 14.08.2022.
//

import Foundation
import Alamofire

class PersonMockService: PersonServiceProtocol {
    
    func getPersonDetail(id: Int, completion:@escaping (Result<PersonDetail, AFError>) -> Void) {
        if id == 117640 {
            let personDetail: PersonDetail = PersonDetail.loadFromFile("personDetail")
            completion(.success(personDetail))
        } else {
            completion(.failure(AFError.responseSerializationFailed(reason: .inputFileNil)))
        }
    }
    
}
