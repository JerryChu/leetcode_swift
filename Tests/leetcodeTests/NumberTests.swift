import XCTest
@testable import leetcodeLib

class NumberTests: XCTestCase {
    let solution = Solution()

    func testTwoSum() {
        XCTAssertEqual(solution.twoSum([], 0), [])
        XCTAssertEqual(solution.twoSum([1], 1), [])
        XCTAssertEqual(solution.twoSum([1, 2], 3), [0, 1])
        XCTAssertEqual(solution.twoSum([1, 2, 3, 4], 7), [2, 3])
        XCTAssertEqual(solution.twoSum([1, 2, 3], 2), [])
        XCTAssertEqual(solution.twoSum([1, 2, 3], 6), [])
        XCTAssertEqual(solution.twoSum([-1, 2, 3, 1], 0), [0, 3])
        XCTAssertEqual(solution.twoSum([-1, 1, -2, 2], 0), [0, 1])
    }

    func testThreeSum() {
        XCTAssertEqual(solution.threeSum([]), [])
        XCTAssertEqual(solution.threeSum([1]), [])
        XCTAssertEqual(solution.threeSum([1, 2]), [])
        XCTAssertEqual(solution.threeSum([1, 2, -3]), [[-3, 1, 2]])
        XCTAssertEqual(solution.threeSum([1, 2, 3, -4, -5]), [[-5, 2, 3], [-4, 1, 3]])
        XCTAssertEqual(solution.threeSum([-1, 2, 3, -1]), [[-1, -1, 2]])
        XCTAssertEqual(solution.threeSum([1, 1, -2, 2]), [[-2, 1, 1]])
    }

    func testAddTwoNumbers() {
        XCTAssertEqual(solution.addTwoNumbers(ListNode.build(from: [0, 0, 0]),
                                              ListNode.build(from: [1, 2, 3])),
                       ListNode.build(from: [1, 2, 3]))
        XCTAssertEqual(solution.addTwoNumbers(ListNode.build(from: [1, 2, 3]),
                                              ListNode.build(from: [4, 5, 6])),
                       ListNode.build(from: [5, 7, 9]))
        XCTAssertEqual(solution.addTwoNumbers(ListNode.build(from: [2, 4, 3]),
                                              ListNode.build(from: [5, 6, 4])),
                       ListNode.build(from: [7, 0, 8]))
        XCTAssertEqual(solution.addTwoNumbers(ListNode.build(from: [3, 4, 5]),
                                              ListNode.build(from: [7, 2, 3])),
                       ListNode.build(from: [0, 7, 8]))
        XCTAssertEqual(solution.addTwoNumbers(ListNode.build(from: [3, 4, 5]),
                                              ListNode.build(from: [7, 5, 4])),
                       ListNode.build(from: [0, 0, 0, 1]))
        XCTAssertEqual(solution.addTwoNumbers(ListNode.build(from: [4, 5, 6]),
                                              ListNode.build(from: [6, 7, 8])),
                       ListNode.build(from: [0, 3, 5, 1]))
    }
    
    func testFindMedianSortedArrays() {
        XCTAssertEqual(solution.findMedianSortedArrays([0], [1]), 0.5)
        XCTAssertEqual(solution.findMedianSortedArrays([0], [1, 2]), 1.0)
        XCTAssertEqual(solution.findMedianSortedArrays([0, 1], [1, 2]), 1.0)
        XCTAssertEqual(solution.findMedianSortedArrays([1, 3], [2, 4]), 2.5)
        XCTAssertEqual(solution.findMedianSortedArrays([1, 2], [3, 4, 5]), 3.0)
    }
}
