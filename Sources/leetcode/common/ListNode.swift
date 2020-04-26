/**
 * Definition for singly-linked list.
 */
class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    init(_ val: Int, next: ListNode?) {
        self.val = val
        self.next = next
    }

    class func build(from array:[Int]) -> ListNode? {
        guard array.count > 0 else {
            return nil
        }
        let nodes = array.map { ListNode($0) }
        for (index, _) in nodes.enumerated() {
            if index + 1 < nodes.count {
                nodes[index].next = nodes[index + 1]
            }
        }
        return nodes[0]
    }

    func toArray() -> [Int] {
        var result = [Int]()
        result.append(self.val)
        var node = self.next
        while node != nil {
            result.append(node!.val)
            node = node?.next
        }
        return result
    }
}