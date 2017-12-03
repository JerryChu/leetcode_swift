enum Problem: String {
    case twoSum = "twoSum"
    case addTwoNumbers = "addTwoNumbers"
    case longestSubstring = "longestSubstring"
}

class Solution {
    class func solve(_ problem: Problem?) {
        guard let problem = problem else {
            return
        }
        let solution = Solution()
        switch problem {
        case .twoSum:
            print(solution.twoSum([2, 7, 11, 15], 9))
        case .addTwoNumbers:
            let l1 = ListNode(2, next: ListNode(4, next: ListNode(3, next: nil)))
            let l2 = ListNode(5, next: ListNode(6, next: ListNode(4, next: nil)))
            if let node = solution.addTwoNumbers(l1, l2) {
                print(node.toArray())
            }
        case .longestSubstring:
            print(solution.lengthOfLongestSubstring("abcabcab"))
        }
    }
}

if CommandLine.arguments.count == 2 {
    let problem = CommandLine.arguments[1]  
    Solution.solve(Problem(rawValue:problem))
} else {
    print("""
    \u{001B}[0;31m
    Invalid parameters!
    Usage: 
        swift run leetcode `problem`
    Example:
        swift run leetcode twosum
    """)
}
