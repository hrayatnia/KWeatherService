import Foundation

internal struct APISetting {
    internal static let secretKey = "Ooboq8AD5JmwnkBpaVcr1Vy5PYewr0RI"
    internal static var path: String {
        #if DEBUG
        return "https://api.tomorrow.io/"
        #endif
        return "https://api.tomorrow.io/"
    }
}
