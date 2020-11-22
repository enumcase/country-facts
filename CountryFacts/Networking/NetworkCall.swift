//
//  NetworkCall.swift
//  CountryFacts
//
//  Created by Margulan Daribayev on 17.11.2020.
//

import Foundation

func fetchCountries(completion: @escaping(Result<[Country], CountryError>) -> Void) {
    let endpoint = "https://restcountries.eu/rest/v2/all"
    guard let url = URL(string: endpoint) else {
        print(completion(.failure(.invalidURL)))
        return
    }
    
    let dataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
        guard let data = data, error == nil else {
            print(completion(.failure(.unavailableData)))
            return
        }
        
        do {
            let countries = try JSONDecoder().decode([Country].self, from: data)
            completion(.success(countries))
        } catch {
            print(completion(.failure(.cannotProcessData)))
        }
    }
    
    dataTask.resume()
}
