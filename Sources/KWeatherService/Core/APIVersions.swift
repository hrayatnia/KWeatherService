import Foundation

internal enum APIVersions: String {
    static func current() -> String {
        APIVersions.v4.rawValue
    }
    case v4 = "v4"
}
