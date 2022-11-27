import XCTest
import KCTestUtil
import KCNetwork
@testable import KWeatherService

final class KWeatherServiceTestCase: XCIntegrationTestCase {
    var service: WeatherService!
    override func setUpWithError() throws {
        loadConfig()
        try super.setUpWithError()
        service = .init(long: 42.3478,
                        lat: -71.0466,
                        fields: .temperature, .weatherCode)
    }
    
    func testRunWeatherService() {
        service.run()
        let exp = expectation(description: "waiting for network call ...")
        
        DispatchQueue.global(qos: .utility).asyncAfter(deadline: .now() + NetworkTimeout.default.rawValue - 1, execute: {
            XCTAssertNotNil(self.service.result)
            exp.fulfill()
        })
        
        waitForExpectations(timeout: NetworkTimeout.default.rawValue)
    }
}
