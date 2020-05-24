/**
 * Definition for singly-linked list.
 */
class ListNode<T: Equatable>: Equatable, CustomStringConvertible {
    var val: T
    var next: ListNode?
    init(_ val: T) {
        self.val = val
        self.next = nil
    }
    init(_ val: T, next: ListNode?) {
        self.val = val
        self.next = next
    }
    
    var description: String {
        self.toArray().description
    }
    
    static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.toArray() == rhs.toArray()
    }

    class func build(from array:[T]) -> ListNode? {
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

    func toArray() -> [T] {
        var result = [T]()
        result.append(self.val)
        var node = self.next
        while node != nil {
            result.append(node!.val)
            node = node?.next
        }
        return result
    }
}
