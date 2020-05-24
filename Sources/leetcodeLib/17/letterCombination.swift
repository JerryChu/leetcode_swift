// https://leetcode.com/problems/letter-combinations-of-a-phone-number/description/  

extension Solution {
    func letterCombinations(_ digits: String) -> [String] {        
        if digits.count <= 0 {
            return []
        }
        
        let mapping = ["", "", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"]
        let digitArray = Array(digits)

        var result = [""]
        for digit in digitArray {
            let chars = Array(mapping[Int(String(digit))!])
            var tmp = [String]()
            for ch in chars {
                for s in result {
                    tmp.append(s + String(ch))
                }
            }
            result = tmp
        }
        return result
    }
}