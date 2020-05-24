// https://leetcode.com/

import leetcodeLib

if CommandLine.arguments.count == 2 {
    let param = CommandLine.arguments[1]  
    let problem = Problem(rawValue:param)
    if problem != nil {
        Solution.solve(problem)
    } else {
        print("\u{001B}[0;31mUnknown problem! Supported problems are:\u{001B}[0m")
        Problem.allCases.forEach{ print("\($0.rawValue)") }
        print("\n")
    }
} else {
    print("""
    \u{001B}[0;31m
    Invalid parameters!
    Usage: 
        swift run leetcode `problem`
    Example:
        swift run leetcode twoSum
    """)
}
