//
//  DayDetailsViewController.swift
//  Forecast_MVVM
//
//  Created by Karl Pfister on 2/13/22.
//

import UIKit

class DayDetailsViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var dayForcastTableView: UITableView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var currentHighLabel: UILabel!
    @IBOutlet weak var currentLowLabel: UILabel!
    @IBOutlet weak var currentDescriptionLabel: UILabel!
    
    //MARK: - Properties
    var viewModel: DayDetailViewModel!
    
    //MARK: - View Lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Conform to the TBVS Protocols
        dayForcastTableView.delegate = self
        dayForcastTableView.dataSource = self
        viewModel = DayDetailViewModel(delegate: self) // DON'T FORGET THIS AGAIN COLTON THIS IS WHY YOU'RE APP KEPT FAILING
        // 32 - 46 is being done my viewModel
//        NetworkingContoller.fetchDays { result in
//
//            switch result {
//            case .success(let forcastData):
//                self.forcastData = forcastData
//                self.days = forcastData.days
//                DispatchQueue.main.async {
//                    self.updateViews()
//                    self.dayForcastTableView.reloadData()
//                }
//            case .failure(let error):
//                print("Error fetching the data!", error.errorDescription!)
//            }
//
//        }
    }
    
    // This is now being done via the delegate in my extension
//    func updateViews() {
//
//        let currentDay = days[0]
//        cityNameLabel.text = forcastData?.cityName ?? "No City Found"
//        currentDescriptionLabel.text = currentDay.weather.description
//        currentTempLabel.text = "\(currentDay.temp)F"
//        currentLowLabel.text = "\(currentDay.lowTemp)F"
//        currentHighLabel.text = "\(currentDay.highTemp)F"
//    }
} // End of class


//MARK: - Extenstions
extension DayDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.days.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "dayCell", for: indexPath) as? DayForcastTableViewCell else {return UITableViewCell()}
        let day = viewModel.days[indexPath.row]
        cell.updateViews(day: day)
        return cell
    }
}

extension DayDetailsViewController: DayDetailViewDelegate {
    func updateViews() {
        DispatchQueue.main.async {
            let currentDay = self.viewModel.days[0]
            self.cityNameLabel.text = self.viewModel.forcastData?.cityName ?? "No City Found"
            self.currentDescriptionLabel.text = currentDay.weather.description
            self.currentTempLabel.text = "\(currentDay.temp)F"
            self.currentLowLabel.text = "\(currentDay.lowTemp)F"
            self.currentHighLabel.text = "\(currentDay.highTemp)F"
            self.dayForcastTableView.reloadData()
        }
    }
}

