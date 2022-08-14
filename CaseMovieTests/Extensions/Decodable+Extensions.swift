//
//  Decodable+Extensions.swift
//  CaseMovieTests
//
//  Created by Winlentia on 13.08.2022.
//

import Foundation

extension Decodable {

    static func loadFromJsonString(string: String) -> Self {
        do {
            let jsonData = string.data(using: .utf8)!
            return try SnakeCaseJSONDecoder().decode(Self.self, from: jsonData)
        } catch {
            fatalError("error = \(error)")
        }
    }
    
    static func loadFromFile(_ filename: String) -> Self {
        do {
            let path = Bundle(for: CaseMovieTests.self).path(forResource: filename, ofType: ".json")!
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            return try SnakeCaseJSONDecoder().decode(Self.self, from: data)
        } catch {
            fatalError("Error: \(error)")
        }
    }
}
