//
//  ViewController+AlertController.swift
//  WatherApp
//
//  Created by Roman Korobskoy on 08.11.2021.
//

import UIKit

extension ViewController {
    func presentSearchController(withTitle title: String?,
                                 message: String?,
                                 style: UIAlertController.Style,
                                 completionHandler: @escaping (String) -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        alert.addTextField { textField in
            let cities = ["Москва", "Санкт-Петербург", "Токио", "Торронто", "Осака"]
            textField.placeholder = cities.randomElement()
        }
        let search = UIAlertAction(title: "Поиск", style: .default) { action in
            let textField = alert.textFields?.first
            guard let cityName = textField?.text else { return }
            if cityName != "" {
//                self.networkManager.fetchCurrentWeather(forCity: cityName)
                let city = cityName.split(separator: " ").joined(separator: "%20") //добавляем пробел в название города с помощью массива
                completionHandler(city)
            }
        }
        let cancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        alert.addAction(search)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }
}
