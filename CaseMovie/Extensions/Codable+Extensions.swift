//
//  Codable+Extensions.swift
//  PreparedApp
//
//  Created by Winlentia on 11.08.2022.
//

import Foundation

extension Encodable {
    func jsonData() throws -> Data {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        encoder.dateEncodingStrategy = .iso8601
        return try encoder.encode(self)
    }
}
