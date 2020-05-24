// https://leetcode.com/problems/string-to-integer-atoi/description/

import Foundation
extension Solution {
    func myAtoi(_ str: String) -> Int {
        guard str.count > 0 else {
            print("empty string!")
            return 0
        }

        let string = str.trimmingCharacters(in: .whitespaces).replacingOccurrences(of: ",", with: "")
        let characters = Array(string)

        let isNegative = characters[0] == "-"
        var charArray = [Character]()
        var i = 0
        while i < characters.count {
            if characters[i] == "+" || characters[i] == "-" {
                if i == 0 {
                    i += 1
                    continue
                } else {
                    break
                }
            } else if characters[i] > "9" || characters[i] < "0" {
                break
            }
            charArray.append(characters[i])
            i += 1
        }

        var result = 0;
        i = 0
        while i < charArray.count {
            let num = Int(String(charArray[i]))!
            let base = NSDecimalNumber(decimal: pow(10.0, charArray.count - i - 1))
            result = result &+ (num &* base.intValue)
            if result < 0 || result > Int32.max {
                return isNegative ? Int(Int32.min) : Int(Int32.max)
            }
            i += 1
        }
        return result * (isNegative ? -1 : 1)
    }
}