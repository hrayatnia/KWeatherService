import Foundation
import KCNetwork

public final class WeatherService: AuthURLSessionHTTPService {
    public var request: Request {
        @RequestBuilder(requestable: [
                        URIPath(Endpoints.timelines.rawValue),
                        HTTPMethod.GET,
                        ] + data.queryParam() + authConfig,
                        wrappedValue: baseURL)
        var request
        return request
    }
    
    public typealias Response = WeatherResponse
    
    @Published
    public var result: Result<WeatherService.Response, Error>?
    
    internal var data: WeatherRequestData
    
    public init(long: Double,
                lat: Double,
                startDate: String = "now",
                endDate: String = "now",
                range: String = "Plus7d",
                timestep: WeatherRequestTimestamps = .oneDay,
                unit: WeatherUnitSystem = .metric,
                fields: WeatherFields...) {
        data = .init(location: (long,lat),
                     fields: fields.reversed(),
                     unit: unit,
                     timesteps: timestep,
                     range: range,
                     startTime: startDate,
                     endTime: endDate)
    }
    
    
}
