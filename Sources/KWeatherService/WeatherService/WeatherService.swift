import Foundation
import SNetwork


public struct WeatherService: RestService, Sendable {
    public typealias Response = WeatherResponse
    
    
    public var destination: Destination {
        Endpoints.timelines.rawValue.destination(baseURL)
            .applying(HTTPMethod.POST)
            .applying(query)
    }
    
    public var request: WeatherRequestData
    
    private let query: URLQueryItem
    
    public init(query: String, request: WeatherRequestData) {
        self.query = URLQueryItem(name: "apikey", value: query)
        self.request = request
    }
    
    public init(long: Double,
                lat: Double,
                query: String,
                startDate: String = "now",
                endDate: String = "nowPlus5d",
                timestep: [WeatherRequestTimestamps] = [.oneDay],
                unit: WeatherUnitSystem = .metric,
                fields: WeatherFields...) {
        self.init(query: query,
                  request: WeatherRequestData.init(location: "\(long), \(lat)",
                     fields: fields.reversed(),
                     unit: unit,
                     timesteps: timestep,
                     startTime: startDate,
                     endTime: endDate))
    }
}



internal enum Endpoints: String {
    case timelines = "/timelines"
}

