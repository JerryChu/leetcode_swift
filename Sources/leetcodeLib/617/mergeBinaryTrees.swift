// https://leetcode-cn.com/problems/merge-two-binary-trees/

extension Solution {
    func mergeTrees(_ t1: TreeNode<Int>?, _ t2: TreeNode<Int>?) -> TreeNode<Int>? {
        guard let node1 = t1 else {
            return t2
        }
        guard let node2 = t2 else {
            return t1
        }

        return TreeNode<Int>(node1.val + node2.val, left: mergeTrees(node1.left, node2.left), right: mergeTrees(node1.right, node2.right))
    }
}