import Foundation

public enum WeatherUnitSystem: String {
    case metric = "metric"
    case imperial = "imperial"
}

public enum WeatherFields: String {
    case temperature = "temperature"
    case weatherCode = "weatherCode"
}

public enum WeatherRequestTimestamps: String {
    case oneHour = "1h"
    case oneDay = "1d"
    case oneWeek = "1w"
}


struct WeatherRequestData {
    let location: (long: Double,lat: Double)
    let fields: [WeatherFields]
    let unit: WeatherUnitSystem
    let timesteps: WeatherRequestTimestamps
    let range: String
    let startTime: String
    let endTime: String
    
    func queryParam() -> [URLQueryItem] {
        ([("location","\(location.long),\(location.lat)"),
         ("unit", unit.rawValue),
         ("timesteps", timesteps.rawValue),
         ("startTime", startTime),
          ("endTime", endTime + range)] + fields.map { ("fields", $0.rawValue)})
        .map { URLQueryItem(name: $0.0, value: $0.1) }
    }
}