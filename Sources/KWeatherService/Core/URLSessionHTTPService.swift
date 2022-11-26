import Foundation
import KCNetwork

protocol URLSessionHTTPService: AnyService {}

extension URLSessionHTTPService {
    var network: NetworkAdapter {
        URLSessionNetworkAdapter.init()
    }
}

