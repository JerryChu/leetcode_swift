import XCTest
@testable import leetcodeLib

class BinaryTreeTests: XCTestCase {

    let solution = Solution()

    func testBuildFromArray() {
        XCTAssertEqual(TreeNode.build(from: [0])!.toArray(), [0])
        XCTAssertEqual(TreeNode.build(from: [0, nil])!.toArray(), [0, nil])
        XCTAssertEqual(TreeNode.build(from: [1, 2])!.toArray(), [1, 2])
        XCTAssertEqual(TreeNode.build(from: [1, 2, 3])!.toArray(), [1, 2, 3])
        XCTAssertEqual(TreeNode.build(from: [1, nil, 2, 3])!.toArray(), [1, nil, 2, 3])
        XCTAssertEqual(TreeNode.build(from: [1, 2, 3, nil])!.toArray(), [1, 2, 3, nil])
        XCTAssertEqual(TreeNode.build(from: [1, 2, 3, 4, 5, 6])!.toArray(), [1, 2, 3, 4, 5, 6])
    }

    func testDepth() {
        XCTAssertEqual(solution.maxDepth(TreeNode.build(from: [])), 0)
        XCTAssertEqual(solution.maxDepth(TreeNode.build(from: [1])), 1)
        XCTAssertEqual(solution.maxDepth(TreeNode.build(from: [1, 2, 3])), 2)
        XCTAssertEqual(solution.maxDepth(TreeNode.build(from: [1, 2, 3, 4, 5])), 3)
    }

    func testDiameter() {
        XCTAssertEqual(solution.diameterOfBinaryTree(TreeNode.build(from: [])), 0)
        XCTAssertEqual(solution.diameterOfBinaryTree(TreeNode.build(from: [1])), 0)
        XCTAssertEqual(solution.diameterOfBinaryTree(TreeNode.build(from: [1, 2, 3])), 2)
        XCTAssertEqual(solution.diameterOfBinaryTree(TreeNode.build(from: [1, 2, 3, 4, 5])), 3)
    }

    func testTilt() {
        XCTAssertEqual(solution.findTilt(TreeNode.build(from: [])), 0)
        XCTAssertEqual(solution.findTilt(TreeNode.build(from: [1])), 0)
        XCTAssertEqual(solution.findTilt(TreeNode.build(from: [1, 2, 3])), 1)
        XCTAssertEqual(solution.findTilt(TreeNode.build(from: [1, 2, 3, 4, 5])), 9)
        
        XCTAssertEqual(solution.findTilt2(TreeNode.build(from: [])), 0)
        XCTAssertEqual(solution.findTilt2(TreeNode.build(from: [1])), 0)
        XCTAssertEqual(solution.findTilt2(TreeNode.build(from: [1, 2, 3])), 1)
        XCTAssertEqual(solution.findTilt2(TreeNode.build(from: [1, 2, 3, 4, 5])), 9)
    }

    func testIsUnival() {
        XCTAssertEqual(solution.isUnivalTree(TreeNode.build(from: [])), true)
        XCTAssertEqual(solution.isUnivalTree(TreeNode.build(from: [1])), true)
        XCTAssertEqual(solution.isUnivalTree(TreeNode.build(from: [1, 1])), true)
        XCTAssertEqual(solution.isUnivalTree(TreeNode.build(from: [1, 1, 1])), true)
        XCTAssertEqual(solution.isUnivalTree(TreeNode.build(from: [1, 1, 1, 1])), true)
    }

    func testRevert() {
        XCTAssertEqual(solution.invertTree(TreeNode.build(from: [])), TreeNode.build(from: []))
        XCTAssertEqual(solution.invertTree(TreeNode.build(from: [1])), TreeNode.build(from: [1]))
        XCTAssertEqual(solution.invertTree(TreeNode.build(from: [1, 2])), TreeNode.build(from: [1, 2]))
        XCTAssertEqual(solution.invertTree(TreeNode.build(from: [1, 2, 3])), TreeNode.build(from: [1, 3, 2]))
        XCTAssertEqual(solution.invertTree(TreeNode.build(from: [4, 2, 7, 1, 3, 6, 9])), TreeNode.build(from: [4, 7, 2, 9, 6, 3, 1]))
    }

    func testIsBalanced() {
        XCTAssertTrue(solution.isBalanced(TreeNode.build(from: [1])))
        XCTAssertTrue(solution.isBalanced(TreeNode.build(from: [1, 2])))
        XCTAssertTrue(solution.isBalanced(TreeNode.build(from: [1, 2, 3])))

        XCTAssertTrue(solution.isBalanced2(TreeNode.build(from: [1])))
        XCTAssertTrue(solution.isBalanced2(TreeNode.build(from: [1, 2])))
        XCTAssertTrue(solution.isBalanced2(TreeNode.build(from: [1, 2, 3])))
    }
}