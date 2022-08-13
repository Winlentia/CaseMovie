//
//  String+Extensions.swift
//  CaseMovie
//
//  Created by Winlentia on 13.08.2022.
//

import Foundation

extension String {
    func getSearchQuery() -> String {
        return self.replacingOccurrences(of: " ", with: "+")
    }
}
