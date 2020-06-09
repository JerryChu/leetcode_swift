// 

extension Solution {
    
    func isCousins(_ root: TreeNode<Int>?, _ x: Int, _ y: Int) -> Bool {
        guard let node = root else {
            return false
        }
        var result = (0, 0, 0, 0)
        dfs(node, nil, x, y, 1, &result)
        let (xDepth, yDepth, xParent, yParent) = result
        return xDepth == yDepth && xParent != yParent

    }

    func dfs(_ root: TreeNode<Int>?, _ parent: TreeNode<Int>?, _ x: Int, _ y: Int, _ depth: Int,  _ result: inout (Int, Int, Int, Int)) {
        guard let node = root else {
            return
        }

        dfs(node.left, node, x, y, depth + 1, &result)
        dfs(node.right, node, x, y, depth + 1, &result)

        if node.val == x {
            result.0 = depth
            result.2 = parent?.val ?? 0
        } else if node.val == y {
            result.1 = depth
            result.3 = parent?.val ?? 0
        }
    }
}