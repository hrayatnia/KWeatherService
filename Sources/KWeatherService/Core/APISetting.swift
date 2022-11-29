import Foundation

public struct APISetting {
    internal static var secretKey = "Ooboq8AD5JmwnkBpaVcr1Vy5PYewr0RI"
    internal static var path: String {
        #if DEBUG
        return "https://api.tomorrow.io/"
        #endif
        return "https://api.tomorrow.io/"
    }
    
    public func set(secretKey: String) {
        APISetting.secretKey = secretKey
    }
}

