public enum Problem: String, CaseIterable {
    case twoSum = "twoSum"
    case addTwoNumbers = "addTwoNumbers"
    case longestSubstring = "longestSubstring"
    case findMedian = "findMedian"
    case longestPalindrome = "longestPalindrome"
    case zigzagConversion = "zigzagConversion"
    case reverseInteger = "reverseInteger"
    case atoi = "atoi"
    case palindromeNumber = "palindromeNumber"
    case regularExpression = "regularExpression"
    case containerWithMostWater = "containerWithMostWater"
    case integerToRoman = "integerToRoman"
    case romanToInteger = "romanToInteger"
    case longestCommonPrefix = "longestCommonPrefix"
    case threeSum = "threeSum"
    case threeSumClosest = "threeSumClosest"
    case letterCombination = "letterCombination"
    case validParentheses = "validParentheses"
    case mergeTwoLists = "mergeTwoLists"
    case maxDepthOfBinaryTree = "maxDepthOfBinaryTree"
    case diameterOfBinaryTree = "diameterOfBinaryTree"
    case largestTimeFromDigits = "largestTimeFromDigits"
    case printVertically = "printVertically"
}

public class Solution {
    public class func solve(_ problem: Problem?) {
        guard let problem = problem else {
            return
        }
        let solution = Solution()
        switch problem {
        case .twoSum:
            print(solution.twoSum([2, 7, 11, 15], 9))
        case .addTwoNumbers:
            let l1 = ListNode.build(from: [2, 4, 3])
            let l2 = ListNode.build(from: [5, 6, 4])
            if let node = solution.addTwoNumbers(l1, l2) {
                print(node.toArray())
            }
        case .longestSubstring:
            print(solution.lengthOfLongestSubstring("abcabcab"))
        case .findMedian:
            print(solution.findMedianSortedArrays([1, 3], [2, 4]))
        case .longestPalindrome:
            print(solution.longestPalindrome("babad"))
        case .zigzagConversion:
            print(solution.convert("paypalishiring", 3))
        case .reverseInteger:
            print(solution.reverse(-123))
        case .atoi:
            print(solution.myAtoi("-2147483648"))
        case .palindromeNumber:
            print(solution.isPalindrome(12321))
        case .regularExpression:
            print(solution.isMatch("ab", ".*"))
            print(solution.isMatch("aab", "c*a*b"))
        case .containerWithMostWater:
            print(solution.maxArea([1, 3, 4, 2]))
        case .integerToRoman:
            print(solution.intToRoman(1234))
        case .romanToInteger:
            print(solution.romanToInt("CDXXI"))
        case .longestCommonPrefix:
            print(solution.longestCommonPrefix(["a", "b", "c"]))
        case .threeSum:
            print(solution.threeSum([-5,0,-2,3,-2,1,1,3,0,-5,3,3,0,-1]))
        case .threeSumClosest:
            print(solution.threeSumClosest([1,2,4,8,16,32,64,128], 82))
        case .letterCombination:
            print(solution.letterCombinations("23"))
        case .validParentheses:
            print(solution.isValid("({})"))
        case .mergeTwoLists:
            let list1 = ListNode.build(from: [1, 2, 4])
            let list2 = ListNode.build(from: [1, 3, 4])
            print(solution.mergeTwoLists(list1, list2)!.toArray())
        case .maxDepthOfBinaryTree:
            let tree = TreeNode<Int>.randomIntTree()
            print(solution.maxDepth(tree))
        case .diameterOfBinaryTree:
            let tree = TreeNode<Int>.randomIntTree()
            print(solution.diameterOfBinaryTree(tree))
        case .largestTimeFromDigits:
            print(solution.largestTimeFromDigits([1, 9, 9, 4]))
        case .printVertically:
            print(solution.printVertically("TO BE OR NOT TO BE"))
        }
    }
}
