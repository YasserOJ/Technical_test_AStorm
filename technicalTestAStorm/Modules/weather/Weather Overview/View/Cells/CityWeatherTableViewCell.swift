//
//  CityWeatherTableViewCell.swift
//  technicalTestAStorm
//
//  Created by Yasser Omar Jammeli on 24/8/2022.
//

import UIKit

class CityWeatherTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var conditionDescriptionLabel: UILabel!
    @IBOutlet weak var temptureLabel: UILabel!
    @IBOutlet weak var fellsLikeLabel: UILabel!
    @IBOutlet weak var conditionImageView: UIImageView!
    
    
    var cityWeather : WeatherResponseModel? {
        didSet {
            if let cityWeather = cityWeather {
                cityNameLabel.text = cityWeather.name
                temptureLabel.text = "\(cityWeather.main?.temp?.rounded() ?? 0)ºC"
                fellsLikeLabel.text = "Feels like \(cityWeather.main?.feelsLike?.rounded() ?? 0)"
                conditionDescriptionLabel.text = cityWeather.weather?[0].main
                conditionImageView.image = UIImage(named: cityWeather.weather?[0].icon ?? "")
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
