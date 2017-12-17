// https://leetcode.com/problems/integer-to-roman/description/

extension Solution {
    func intToRoman(_ num: Int) -> String {
        guard num <= 3999 && num >= 1 else {
            print("invalid input!")
            return ""
        }
        let c = [
            ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"],
            ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"],
            ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"],
            ["", "M", "MM", "MMM"]
        ]
        var result = ""
        result += c[3][(num / 1000) % 10]
        result += c[2][(num / 100) % 10]
        result += c[1][(num / 10) % 10]
        result += c[0][num % 10]
        return result
    }
}