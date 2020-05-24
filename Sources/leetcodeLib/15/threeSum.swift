// https://leetcode.com/problems/3sum/description/
 
extension Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var i = 0
        let sortedNums = nums.sorted(){$0 < $1} 
        var result = [[Int]]()
        while i < sortedNums.count - 2 {
            if i > 0 && sortedNums[i] == sortedNums[i - 1] {
                i += 1
                continue
            }
            var j = i + 1, k = sortedNums.count - 1
            let target = -sortedNums[i]
            while j < k {
                if sortedNums[j] + sortedNums[k] == target {
                    result.append([sortedNums[i], sortedNums[j], sortedNums[k]])
                    j += 1
                    k -= 1
                    while (j < k && sortedNums[j] == sortedNums[j - 1]) {
                        j += 1;  // skip same result
                    }
                    while (j < k && sortedNums[k] == sortedNums[k + 1]) {
                        k -= 1;  // skip same result
                    }
                } else if (sortedNums[j] + sortedNums[k] > target) {
                    k -= 1
                } else {
                    j += 1
                }
            }
            i += 1
        }
        return result
    }
}