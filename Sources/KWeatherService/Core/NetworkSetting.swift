import Foundation
import KCNetwork
import Network

struct NetworkSetting {
    static var networkDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.allowsJSON5 = true
        jsonDecoder.dateDecodingStrategy = .iso8601
        return jsonDecoder
    }()
    
    
    static var session: URLSession = {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        return session
    }()
    
    static let validStatusCode: ClosedRange = 200...300
    
}
