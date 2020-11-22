//
//  CountryError.swift
//  CountryFacts
//
//  Created by Margulan Daribayev on 18.11.2020.
//

import Foundation

enum CountryError: Error {
    case invalidURL
    case unavailableData
    case cannotProcessData
}
