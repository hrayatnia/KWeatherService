import Foundation
import SNetwork


public struct WeatherService: RestService {
    public typealias Response = WeatherResponse
    
    
    public var destination: Destination {
        "".destination()
            .applying(HTTPMethod.GET)
            .applying(query.queryParam())
    }
    
    public var request: String = ""
    
    private let query: WeatherRequestData
    
    public init(query: WeatherRequestData) {
        self.query = query
    }
}


extension Array: @retroactive Addressable where Element == URLQueryItem {
    
    public func apply(to request: Destination) -> Destination {
        _ = self.map{ $0.apply(to: request) }
        return request
    }
}
