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
    
    
    @RequestBuilder(requestable: requestableArray(block: {
        [
         "Accept": "Application/JSON",
         "Content-Type": "Application/JSON"
        ]
    }),
    wrappedValue: {
        let baseURL = URL(string: APISetting.path + APIVersions.current())!
        return Request.init(url: baseURL)
    }())
    static var baseURL: Request
    
}
