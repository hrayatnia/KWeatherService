import XCTest
import KCTestUtil
@testable import KWeatherService

final class KWeatherServiceTestCase: XCIntegrationTestCase {
    
    override func setUpWithError() throws {
        loadConfig()
        try super.setUpWithError()
    }
}
