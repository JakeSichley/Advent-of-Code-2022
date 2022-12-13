import UIKit

let fileURL = Bundle.main.url(forResource: "Input", withExtension: "txt")
let data = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)
let content = data.components(separatedBy: .newlines)

let transmission = Array(content[0])
var marker: Int = 0

// MARK: - Part 1

for i in 0..<transmission.count - 3 {
    var slice = Set(transmission[i...i + 3])
    
    if slice.count == 4 {
        marker = i + 4
        break
    }
}

print("The start of transmission marker is after \(marker) characters")

// MARK: - Part 2
marker = 0

for i in 0..<transmission.count - 13 {
    var slice = Set(transmission[i...i + 13])
    
    if slice.count == 14 {
        marker = i + 14
        break
    }
}

print("The start of message marker is after \(marker) characters")
