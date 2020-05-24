// https://leetcode.com/problems/longest-palindromic-substring/description/

extension Solution {
    func longestPalindrome(_ s: String) -> String {
        if s.count <= 1 { return s }
        var i = 0
        let characters = Array(s)
        var start = 0, end = 0
        while i < characters.count {
            let length0 = maxLengthOfPalindrome(i, right: i, characters: characters)
            if length0 > end - start + 1 {
                start = i - (length0 - 1) / 2
                end = i + (length0 - 1) / 2
            }
            let length1 = maxLengthOfPalindrome(i, right: i + 1, characters: characters)
            if length1 > end - start + 1 {
                start = i - (length1 - 2) / 2
                end = i + 1 + (length1 - 2) / 2
            }
            i += 1   
        }
        return String(characters[start...end])
    }

    private func maxLengthOfPalindrome(_ left: Int, right: Int, characters: [Character]) -> Int {
        var L = left, R = right
        while L >= 0 && R < characters.count && characters[L] == characters[R] {
            L -= 1
            R += 1
        }
        return R - L - 1
    }
}
