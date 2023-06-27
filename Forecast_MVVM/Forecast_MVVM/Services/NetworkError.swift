//
//  NetworkError.swift
//  Forecast_MVVM
//
//  Created by Colton Brenneman on 6/27/23.
//

import Foundation

enum NetworkError: LocalizedError {
    case invalidURL
    case thrownError(Error)
    case noData
    case unableToDecode
    case emptyArray
    case invalidStatusCode
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL. Check your endpoint bitch"
        case .thrownError(let error):
            return "Thrown error. Error was \(error.localizedDescription)"
        case .noData:
            return "No data received from successful network fetch hoe."
        case .unableToDecode:
            return "Unable to decode model object from data fucker."
        case .emptyArray:
            return "The fetch returned an empty array."
        case .invalidStatusCode:
            return "Fetch returned an unsuccessful status code. Code was not 200."
        }
    }
}

