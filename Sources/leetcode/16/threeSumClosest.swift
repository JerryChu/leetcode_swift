// https://leetcode.com/problems/3sum-closest/

extension Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        if nums.count < 3 {
            return nums.reduce(0, +)
        }

        let sortedNum = nums.sorted {$0 < $1}
        var result = nums[0] + nums[1] + nums[2]
        var i = 0
        var found = false
        while i < sortedNum.count {
            let partialTarget = target - sortedNum[i]
            var j = i + 1, k = sortedNum.count - 1
            // print("outer loop i ->", i)

            while j < k {
                let sum = sortedNum[j] + sortedNum[k]
                result = (abs(result - target) > abs(sortedNum[i] + sum - target)) ? (sortedNum[i] + sum) : result 
                // print("inner loop ->", i, j, k, "=", result)
                
                if sum == partialTarget {
                    result = target
                    // print("founded!", i, j, k, "=", result)
                    found = true
                    break
                } else if sum < partialTarget {
                    j += 1
                } else {
                    k -= 1
                }
            }

            if found {  // assume that each input would have exactly one solution
                break
            }

            i += 1
        }

        return result
    }    
}