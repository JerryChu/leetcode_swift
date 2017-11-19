extension Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        var i = 0
        while i < nums.count {
            if let complement = dict[nums[i]] {  
                return [complement, i]
            } else {
                dict[target - nums[i]] = i              
            }
            i += 1
        }
        return []
    }
}