import UIKit

let fileURL = Bundle.main.url(forResource: "Input", withExtension: "txt")
let data = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)
let content = data.components(separatedBy: .newlines)


// MARK: - Part 1

var totalPriority: Int = 0

for line in content {
    if line.isEmpty { break }
    
    var arrayLine = Array(line)
    
    var rucksackOne = Set(arrayLine.prefix(upTo: arrayLine.count / 2))
    var rucksackTwo = Set(arrayLine.suffix(from: arrayLine.count / 2))
    
    var intersection = rucksackOne.intersection(rucksackTwo)
    
    guard let overlap = intersection.first, let value = overlap.asciiValue else { continue }
    
    if overlap.isUppercase {
        totalPriority += Int(value) - 38
    } else if overlap.isLowercase {
        totalPriority += Int(value) - 96
    }
}

print("The total priority of the items in the rucksack is: \(totalPriority)")

// MARK: - Part 2

totalPriority  = 0

let groups = content.chunked(into: 3)

for group in groups {
    guard let first = group.first else { continue }
    
    var intersection = group.reduce(Set(first)) {
        $0.intersection(Set($1))
    }
    
    guard let overlap = intersection.first, let value = overlap.asciiValue else { continue }
    
    if overlap.isUppercase {
        totalPriority += Int(value) - 38
    } else if overlap.isLowercase {
        totalPriority += Int(value) - 96
    }
}

print("The total priority of the three-Elf rucksack groups is: \(totalPriority)")
