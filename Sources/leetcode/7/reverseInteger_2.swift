// https://leetcode.com/problems/reverse-integer/description/
import Foundation
extension Solution {
    func reverse_2(_ x: Int) -> Int {
        guard abs(x) < Int(pow(Double(2), 32)) else {
            return 0
        }
        let nums = Array(String(x))
        guard nums.count > 0 else {
            return 0
        }
        let isNegative = nums[0] == "-"
        var skipZero = true

        var i = nums.count - 1
        var reversedArray = [Character]()
        while i >= 0 {
            if nums[i] != "0" {
                skipZero = false
            }
            let isDigital = nums[i] <= "9" && nums[i] >= "0"
            if !skipZero && isDigital {
                reversedArray.append(nums[i])
            }
            i -= 1
        }   
        return Int(String(reversedArray))! * (isNegative ? -1 : 1)
    }
}
