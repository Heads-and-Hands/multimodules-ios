import XCTest
@testable import Sportmaster

final class SportmasterTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Sportmaster().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
