// https://leetcode-cn.com/problems/balanced-binary-tree/

extension Solution {
    func isBalanced(_ root: TreeNode<Int>?) -> Bool {
        guard let node = root else {
            return true
        }

        let left = node.left?.depth() ?? 0
        let right = node.right?.depth() ?? 0
        let balanced = abs(left - right) <= 1
        return balanced && isBalanced(node.left) && isBalanced(node.right)        
    }

    func isBalanced2(_ root: TreeNode<Int>?) -> Bool {
        var result = true
        traverseDepth(of: root, result: &result)
        return result
    }

    @discardableResult
    func traverseDepth(of node: TreeNode<Int>?, result: inout Bool) -> Int {
        guard let root = node else {
            return 0
        }
        let leftDepth = traverseDepth(of: root.left, result: &result)
        let rightDepth = traverseDepth(of: root.right, result: &result)
        result = result && (leftDepth - rightDepth <= 1)
        return max(leftDepth + 1, rightDepth + 1)
    }
}