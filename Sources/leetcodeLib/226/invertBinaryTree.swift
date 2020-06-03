// https://leetcode-cn.com/problems/invert-binary-tree/

extension Solution {
    func invertTree(_ root: TreeNode<Int>?) -> TreeNode<Int>? {
        guard let node = root else {
            return nil
        }       

        return TreeNode(node.val, left: invertTree(node.right), right: invertTree(node.left))
    }
}