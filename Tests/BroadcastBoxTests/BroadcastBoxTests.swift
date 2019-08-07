import XCTest
@testable import BroadcastBox

final class BroadcastBoxTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(BroadcastBox().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
