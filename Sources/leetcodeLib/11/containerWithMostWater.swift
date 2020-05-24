// https://leetcode.com/problems/container-with-most-water/description/

extension Solution {
    func maxArea(_ height: [Int]) -> Int {
        var from = 0, to = height.count - 1
        var maxSize = 0
        while from < to {
            maxSize = max(maxSize, min(height[from], height[to]) * (to - from))
            if height[from] < height[to] {
                from += 1
            } else {
                to -= 1
            }
        }
        return maxSize
    }
}
