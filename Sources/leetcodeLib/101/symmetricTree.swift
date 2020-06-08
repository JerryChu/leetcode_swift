// https://leetcode-cn.com/problems/symmetric-tree/

extension Solution {
    func isSymmetric(_ root: TreeNode<Int>?) -> Bool {

        // defined in ../617/invertBinaryTrees.swift 
        // func invertTree(_ root: TreeNode<Int>?) -> TreeNode<Int>? {
        //     guard let node = root else {
        //         return nil
        //     }
        //     return TreeNode<Int>(node.val, left: invertTree(node.right), right: invertTree(node.left))
        // }

        let inverted = invertTree(root)
        
        func isSame(_ first: TreeNode<Int>?, _ second: TreeNode<Int>?) -> Bool {
            guard let firstNode = first else {
                return second == nil
            }
            guard let secondNode = second else {
                return first == nil
            }
            return firstNode.val == secondNode.val && isSame(firstNode.left, secondNode.left) && isSame(firstNode.right, secondNode.right)
        }

        return isSame(root, inverted)
    }

    func isSymmetric2(_ root: TreeNode<Int>?) -> Bool {
        guard let node = root else {
            return true
        }

        func isSubTreeSymmetric(_ first: TreeNode<Int>?, _ second: TreeNode<Int>?) -> Bool {
            guard let firstNode = first else {
                return second == nil
            }
            guard let secondNode = second else {
                return first == nil
            }
            return firstNode.val == secondNode.val && isSubTreeSymmetric(firstNode.left, secondNode.right) && isSubTreeSymmetric(firstNode.right, secondNode.left)
        }

        return isSubTreeSymmetric(node.left, node.right)
    }
}