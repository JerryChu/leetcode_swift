// https://leetcode.com/problems/maximum-depth-of-binary-tree/

extension Solution {
    func maxDepth(_ root: TreeNode<Int>?) -> Int {
        guard let node = root else {
            return 0
        }
        return node.depth()            
    }
}