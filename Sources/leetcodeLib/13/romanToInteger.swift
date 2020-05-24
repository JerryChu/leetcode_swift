// https://leetcode.com/problems/roman-to-integer/description/

extension Solution {
    func romanToInt(_ s: String) -> Int {
        guard s.count > 0 else {
            return 0
        }
        let single = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
        let double = ["IV": 4, "IX": 9, "XL": 40, "XC": 90, "CD": 400, "CM": 900]

        let characters = Array(s)
        var i = 0, result = 0
        while i < characters.count {
            if i + 1 < characters.count {
                let d = String(characters[i]) + String(characters[i + 1])
                if let tmp = double[d] {
                    result += tmp
                    i += 2
                    continue
                }
            }

            let s = String(characters[i])
            if let tmp = single[s] {
                result += tmp
            }
            i += 1
        }
        return result
    }
}