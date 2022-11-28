import Foundation
import KCNetwork

final class URLSessionNetworkAdapter: NetworkAdapter {
    private var task: URLSessionTask?
    func run<Response>(request: Request) async -> Result<Response,
                                                         Error> where Response : Decodable {
        await withCheckedContinuation({ continuation in
            run(request: request) {
                continuation.resume(with: .success($0))
            }
        })
    }
    
    func run<Response>(request: Request,
                       response: @escaping (Result<Response,
                                            Error>) -> ()) where Response : Decodable {
        
        let session = NetworkSetting.session
        task = session.dataTask(with: request as URLRequest) { [unowned self] (data, res, error) in
            guard let res = res as? HTTPURLResponse,
                  NetworkSetting.validStatusCode.contains(res.statusCode) else {
                      response(.failure(URLError.dataNotAllowed as! Error))
                      return
                  }
            if let error = error {
                response(.failure(error))
                return
            }
            do {
                guard let data = data else {
                    return
                }
                let decoder = NetworkSetting.networkDecoder
                let result = try decoder.decode(Response.self, from: data)
                response(.success(result))
            }catch {
                response(.failure(error))
            }
        }
        task?.resume()
    }
}
