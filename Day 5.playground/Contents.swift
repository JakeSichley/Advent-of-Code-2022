import UIKit

let fileURL = Bundle.main.url(forResource: "Input", withExtension: "txt")
let data = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)
let content = data.components(separatedBy: .newlines)

var labelIndex: Int = 0
var rowCount: Int = 0

// find the row where the columns are numbered
// extract this row number since it marks the break between columns and instructions
// we can also use this line to get the total number of columns to adjust padding below
for (index, line) in content.enumerated() {
    if line.allSatisfy({ $0.isNumber || $0.isWhitespace }) {
        let rowIndicies = line.trimmingCharacters(in: .whitespacesAndNewlines).split(separator: " ")
        rowCount = Int(rowIndicies.last ?? "0") ?? 0
        labelIndex = index
        break
    }
}

assert(labelIndex != 0 && rowCount != 0)

var crateRows = [[String]]()
var instructions: [Instruction] = content.suffix(from: labelIndex + 1).compactMap { Instruction(rawInput: $0) }

for line in content.prefix(upTo: labelIndex) {
    var paddedLine = line
    
    // if the row doesn't have $rowCount elements, add padding to allow for equal chunking
    if paddedLine.count < rowCount * 4 - 1 {
        paddedLine.append(String(Array(repeating: " ", count: rowCount * 4 - 1 - paddedLine.count)))
    }
    
    crateRows.append(Array(paddedLine).chunked(into: 4).map { String($0) })
}

crateRows = crateRows.transposed()

for (index, row) in crateRows.enumerated() {
    // trim extra whitespace (ex: "[N] ")
    crateRows[index] = row.map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
    crateRows[index].removeAll(where: { $0.isEmpty })
    crateRows[index].reverse()
}

func executeCrateInstructions(crates: [[String]], instructions: [Instruction], partOne: Bool) -> String {
    // the only difference between part one and two is whether the collection of crates to move needs to be reversed
    
    var mutableCrates = crates
    
    for instruction in instructions {
        var cratesToMove = mutableCrates[instruction.from - 1].suffix(instruction.quantity)
        
        if partOne {
            cratesToMove.reverse()
        }
        
        mutableCrates[instruction.to - 1].append(contentsOf: cratesToMove)
        mutableCrates[instruction.from - 1].removeLast(min(instruction.quantity, mutableCrates[instruction.from - 1].count))
    }
    
    var topCrates: String = ""

    for row in mutableCrates {
        guard let lastCrate = row.last else { continue }
        
        topCrates.append(lastCrate[lastCrate.index(lastCrate.startIndex, offsetBy: 1)])
    }
    
    return topCrates
}

print("The top crates for CrateMover 9000 are \(executeCrateInstructions(crates: crateRows, instructions: instructions, partOne: true))")
print("The top crates for CrateMover 9001 are \(executeCrateInstructions(crates: crateRows, instructions: instructions, partOne: false))")
