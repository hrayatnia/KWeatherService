import Foundation

// MARK: - Weather Response
public struct WeatherResponse: Decodable {
    let data: Timelines
    
    public init(data: Timelines) {
        self.data = data
    }
}

// MARK: - weather timeline
public struct Timelines: Decodable {
    let timelines: [TimelineItem]
    
    public init(timelines: [TimelineItem]) {
        self.timelines = timelines
    }
}

// MARK: - weather timeline item
public struct TimelineItem: Decodable {
    let timestep: String
    let endTime, startTime: Date
    let intervals: [Interval]
    
    public init(timestep: String, endTime: Date, startTime: Date, intervals: [Interval]) {
        self.timestep = timestep
        self.endTime = endTime
        self.startTime = startTime
        self.intervals = intervals
    }
}

// MARK: - weather timeline item Interval
public struct Interval: Codable {
    let startTime: Date
    let values: IntervalValues
    
    public init(startTime: Date, values: IntervalValues) {
        self.startTime = startTime
        self.values = values
    }
}

// MARK: - Interval Values
public struct IntervalValues: Codable {
    let temperature: Double
    let weatherCode: Int
    
    public init(temperature: Double, weatherCode: Int) {
        self.temperature = temperature
        self.weatherCode = weatherCode
    }
}


#if DEBUG

extension WeatherResponse {
    static func mock() -> Self {
        .init(data: .mock())
    }
}

extension Timelines {
    static func mock() -> Self {
        .init(timelines: (0...6).map { .mock("\($0)")})
    }
}

extension TimelineItem {
    static func mock(_ step: String) -> Self {
        .init(timestep: step, endTime: Date(), startTime: Date(), intervals: (0...6).map {_ in .mock()})
    }
}

extension Interval {
    static func mock() -> Self {
        .init(startTime: Date(), values: .mock())
    }
}

extension IntervalValues {
    static func mock() -> Self {
        .init(temperature: 14.0, weatherCode: 1001)
    }
}

#endif
