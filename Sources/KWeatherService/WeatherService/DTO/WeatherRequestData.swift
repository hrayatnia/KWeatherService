import Foundation

public enum WeatherUnitSystem: String, Codable, Sendable {
    case metric = "metric"
    case imperial = "imperial"
}

public enum WeatherFields: String, Codable, Sendable {
    case temperature = "temperature"
    case weatherCode = "weatherCode"
    case sunrise = "sunriseTime"
    case sunset = "sunsetTime"
}

public enum WeatherRequestTimestamps:String, Codable, Sendable {
    case oneHour = "1h"
    case oneDay = "1d"
    case oneWeek = "1w"
}


public struct WeatherRequestData: Encodable, Sendable {
    let location: String
    let fields: [WeatherFields]
    let unit: WeatherUnitSystem
    let timesteps: [WeatherRequestTimestamps]
    let startTime: String
    let endTime: String
    
}
