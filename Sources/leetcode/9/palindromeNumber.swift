// https://leetcode.com/problems/palindrome-number/description/

extension Solution {
    func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 else {
            return false
        }
        if x < 10 {
            return true
        }
        var num = x
        var base = 10
        while num / base > 0 {
            base *= 10
        }
        base = base / 10
        while base > 0 && num / base == num % 10 {
            num = (num % base - num % 10) / 10
            base /= 100
        }
        return base <= 1
    }
}