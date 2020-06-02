// https://leetcode.com/problems/univalued-binary-tree/

extension Solution {
    func isUnivalTree(_ root: TreeNode<Int>?) -> Bool {
        guard let node = root else {
            return true
        }   

        var univalued = true
        if let leftNode = node.left {
            univalued = (node.val == leftNode.val)
        }
        if let rightNode = node.right {
            univalued = (univalued && node.val == rightNode.val)
        }

        return univalued && isUnivalTree(node.left) && isUnivalTree(node.right)
    }
}