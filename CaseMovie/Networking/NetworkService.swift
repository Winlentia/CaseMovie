//
//  NetworkManager.swift
//  CaseMovie
//
//  Created by Winlentia on 11.08.2022.
//

import Foundation
import Alamofire

class NetworkService {
    func performRequest<T:Decodable>(request: NetworkRequest, completion:@escaping (Result<T,AFError>) -> Void) {
        if request.blocks {
            // start loading
        }
        
        AF.request(request)
            .responseDecodable (decoder: SnakeCaseJSONDecoder()) { (response: DataResponse<T, AFError>) in
                completion(response.result)
                if request.blocks {
                    // stop loading
                }
            }
        
    }
}

final class SnakeCaseJSONDecoder: JSONDecoder {
    override init() {
        super.init()
        super.keyDecodingStrategy = .convertFromSnakeCase
    }
}
