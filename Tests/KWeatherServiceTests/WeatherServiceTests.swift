//
//  WeatherServiceTests.swift
//  KWeatherService
//
//  Created by Sam Rayatnia on 06.02.25.
//

import Testing
@testable import KWeatherService

@Suite("Weather Service Tests")
struct WeatherServiceTests {
    private let apiSetting: APISetting
    
    init () async throws {
        apiSetting  = APISetting(secretKey: "Ooboq8AD5JmwnkBpaVcr1Vy5PYewr0RI")
    }
    
    @Test
    func getTheWeather() async throws {
        let service:  WeatherService = .init(long: 42.3478,
                                           lat: -71.0466,
                                             query: apiSetting.secretKey,
                                           fields: .temperature, .weatherCode)
        let data = try await service.send()
        #expect(data.data.timelines.count > 0)
        
    }
}
