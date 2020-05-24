import XCTest
@testable import leetcodeLib

class StringTests: XCTestCase {
    let solution = Solution()
    
    func testLengthOfLongestSubstring() {
        XCTAssertEqual(solution.lengthOfLongestSubstring(""), 0)
        XCTAssertEqual(solution.lengthOfLongestSubstring("aaaaa"), 1)
        XCTAssertEqual(solution.lengthOfLongestSubstring("abcdea"), 5)
        XCTAssertEqual(solution.lengthOfLongestSubstring("abcabcab"), 3)
        XCTAssertEqual(solution.lengthOfLongestSubstring("abcdefg"), 7)
        XCTAssertEqual(solution.lengthOfLongestSubstring("abcabdcb"), 4)
    }
}
