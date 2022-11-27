import Foundation
import KCNetwork

protocol URLSessionHTTPService: AnyService {}

extension URLSessionHTTPService {
    
    var baseURL: Request {
        @RequestBuilder(requestable:[["Accept": "Application/JSON"]],
        wrappedValue: {
            let baseURL = URL(string: APISetting.path + APIVersions.current())!
            return Request.init(url: baseURL)
        }())
        var request: Request
        return request
    }
    
    public var network: NetworkAdapter {
        URLSessionNetworkAdapter.init()
    }
}

