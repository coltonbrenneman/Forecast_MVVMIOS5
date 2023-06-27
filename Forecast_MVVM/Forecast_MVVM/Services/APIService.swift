//
//  APIService.swift
//  Forecast_MVVM
//
//  Created by Colton Brenneman on 6/27/23.
//

import Foundation

struct APIService {
    
    func perform(_ request: URLRequest, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(.thrownError(error)))
            }
            if let response = response as? HTTPURLResponse {
                print("\(response.statusCode)")
            }
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            completion(.success(data))
        }.resume()
    }
}

/*
 URLSession.shared.dataTask(with: finalURL) { dayData, _, error in
     if let error = error {
         print("There was an error fetching the data. The url is \(finalURL), the error is \(error.localizedDescription)")
         completion(.failure(.invalidURL))
     }
     
     guard let data = dayData else {
         print("There was an error recieveing the data!")
         completion(.failure(.unableToDecode))
         return
     }
     
     do {
         let topLevelDictionary = try JSONDecoder().decode(TopLevelDictionary.self, from: data)
         completion(.success(topLevelDictionary))
     } catch {
         print("Error in Do/Try/Catch: \(error.localizedDescription)")
         completion(.failure(.unableToDecode))
     }
 }.resume()
 */
