// https://leetcode.com/problems/print-binary-tree/
import Darwin 

// TODO: use recursive solution
extension Solution {
    func printTree(_ root: TreeNode<Int>?) -> [[String]] {
        guard let node = root else {
            return [[]]
        }

        let rowCount = node.depth()

        var array = [TreeNode<Int>?]()
        array.append(node)
        var curRow = 0
        var currentWidth = 1
        var nextWidth = 0

        var firstLineArray = sidePlaceholder(forRow: curRow, rowCount: rowCount)
        firstLineArray.append(String(node.val))
        firstLineArray.append(contentsOf: sidePlaceholder(forRow: curRow, rowCount: rowCount))

        var result = [[String]]()
        result.append(firstLineArray)

        while array.count > 0 && curRow < rowCount - 1 {
            curRow += 1
            var lineArray = [String]()
            while currentWidth > 0 {
                let cur = array.removeFirst()

                array.append(cur?.left)
                lineArray.append(contentsOf: sidePlaceholder(forRow: curRow, rowCount: rowCount))
                lineArray.append(cur?.left == nil ? "" : String(cur!.left!.val))
                lineArray.append(contentsOf: sidePlaceholder(forRow: curRow, rowCount: rowCount))
                lineArray.append("")

                array.append(cur?.right)
                lineArray.append(contentsOf: sidePlaceholder(forRow: curRow, rowCount: rowCount))
                lineArray.append(cur?.right == nil ? "" : String(cur!.right!.val))
                lineArray.append(contentsOf: sidePlaceholder(forRow: curRow, rowCount: rowCount))
                if currentWidth != 1 {
                    lineArray.append("")
                }

                nextWidth += 2
                currentWidth -= 1
            }

            result.append(lineArray)
            currentWidth = nextWidth
            nextWidth = 0
        }

        return result
    }

    private func sidePlaceholder(forRow row: Int, rowCount count: Int) -> [String] {
        let count = pow(2, Float(count - row) - 1) - 1
        return Array(repeating: "", count: Int(count))
    }
}