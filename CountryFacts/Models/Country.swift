//
//  Country.swift
//  CountryFacts
//
//  Created by Margulan Daribayev on 17.11.2020.
//

import Foundation

struct Country: Codable {
    var name: String
    var alpha2Code: String
    var capital: String
    var region: String
    var population: Int
    var currencies: [Currency]
}

extension Country {
    var flagEmoji: String {
        let base = 127397
        var flagScalarView = String.UnicodeScalarView()
        for i in alpha2Code.utf16 {
            if let scalar = UnicodeScalar(base + Int(i)) {
                flagScalarView.append(scalar)
            }
        }
        return String(flagScalarView)
    }
}
