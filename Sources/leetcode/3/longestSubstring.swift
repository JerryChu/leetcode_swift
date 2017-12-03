// https://leetcode.com/problems/longest-substring-without-repeating-characters/description/

extension Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let characters = Array(s.characters)
        var cur = 0, last = 0, result = 0
        var dict = [Character: Int]()
        while cur < characters.count {
            let duplicatedPos = dict[characters[cur]] 
            if duplicatedPos != nil && duplicatedPos! >= last {
                last = duplicatedPos! + 1               
            } else {
                result = max(cur - last + 1, result)
            }
            dict[characters[cur]] = cur
            cur += 1
        }
        return result
    }
}
