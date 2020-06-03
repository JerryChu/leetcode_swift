class TreeNode<T>: CustomStringConvertible, Equatable where T: Equatable {
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

    static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs.toArray() == rhs.toArray()
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

    class func build(from array:[T]) -> TreeNode? {
        guard array.count > 0 else {
            return nil
        }

        let root = TreeNode(array[0])

        var queue = [TreeNode]() // as if it's a queue
        queue.append(root)
        var currentCount = 1
        var nextCount = 0
        var i = 1

        while i < array.count {
            while currentCount > 0 {
                let node = queue.removeFirst()
                if i < array.count {
                    node.left = TreeNode(array[i])
                    queue.append(node.left!)
                    nextCount += 1
                }
                i += 1
                if i < array.count {
                    node.right = TreeNode(array[i])
                    queue.append(node.right!)
                    nextCount += 1
                }
                i += 1
                currentCount -= 1
            }
            currentCount = nextCount
            nextCount = 0
        }
        return root
    }

    /// 宽度遍历
    func toArray() -> [T] {
        var result = [T]()
        var currentWidth = 1
        var nextWidth = 0
        var array = [TreeNode]()
        array.append(self) // it's better to use a `queue`

        while array.count > 0 {
            while currentWidth > 0 {
                let currentNode = array.removeFirst()
                result.append(currentNode.val)
                
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
            currentWidth = nextWidth
            nextWidth = 0
        }
        return result
    }
}