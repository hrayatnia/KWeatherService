import Foundation

// MARK: - Weather Response
public struct WeatherResponse: Decodable {
    public let data: Timelines
    
    public init(data: Timelines) {
        self.data = data
    }
}

// MARK: - weather timeline
public struct Timelines: Decodable {
    public let timelines: [TimelineItem]
    
    public init(timelines: [TimelineItem]) {
        self.timelines = timelines
    }
}

// MARK: - weather timeline item
public struct TimelineItem: Decodable {
    public let timestep: String
    public let endTime, startTime: Date
    public let intervals: [Interval]
    
    public init(timestep: String, endTime: Date, startTime: Date, intervals: [Interval]) {
        self.timestep = timestep
        self.endTime = endTime
        self.startTime = startTime
        self.intervals = intervals
    }
}

// MARK: - weather timeline item Interval
public struct Interval: Codable {
    public let startTime: Date
    public let values: IntervalValues
    
    public init(startTime: Date, values: IntervalValues) {
        self.startTime = startTime
        self.values = values
    }
}

// MARK: - Interval Values
public struct IntervalValues: Codable {
    public let temperature: Double?
    public let weatherCode: Int?
    public let sunriseTime: Date?
    public let sunsetTime: Date?
    
    public init(temperature: Double, weatherCode: Int, sunriseTime: Date, sunsetTime: Date) {
        self.temperature = temperature
        self.weatherCode = weatherCode
        self.sunsetTime = sunsetTime
        self.sunriseTime = sunriseTime
    }
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        temperature = try? values.decodeIfPresent(Double.self, forKey: .temperature)
        weatherCode = try? values.decodeIfPresent(Int.self, forKey: .weatherCode)
        sunriseTime = try? values.decodeIfPresent(Date.self, forKey: .sunriseTime)
        sunsetTime = try? values.decodeIfPresent(Date.self, forKey: .sunsetTime)
    }
}


#if DEBUG

public extension WeatherResponse {
    static func mock() -> Self {
        .init(data: .mock())
    }
}

public extension Timelines {
    static func mock() -> Self {
        .init(timelines: (0...6).map { .mock("\($0)")})
    }
}

public extension TimelineItem {
    static func mock(_ step: String) -> Self {
        .init(timestep: step, endTime: Date(), startTime: Date(), intervals: (0...6).map {_ in .mock()})
    }
}

public extension Interval {
    static func mock() -> Self {
        .init(startTime: Date(), values: .mock())
    }
}

public extension IntervalValues {
    static func mock() -> Self {
        .init(temperature: 14.0, weatherCode: 1001, sunriseTime: Date(), sunsetTime: Date())
    }
}

#endif
