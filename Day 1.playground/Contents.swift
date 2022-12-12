import UIKit

let fileURL = Bundle.main.url(forResource: "Input", withExtension: "txt")
let data = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)
let content = data.components(separatedBy: .newlines)

var calorieMapping = [Int: Int]()
var currentElf: Int = 0

for line in content {
    if let calorie = Int(line) {
        calorieMapping[currentElf, default: 0] += calorie
    } else {
        currentElf += 1
    }
}


// MARK: - Part 1

print("The maximum calories an elf has is: \(calorieMapping.values.max() ?? -1)")

// MARK: - Part 2

var sortedValues = calorieMapping.values.sorted().reversed()
var topThree = sortedValues.prefix(3).reduce(0, +)

print("The maximum calories the three elves have are: \(topThree)")
