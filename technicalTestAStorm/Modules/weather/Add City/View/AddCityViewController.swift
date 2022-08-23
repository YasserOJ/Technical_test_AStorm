//
//  AddCityViewController.swift
//  technicalTestAStorm
//
//  Created by Yasser Omar Jammeli on 23/8/2022.
//

import UIKit

class AddCityViewController: UIViewController {

    @IBOutlet weak var cityNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addCity(_ sender: Any) {
        WeatherApiManager().addLocation(cityName: cityNameTextField.text ?? "") { weather in
            switch weather {
                
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error)
            }
            print(weather)
        }
    }
    
    @IBAction func addMyLocation(_ sender: Any) {
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
