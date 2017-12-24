// https://leetcode.com/problems/longest-common-prefix/description/

extension Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard strs.count > 0 && strs[0].count > 0 else {
            return ""
        }
        var pre = strs[0]
        for str in strs[1...] {
            guard str.count > 0 else {
                return ""
            }
            while str.range(of: pre)?.lowerBound != str.startIndex {
                if pre == "" {
                    break
                }    
                let endIndex = pre.index(pre.endIndex, offsetBy: -1)
                pre = String(pre[..<endIndex])
            }
        }
        return pre
    }
}