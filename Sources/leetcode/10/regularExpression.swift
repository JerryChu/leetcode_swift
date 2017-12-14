// https://leetcode.com/problems/regular-expression-matching/description/

// reference: https://discuss.leetcode.com/topic/40371/easy-dp-java-solution-with-detailed-explanation

/*
1, If p[j] == s[i] :  dp[i][j] = dp[i-1][j-1];
2, If p[j] == '.' : dp[i][j] = dp[i-1][j-1];
3, If p[j] == '*' : 
    1) if p[j-1] != s[i] : dp[i][j] = dp[i][j-2]  //in this case, a* only counts as empty
    2) if p[i-1] == s[i] or p[i-1] == '.':
           dp[i][j] = dp[i-1][j]    //in this case, a* counts as multiple a 
                    or dp[i][j] = dp[i][j-1]   // in this case, a* counts as single a
                    or dp[i][j] = dp[i][j-2]   // in this case, a* counts as empty
*/ 

extension Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let S = Array(s), P = Array(p)

        var dp = Array(repeating: Array(repeating: false, count: P.count + 1), count: S.count + 1)
        dp[0][0] = true

        var j = 0
        while j < P.count {
            if String(P[j]) == "*" && dp[0][j - 1] {
                dp[0][j + 1] = true
            }
            j += 1
        }

        var i = 0
        while i < S.count {
            j = 0
            while j < P.count {
                if String(S[i]) == String(P[j]) || String(P[j]) == "." {
                    dp[i + 1][j + 1] = dp[i][j]
                }
                if String(P[j]) == "*" {
                    if String(S[i]) != String(P[j - 1]) && String(P[j - 1]) != "." {
                        dp[i + 1][j + 1] = dp[i + 1][j - 1]
                    } else {
                        dp[i + 1][j + 1] = dp[i + 1][j] || dp[i][j + 1] || dp[i + 1][j - 1]
                    }
                }
                j += 1
            }
            i += 1
        }
        return dp[S.count][P.count]
    }
}