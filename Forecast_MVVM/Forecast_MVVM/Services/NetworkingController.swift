//
//  NetworkingController.swift
//  Forecast_MVVM
//
//  Created by Karl Pfister on 2/13/22.
//

import Foundation

class NetworkingContoller {
    private static let baseURLString = "https://api.weatherbit.io"
    
    static func fetchDays(with endpoint: CityEndpoint, completion: @escaping (Result<TopLevelDictionary, NetworkError>) -> Void){
        guard let finalURL = endpoint.finalURL else { completion(.failure(.invalidURL)) ; return }
        let request = URLRequest(url: finalURL)
        print(request)
        
        APIService().perform(request) { result in
            switch result {
            case .success(let data):
                do {
                    let topLevelDictionary = try JSONDecoder().decode(TopLevelDictionary.self, from: data)
                    completion(.success(topLevelDictionary))
                } catch {
                    completion(.failure(.unableToDecode))
                }
            case .failure(_):
                completion(.failure(.noData))
            }
        }
    } // End of fetchDays
} // End of class
