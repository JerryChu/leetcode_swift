// https://leetcode.com/problems/diameter-of-binary-tree/

extension Solution {
    func diameterOfBinaryTree(_ root: TreeNode<Int>?) -> Int {        
        var result = 0
        _ = depth(of: root, result: &result)
        return result
    }

    func depth(of node: TreeNode<Int>?, result: inout Int) -> Int {
        guard let root = node else {
            return 0
        }
        let leftDepth = depth(of: root.left, result: &result)
        let rightDepth = depth(of: root.right, result: &result)
        result = max(result, leftDepth + rightDepth)
        return max(leftDepth + 1, rightDepth + 1)
    }
}