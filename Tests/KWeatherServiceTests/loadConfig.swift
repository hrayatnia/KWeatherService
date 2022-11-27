import Foundation
import KCTestUtil

internal func loadConfig() {
    guard KCTestUtilStorage.properties.isEmpty else { return }
    let path = URL(fileURLWithPath: #file)
        .deletingLastPathComponent()
        .appendingPathComponent("config.plist")
        .path
    guard let data = NSDictionary(contentsOfFile: path) as? Dictionary<String, AnyObject> else {
      return
    }
   KCTestUtilStorage.load(data: data)
}
