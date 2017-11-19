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
    func toArray() -> [Int] {
        var result = [Int]()
        result.append(self.val)
        var node = self.next
        while node != nil {
            result.append(node!.val)
            node = node!.next
        }
        return result
    }
}

extension Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var sum = 0, overflow = false
        if let l1 = l1 {
            sum += l1.val
        }
        if let l2 = l2 {
            sum += l2.val
        }
        (sum, overflow) = process(sum)
        
        let result = ListNode(sum)
        var (tmp, cur_l1, cur_l2) = (result, l1?.next, l2?.next)
        while cur_l1 != nil || cur_l2 != nil {
            sum = 0
            if let tmp_l1 = cur_l1 {
                sum += tmp_l1.val
                cur_l1 = tmp_l1.next
            }
            if let tmp_l2 = cur_l2 {
                sum += tmp_l2.val
                cur_l2 = tmp_l2.next
            }
            if overflow {
                sum += 1
            }
            (sum, overflow) = process(sum)
            tmp.next = ListNode(sum)
            tmp = tmp.next!
        }
        if overflow {
            var last = ListNode(1)
            last.next = nil
            tmp.next = last
        } else {
            tmp.next = nil
        }
        return result
    }

    private func process(_ sum: Int) -> (Int, Bool) {
        return sum >= 10 ? (sum % 10 ,true) : (sum, false)
    }
}