//
//  WeatherOverViewViewController.swift
//  technicalTestAStorm
//
//  Created by Yasser Omar Jammeli on 23/8/2022.
//

import UIKit

class WeatherOverViewViewController: UIViewController {
    
    let viewModel = WeatherOverViewViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noCitiesLabel: UILabel!
    
    fileprivate func checkCitiesCount() {
        if viewModel.hasCities {
            noCitiesLabel.isHidden = true
        } else {
            noCitiesLabel.isHidden = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.title = "Your cities"
        let btn1 = UIButton(type: .custom)
        btn1.setImage(UIImage(named: "addIcon"), for: .normal)
        btn1.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        btn1.addTarget(self, action: #selector(self.goToAddCity), for: .touchUpInside)
        let item1 = UIBarButtonItem(customView: btn1)
        self.navigationItem.setRightBarButtonItems([item1], animated: true)
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerCellNib(CityWeatherTableViewCell.self)
        
        checkCitiesCount()
    }
    
    @objc func goToAddCity() {
        let addCityViewController = AddCityViewController.instantiate(appStoryboardName: "AddCityViewControllerStoryBoard") as! AddCityViewController
        addCityViewController.didAddCityWithSuccess = { [unowned self] in
            self.checkCitiesCount()
            self.tableView.reloadData()
        }
        self.push(viewController: addCityViewController, animated: true)
        
    }
    
}

extension WeatherOverViewViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.citiesWeather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityWeatherTableViewCell") as! CityWeatherTableViewCell
        let  cityWeather = viewModel.citiesWeather[indexPath.row]
        cell.cityWeather = cityWeather
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cityWeatherDetailViewController = CityWeatherDetailViewController.instantiate(appStoryboardName: "CityWeatherDetail") as! CityWeatherDetailViewController
        cityWeatherDetailViewController.viewModel.cityWeather = viewModel.citiesWeather[indexPath.row]
        self.push(viewController: cityWeatherDetailViewController, animated: true)
    }
}
