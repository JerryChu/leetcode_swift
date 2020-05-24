class TreeNode<T>: CustomStringConvertible {
    var val: T
    var left: TreeNode<T>?
    var right: TreeNode<T>?
    
    init(_ val: T, left: TreeNode<T>? = nil, right: TreeNode<T>? = nil) {
        self.val = val
        self.left = left
        self.right = right
    }

    var description: String { 
        return "\(self.val)"
    }

    class func randomIntTree() -> TreeNode<Int> {
        return TreeNode<Int>(1, left: TreeNode<Int>(2, left: TreeNode<Int>(4), right: TreeNode<Int>(5)), right: TreeNode<Int>(3))
    }

    // 深度
    public func depth() -> Int {
        let leftDepth = self.left?.depth() ?? 0
        let rightDepth = self.right?.depth() ?? 0
        return max(leftDepth + 1, rightDepth + 1)
    }

    // 深度优先遍历
    private func depthFirstPrint() {
        print(self)
        if let leftNode = self.left {
            leftNode.depthFirstPrint()
        }
        if let rightNode = self.right {
            rightNode.depthFirstPrint()
        }
    }

    // 宽度
    private func width() -> Int {
        var width = 1
        var currentWidth = 1
        var nextWidth = 0
        var array = [TreeNode]()
        array.append(self) // it's better to use a `queue`

        while array.count > 0 {
            while currentWidth > 0 {
                let currentNode = array.removeFirst()
                print(currentNode)
                
                if let leftNode = currentNode.left {
                    array.append(leftNode)
                    nextWidth += 1
                }
                if let rightNode = currentNode.right {
                    array.append(rightNode)
                    nextWidth += 1
                }
                currentWidth -= 1
            }
            width = max(width, nextWidth)
            currentWidth = nextWidth
            nextWidth = 0
        }
        return width
    }
}