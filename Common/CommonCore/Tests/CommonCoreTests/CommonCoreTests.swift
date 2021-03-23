import XCTest
@testable import CommonCore

final class CommonCoreTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(CommonCore().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
