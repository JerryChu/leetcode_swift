// https://leetcode.com/problems/zigzag-conversion/description/

extension Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        guard numRows > 1 else {
            return s
        }
        guard s.count > numRows else {
            return s            
        }

        let characters = Array(s)
        var charArray = [[Character]]()

        var row = 0
        while row < numRows {
            charArray.append([Character]())
            row += 1
        }

        row = 0
        var i = 0, step = 1
        while i < characters.count {
            charArray[row].append(characters[i])

            if row == 0 {
                step = 1    
            } else if row == numRows - 1 {
                step = -1
            }
            row += step
            i += 1
        }

        row = 0
        var result = ""
        while row < numRows {
            result += String(charArray[row])
            row += 1
        }
        return result
    }
}