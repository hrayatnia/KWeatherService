import Foundation
import SNetwork

@available(iOS 16.0, *)
public struct APISetting {
    private var secretKey: String
    
    
    private var setting: RestSettings<JSONDecoder> {
        .init(baseURL: URL(string: "https://api.tomorrow.io")!)
        
    }
    
    private var globalSession: NetworkSession {
        let session: NetworkSession = .init(configuration: NetworkConfiguration(type: .default))
        session.set(headers)
        return session
    }
    
    private var headers: RestNetworkHeader {
        var header = RestNetworkHeader()
        header.headers["X-API-Key"] = secretKey
        return header
    }
    
    public mutating func set(secretKey: String) {
        self.secretKey = secretKey
        
    }
    
    public init (secretKey: String = "") {
        self.secretKey = secretKey
        registerServices()
    }
    
    
    private func registerServices() {
        NetworkSessionContainerRegistry.shared.register(WeatherService.self, globalSession)
        NetworkSettingsContainerRegistry.shared.register(WeatherService.self, setting)
    }
    
}



