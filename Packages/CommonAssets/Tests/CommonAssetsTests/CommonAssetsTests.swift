import XCTest
@testable import CommonAssets

final class CommonAssetsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(CommonAssets().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
