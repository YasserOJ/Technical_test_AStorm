//
//  AddCityViewController.swift
//  technicalTestAStorm
//
//  Created by Yasser Omar Jammeli on 23/8/2022.
//

import UIKit
import CoreLocation

class AddCityViewController: UIViewController {
    
    @IBOutlet weak var cityNameTextField: UITextField!
    
    let viewModel = AddCityViewModel()
    var didAddCityWithSuccess: () -> Void = {}
    var didTookMyLocation = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = SharedLocalizedString.addCityTitle.localized
        
        initViewModel()
    }
    
    func initViewModel()  {
        viewModel.didAddLocationWithSuccess = { [unowned self] in
            self.pop()
            self.didAddCityWithSuccess()
        }
        
        viewModel.didFailedCityAdd = { [unowned self] wsError in
        }
    }
    
    @IBAction func addCity(_ sender: Any) {
        if let text = cityNameTextField.text, !text.isEmpty {
            viewModel.getCityWeather(cityName: text)
        } else {
            
        }
    }
    
    @IBAction func addMyLocation(_ sender: Any) {
        let locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.requestLocation()
            locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension AddCityViewController : CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if !didTookMyLocation {
            if let location = locations.first {
                print(location.coordinate)
                self.viewModel.getCityWithMyLocaion(location : location)
                didTookMyLocation = true
            }
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
