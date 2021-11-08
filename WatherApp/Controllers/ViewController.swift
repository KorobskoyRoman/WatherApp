//
//  ViewController.swift
//  WatherApp
//
//  Created by Roman Korobskoy on 08.11.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    
    let networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkManager.fetchCurrentWeather(forCity: "London")
    }
    

    @IBAction func searchPressed(_ sender: UIButton) {
        presentSearchController(withTitle: "Введите город", message: nil, style: .alert) {city in
            self.networkManager.fetchCurrentWeather(forCity: city)
        }
    }
    
}

