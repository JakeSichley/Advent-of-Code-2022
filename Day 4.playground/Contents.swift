import UIKit

let fileURL = Bundle.main.url(forResource: "Input", withExtension: "txt")
let data = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)
let content = data.components(separatedBy: .newlines)

var duplicates: Int = 0
var partialDuplicates: Int = 0

for line in content {
    guard let pairs = WorkPairs(rawInput: line) else { continue }
    
    // MARK: - Part 1
    
    if pairs.workAssignmentsOverlap {
        duplicates += 1
    }
    
    // MARK: - Part 2
    
    if pairs.workAssignmentsPartiallyOverlap {
        partialDuplicates += 1
    }
}

print("\(duplicates) work assignments completely overlap")
print("\(partialDuplicates) work assignments partially overlap")
