//
//  PersonDetailRequest.swift
//  CaseMovie
//
//  Created by Winlentia on 14.08.2022.
//

import Foundation

class PersonDetailRequest: NetworkRequest {
    init(id: Int) {
        super.init()
        self.path = "person/\(id)"
    }
}
