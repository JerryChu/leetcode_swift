// https://leetcode.com/problems/binary-tree-tilt/

extension Solution {
    func findTilt(_ root: TreeNode<Int>?) -> Int {
        guard let node = root else {
            return 0
        }

        var leftSum = 0, rightSum = 0
        if let leftNode = node.left {
            leftSum = leftNode.val + sumAll(leftNode)
        }
        if let rightNode = node.right {
            rightSum = rightNode.val + sumAll(rightNode)
        }
        return abs(leftSum - rightSum) + findTilt(node.left) + findTilt(node.right)
    }
    
    func sumAll(_ root: TreeNode<Int>?) -> Int {
        guard let node = root else {
            return 0
        }
        
        let leftSum = node.left == nil ? 0 : node.left!.val
        let rightSum = node.right == nil ? 0 : node.right!.val

        return leftSum + rightSum + sumAll(node.left) + sumAll(node.right)
    }
}

extension Solution {
    static var ans = 0
    func findTilt2(_ root: TreeNode<Int>?) -> Int {
        Solution.ans = 0
        traverse(root)
        return Solution.ans
    }
    
    @discardableResult func traverse(_ root: TreeNode<Int>?) -> Int {
        guard let node = root else {
            return 0
        }
        
        let leftVal = traverse(node.left)
        let rightVal = traverse(node.right)
        Solution.ans += abs(leftVal - rightVal)        
        return node.val + leftVal + rightVal
    }
}