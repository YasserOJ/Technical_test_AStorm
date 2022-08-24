//
//  CityWeatherDetailViewController.swift
//  technicalTestAStorm
//
//  Created by Yasser Omar Jammeli on 23/8/2022.
//

import UIKit

class CityWeatherDetailViewController: UIViewController {
    
    let viewModel = CityWeatherDetailViewModel()
    
    @IBOutlet weak var weatherDescriptionUIImageview: UIImageView!
    @IBOutlet weak var temptureLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = viewModel.cityWeather?.name
        
        setUpUIData()
    }

    func setUpUIData()  {
        weatherDescriptionUIImageview.image = UIImage(named: viewModel.cityWeather?.weather?[0].icon ?? "")
        temptureLabel.text = "\(viewModel.cityWeather?.main?.temp  ?? 0)"
        feelsLikeLabel.text = "\(viewModel.cityWeather?.main?.feelsLike  ?? 0)"
        minTempLabel.text = "\(viewModel.cityWeather?.main?.tempMin  ?? 0)"
        maxTempLabel.text = "\(viewModel.cityWeather?.main?.tempMax  ?? 0)"
        descriptionLabel.text = viewModel.cityWeather?.weather?[0].weatherDescription
        humidityLabel.text = "\(viewModel.cityWeather?.main?.humidity  ?? 0)"
        windLabel.text = "\(viewModel.cityWeather?.wind?.speed  ?? 0)"
    }
}
