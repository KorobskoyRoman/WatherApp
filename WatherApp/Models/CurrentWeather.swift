//
//  CurrentWeather.swift
//  WatherApp
//
//  Created by Roman Korobskoy on 08.11.2021.
//
// модель для обновления лейблов

import Foundation

struct CurrentWeather {
    let cityName: String
    let temperature: Double
    var temperatureString: String { //возвращаем строку для лейбла
        return String(format: "%.1f", temperature)
    }
    
    let feelsLikeTemperature: Double
    var feelsLikeTemperatureString: String {
        return String(format: "%.1f", feelsLikeTemperature)
    }
    
    let conditionCode: Int // aka id
    var systemIconNameString: String {
        switch conditionCode {
        case 200...232: return  "cloud.bolt.rain.fill"
        case 300...321: return "cloud.drizzle.fill"
        case 500...531: return "cloud.rain.fill"
        case 600...622: return "cloud.snow.fill"
        case 701...781: return "smoke.fill"
        case 800: return "sun.max.fill"
        case 801...804: return "cloud.fill"
        default: return "nosign"
        }
    }
    
    let windSpeed: Double
    var windSpeedString: String {
        return "\(windSpeed.rounded())"
    }
    
    init?(currentWeatherData: CurrentWeatherData) {
        cityName = currentWeatherData.name
        temperature = currentWeatherData.main.temp
        feelsLikeTemperature = currentWeatherData.main.feels_like
        conditionCode = currentWeatherData.weather.first!.id
        windSpeed = currentWeatherData.wind.speed
    }
}
