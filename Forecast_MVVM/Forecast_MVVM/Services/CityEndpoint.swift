//
//  CityEndpoint.swift
//  Forecast_MVVM
//
//  Created by Colton Brenneman on 6/27/23.
//

import Foundation

enum CityEndpoint {
    case city(String)
    
    var finalURL: URL? {
        guard let baseURL = URL(string: "https://api.weatherbit.io") else { return nil }
        var urlRequest = URLRequest(url: baseURL)
        
        switch self {
        case .city(let city):
            urlRequest.url?.append(path: "v2.0/forecast/daily")
            let apiQuery = URLQueryItem(name: "key", value: "66b860501a054c83b086019d99e0f316")
            let cityQuery = URLQueryItem(name: "city", value: city) // Make sure not to call put the value city in the name
            let unitsQuery = URLQueryItem(name: "units", value: "I")
            urlRequest.url?.append(queryItems: [apiQuery, cityQuery, unitsQuery])
            return urlRequest.url
        }
    } // End of finalURL
} // End of enum

/*
 https://api.weatherbit.io/v2.0/forecast/daily?city=St George, UT&key=66b860501a054c83b086019d99e0f316&units=I
 private static let baseURLString = "https://api.weatherbit.io"
 guard let baseURL = URL(string:baseURLString) else {return}


 var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
 urlComponents?.path = "/v2.0/forecast/daily"
 
 let apiQuery = URLQueryItem(name: "key", value: "8503276d5f49474f953722fa0a8e7ef8")
 let cityQuery = URLQueryItem(name: "city", value:"Salt Lake")
 let unitsQuery = URLQueryItem(name: "units", value: "I")
 urlComponents?.queryItems = [apiQuery,cityQuery,unitsQuery]
 
 guard let finalURL = urlComponents?.url else {return}
 print(finalURL)
 */
