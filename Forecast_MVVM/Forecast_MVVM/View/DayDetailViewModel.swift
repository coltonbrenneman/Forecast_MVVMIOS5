//
//  DayDetailViewModel.swift
//  Forecast_MVVM
//
//  Created by Colton Brenneman on 6/27/23.
//

import Foundation

protocol DayDetailViewDelegate: DayDetailsViewController {
    func updateViews()
}

class DayDetailViewModel {
    
    // MARK: - Properties
    var forcastData: TopLevelDictionary?
    var days: [Day] { // Needs a `type` when using a computed property
        self.forcastData?.days ?? [] // We're referring to the var days on the line above and this is where we're using the value of an empty array if days is nil.
    } // End of var days
    weak var delegate: DayDetailViewDelegate?
    private let networkingController: NetworkingContoller
    init(delegate: DayDetailViewDelegate, networkController: NetworkingContoller = NetworkingContoller()) {
        self.delegate = delegate
        self.networkingController = networkController
        fetchForcastData()
    }
    
    // MARK: - Functions
    func fetchForcastData() {
        NetworkingContoller.fetchDays { result in
            switch result {
            case .success(let day):
                self.forcastData = day
                self.delegate?.updateViews()
            case .failure(let error):
                print(error.errorDescription!)
            }
        }
    }
    
    
} // End of class
