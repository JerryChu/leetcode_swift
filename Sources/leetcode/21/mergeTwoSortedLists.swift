// https://leetcode.com/problems/merge-two-sorted-lists/

extension Solution {    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard l1 != nil else {
            return l2
        }
        guard l2 != nil else {
            return l1
        }

        var curL1 = l1, curL2 = l2
        var tmp: ListNode? = ListNode(0) // first (dummy) node
        let result = tmp

        while curL1 != nil && curL2 != nil {
            if curL1!.val <= curL2!.val {
                tmp?.next = curL1
                curL1 = curL1?.next
            } else {
                tmp?.next = curL2
                curL2 = curL2?.next
            }            
            tmp = tmp?.next
        }

        tmp?.next = curL1 == nil ? curL2 : curL1

        return result?.next // drop first node
    }
}