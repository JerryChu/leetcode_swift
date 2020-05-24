// https://leetcode.com/problems/print-words-vertically/

extension Solution {
    func printVertically(_ s: String) -> [String] {
        let array = s.components(separatedBy: " ")
        var longestCount = 0
        var longestIndex = 0
        for (index, element) in array.enumerated() {
            if longestCount <= element.count {
                longestCount = element.count
                longestIndex = index
            }
        }
        print("longestCount: \(longestCount), longestIndex: \(longestIndex)")

        var result = [String]()
        (0..<longestCount).forEach { i in
            var newWord = ""
            for (index, word) in array.enumerated() {
                if i < word.count {
                    let startIndex = word.index(word.startIndex, offsetBy:i)
                    let endIndex = word.index(word.startIndex, offsetBy:i + 1)
                    newWord += String(word[startIndex..<endIndex])
                } else if (index < longestIndex){
                    newWord += " "
                }
            }
            while newWord.last?.isWhitespace == true {
                newWord = String(newWord.dropLast())
            }
            result.append(newWord)  
        }   

        return result
    }
}