//
//  NetworkRequest.swift
//  CaseMovie
//
//  Created by Winlentia on 11.08.2022.
//

import Foundation
import Alamofire

class NetworkRequest: URLRequestConvertible {

    private let baseURL: String = AppConstants.Networking.baseUrl
    var path: String = ""
    var method: HTTPMethod = .get
    var parameters: Codable?
    var blocks: Bool = true

    func asURLRequest() throws -> URLRequest {
        let requestUrl = baseURL + path
        guard let url = URL(string: requestUrl) else { throw AFError.invalidURL(url: requestUrl) }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(AppConstants.Config.movieToken, forHTTPHeaderField: "Authorization")

        if let parameters = parameters {
            do {
                request.httpBody = try parameters.jsonData()
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }

        return request
    }
}
