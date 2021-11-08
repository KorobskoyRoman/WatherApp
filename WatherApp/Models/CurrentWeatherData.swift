//
//  CurrendWeatherData.swift
//  WatherApp
//
//  Created by Roman Korobskoy on 08.11.2021.
//

import Foundation

struct CurrentWeatherData: Codable {
    let name: String
    let main: Main
    let wind: Wind
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
    let feels_like: Double
}

struct Wind: Codable {
    let speed: Double
}

struct Weather: Codable {
    let id: Int
}
