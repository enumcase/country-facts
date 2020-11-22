//
//  PrettyNumbers.swift
//  CountryFacts
//
//  Created by Margulan Daribayev on 17.11.2020.
//

import Foundation

extension Double {
    func reduceScale(to places: Int) -> Double {
        let multiplier = pow(10, Double(places))
        let newDecimal = multiplier * self
        let truncated = Double(Int(newDecimal))
        let originalDecimal = truncated / multiplier
        return originalDecimal
    }
}

extension Int {
    var formatted: String {
        switch self {
        case 1_000_000_000...:
            var formattedNum = Double(self) / 1_000_000_000
            formattedNum = formattedNum.reduceScale(to: 1)
            return "\(formattedNum)B"

        case 1_000_000...:
            var formattedNum = Double(self) / 1_000_000
            formattedNum = formattedNum.reduceScale(to: 1)
            return "\(formattedNum)M"

        case 1_000...:
            var formattedNum = Double(self) / 1_000
            formattedNum = formattedNum.reduceScale(to: 1)
            return "\(formattedNum)K"

        default:
            return "\(self)"
        }
    }
}
