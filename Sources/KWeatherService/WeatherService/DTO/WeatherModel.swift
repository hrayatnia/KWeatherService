import Foundation

// MARK: - Weather Response
public struct WeatherResponse: Decodable {
    let data: Timelines
}

// MARK: - weather timeline
public struct Timelines: Decodable {
    let timelines: [TimelineItem]
}

// MARK: - weather timeline item
public struct TimelineItem: Decodable {
    let timestep: String
    let endTime, startTime: Date
    let intervals: [Interval]
}

// MARK: - weather timeline item Interval
public struct Interval: Codable {
    let startTime: String
    let values: IntervalValues
}

// MARK: - Interval Values
public struct IntervalValues: Codable {
    let temperature: Double
    let weatherCode: Int
}
