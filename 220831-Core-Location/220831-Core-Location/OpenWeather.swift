//
//  WeatherModel.swift
//  220831-Core-Location
//
//  Created by minsson on 2022/08/31.
//

// MARK: - Welcome
struct OpenWeather: Codable {
    let weather: [Weather]
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}
