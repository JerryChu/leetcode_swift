// https://leetcode.com/problems/reverse-integer/description/

import Foundation
extension Solution {
    func reverse(_ x: Int) -> Int {
        var result: Int32 = 0
        var n: Int32 = Int32(x)
        while n != 0 {
            let tail = n % 10
            // return 0 if it overflows
            let newResult: Int32 = result &* 10 &+ tail
            guard (newResult - tail) / 10 == result else {
                return 0
            } 
            result = newResult
            n = n / 10
        }
        return Int(result)
    }
}
