import KCNetwork

protocol AuthURLSessionHTTPService: URLSessionHTTPService {}

extension AuthURLSessionHTTPService {
    var authConfig: [Requestable] {
        [
            QueryItem(name: "apikey",
                      value: APISetting.secretKey)
        ]
    }
}
