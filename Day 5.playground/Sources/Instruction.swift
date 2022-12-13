import Foundation
import RegexBuilder

public class Instruction {
    
    // MARK: - Properties
    
    public let from: Int
    public let to: Int
    public let quantity: Int
    
    // MARK: - Lifecycle
    
    public init?(rawInput: String) {
        var extractedNumbers = [Int]()
        for item in rawInput.split(separator: " ") {
            let part = item.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
            
            if let number = Int(part) {
                extractedNumbers.append(number)
            }
        }
        
        guard extractedNumbers.count == 3 else { return nil }

        self.quantity = extractedNumbers[0]
        self.from = extractedNumbers[1]
        self.to = extractedNumbers[2]
    }
}
