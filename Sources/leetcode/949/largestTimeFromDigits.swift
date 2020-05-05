// https://leetcode.com/problems/largest-time-for-given-digits/

extension Solution {
    func largestTimeFromDigits(_ A: [Int]) -> String {
        guard A.count == 4 else {
            return ""
        }

        var result = -1
        for (i, h1) in A.enumerated() {
            for (j, h2) in A.enumerated() {
                guard j != i else { continue }
                for (k, m1) in A.enumerated() {
                    guard (k != i && k != j) else { continue }
                    let m2 = A[6 - i - j - k] // 6 equals to 0 + 1 + 2 + 3 (all indices)
                    let hour = h1 * 10 + h2
                    let minute = m1 * 10 + m2
                    if hour < 24 && minute < 60 {
                        result = max(result, hour * 60 + minute)
                    }
                }
            }
        }
        return result < 0 ? "" : String(format: "%02d:%02d", result / 60, result % 60)
    }
}

extension Solution {
    func largestTimeFromDigits2(_ A: [Int]) -> String {
        guard A.count == 4 else {
            return ""
        }

        let allCombination = [
            "\(A[0])\(A[1]):\(A[2])\(A[3])",
            "\(A[0])\(A[1]):\(A[3])\(A[2])",
            "\(A[0])\(A[2]):\(A[1])\(A[3])",
            "\(A[0])\(A[2]):\(A[3])\(A[1])",
            "\(A[0])\(A[3]):\(A[1])\(A[2])",
            "\(A[0])\(A[3]):\(A[2])\(A[1])",
            "\(A[1])\(A[2]):\(A[0])\(A[3])",
            "\(A[1])\(A[2]):\(A[3])\(A[0])",
            "\(A[1])\(A[3]):\(A[0])\(A[2])",
            "\(A[1])\(A[3]):\(A[2])\(A[0])",
            "\(A[2])\(A[3]):\(A[0])\(A[1])",
            "\(A[2])\(A[3]):\(A[1])\(A[0])",
            "\(A[1])\(A[0]):\(A[2])\(A[3])",
            "\(A[1])\(A[0]):\(A[3])\(A[2])",
            "\(A[2])\(A[0]):\(A[1])\(A[3])",
            "\(A[2])\(A[0]):\(A[3])\(A[1])",
            "\(A[3])\(A[0]):\(A[1])\(A[2])",
            "\(A[3])\(A[0]):\(A[2])\(A[1])",
            "\(A[2])\(A[1]):\(A[0])\(A[3])",
            "\(A[2])\(A[1]):\(A[3])\(A[0])",
            "\(A[3])\(A[1]):\(A[0])\(A[2])",
            "\(A[3])\(A[1]):\(A[2])\(A[0])",
            "\(A[3])\(A[2]):\(A[0])\(A[1])",
            "\(A[3])\(A[2]):\(A[1])\(A[0])",
        ]

        var result = ""
        let minTime = "00:00"
        let maxHour = "23"
        let maxMinute = "59"
        allCombination.forEach {
            let hourIndex = $0.index($0.startIndex, offsetBy: 2)
            let hour = String($0[..<hourIndex])

            let minuteIndex = $0.index($0.endIndex, offsetBy: -2)
            let minute = String($0[minuteIndex...])            

            if $0.compare(minTime) != .orderedAscending && hour.compare(maxHour) != .orderedDescending && minute.compare(maxMinute) != .orderedDescending {
                if result.count == 0 {
                    result = $0
                } else {
                    result = result.compare($0) == .orderedDescending ? result : $0
                }
            }
        }

        return result
    }
}