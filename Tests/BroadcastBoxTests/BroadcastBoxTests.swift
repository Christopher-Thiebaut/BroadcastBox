import XCTest
@testable import BroadcastBox

final class BroadcastBoxTests: XCTestCase {
    func testBroadcaster() {
        let source = PassthroughBroadcaster<Int>()
        let retransmitter = SingleSourceBroadcaster(source: source)
        let testSequence = [0,1,2,3,4,5]
        var receivedSequence = [Int]()
        retransmitter.listen { element in
            receivedSequence.append(element)
        }
        for element in testSequence {
            source.send(element)
        }
        XCTAssertEqual(testSequence, receivedSequence)
    }

    static var allTests = [
        ("testExample", testBroadcaster),
    ]
}
