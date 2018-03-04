// https://leetcode.com/problems/valid-parentheses/description/

extension Solution {
    func isValid(_ s: String) -> Bool {
        guard s.count % 2 == 0 else {
            return false
        }

        let mapping: [Character: Character] = ["(": ")", "[": "]", "{": "}"]
        var result = [Character]()
        for (_, c) in s.enumerated() {
            if String(c) == "(" || String(c) == "[" || String(c) == "{" {
                result.append(c)
            } else {
                if let last = result.last {
                    if let element = mapping[last] {
                        if c == element {
                            result.removeLast()
                        }
                    }
                }
            }
        }
        return result.isEmpty
    }
}