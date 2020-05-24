import XCTest
@testable import leetcodeLib

class BinaryTreeTests: XCTestCase {

    let solution = Solution()

    func testDepth() {
        XCTAssertEqual(solution.maxDepth(emptyTree()), 0)
        XCTAssertEqual(solution.maxDepth(oneLevelTree()), 1)
        XCTAssertEqual(solution.maxDepth(twoLevelTree()), 2)
        XCTAssertEqual(solution.maxDepth(threeLevelTree()), 3)
    }

    func testDiameter() {
        XCTAssertEqual(solution.diameterOfBinaryTree(emptyTree()), 0)
        XCTAssertEqual(solution.diameterOfBinaryTree(oneLevelTree()), 0)
        XCTAssertEqual(solution.diameterOfBinaryTree(twoLevelTree()), 2)
        XCTAssertEqual(solution.diameterOfBinaryTree(threeLevelTree()), 3)
    }

    private func emptyTree() -> TreeNode<Int>? {
        return nil
    }

    private func oneLevelTree() -> TreeNode<Int> {
        return TreeNode<Int>(1)
    }

    private func twoLevelTree() -> TreeNode<Int> {
        return TreeNode<Int>(1, left: TreeNode<Int>(2), right: TreeNode<Int>(3))
    }

    private func threeLevelTree() -> TreeNode<Int> {
        return TreeNode<Int>(1, left: TreeNode<Int>(2, left: TreeNode<Int>(4), right: TreeNode<Int>(5)), right: TreeNode<Int>(3))
    }
}