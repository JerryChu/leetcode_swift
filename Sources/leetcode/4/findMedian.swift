// https://leetcode.com/problems/median-of-two-sorted-arrays/description/

extension Solution {
    // reference: https://leetcode.com/problems/median-of-two-sorted-arrays/discuss/
    
    // i + j == m - i + n - j + 1  // assume n + m is odd
    // let n >= m
    // then i = 0 ~ m, j = (m + n) / 2 - i
    // find i = 0 ~ m, where B[j-1] <= A[i] && A[i-1] <= B[j]
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var (A, B) = (nums1, nums2)
        var (m, n) = (A.count, B.count)
        if (m > n) {
            (A, B, m, n) = (B, A, n, m)
        }
        if n == 0 {
            print("Invalid input!")
            return 0.0  // invalid input
        }

        var (imin, imax, half) = (0, m, (m + n + 1) / 2)
        var i = 0, j = 0, left_max = 0, right_min = 0
        while imin <= imax {
            i = (imin + imax) / 2
            j = half - i
            if i < m && B[j - 1] > A[i] {
                imin = i + 1
            } else if i > 0 && A[i - 1] > B[j] {
                imax = i - 1
            } else {
                if i == 0 {
                    left_max = B[j - 1]
                } else if j == 0 {
                    left_max = A[i - 1]
                } else {
                    left_max = max(B[j - 1], A[i - 1])
                }

                if (m + n) % 2 == 1 {
                    return Double(left_max)
                }

                if i == m {
                    right_min = B[j]
                } else if j == n {
                    right_min = A[i]
                } else {
                    right_min = min(B[j], A[i])
                }
                return Double(left_max + right_min) / 2.0
            }
        }
        print("Failed to find the median!")
        return 0.0
    }


    // O(n+m)
    /*
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var combined = [Int]()
        var (i, j) = (0, 0)
        while i < nums1.count || j < nums2.count {
            if i < nums1.count && j < nums2.count {
                if nums1[i] <= nums2[j] {
                    combined.append(nums1[i])
                    i += 1                
                } else {
                    combined.append(nums2[j])
                    j += 1
                }
            } else if (i < nums1.count) {
                combined.append(nums1[i])
                i += 1                                
            } else {
                combined.append(nums2[j])
                j += 1                
            }
        }
        var result: Double = 0
        if combined.count == 0 {
            result = 0
        } else if combined.count == 1 {
            result = Double(combined[0])
        } else if combined.count % 2 == 0 {
            result = Double(combined[combined.count / 2] + combined[combined.count / 2 - 1]) / 2.0
        } else {
            result = Double(combined[(combined.count - 1) / 2])
        }
        return result
    }
    */
}