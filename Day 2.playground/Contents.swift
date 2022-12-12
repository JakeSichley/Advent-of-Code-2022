import UIKit


let fileURL = Bundle.main.url(forResource: "Input", withExtension: "txt")
let data = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)
let content = data.components(separatedBy: .newlines)

// MARK: - Part 1

var Strategy_Guide: [String: RockPaperScissors] = [
    "A": .Rock,
    "B": .Paper,
    "C": .Scissors,
    "X": .Rock,
    "Y": .Paper,
    "Z": .Scissors,
]

var totalScore: Int = 0

for line in content {
    let components = line.components(separatedBy: " ")
    if components.count != 2 { break }
    
    let opponentMove = Strategy_Guide[components[0]]
    let suggestedMove = Strategy_Guide[components[1]]
    
    guard let opponentMove = opponentMove, let suggestedMove = suggestedMove else { continue }
    
    totalScore += suggestedMove.rawValue + suggestedMove.getOutcome(other: opponentMove).rawValue
}

print("The total score is: \(totalScore)")


// MARK: - Part 2

Strategy_Guide = [
    "A": .Rock,
    "B": .Paper,
    "C": .Scissors,
]

let Result_Guide: [String: Outcome] = [
    "X": .Lose,
    "Y": .Draw,
    "Z": .Win
]

totalScore = 0

for line in content {
    let components = line.components(separatedBy: " ")
    if components.count != 2 { break }
    
    let opponentMove = Strategy_Guide[components[0]]
    let outcome = Result_Guide[components[1]]
    
    guard let opponentMove = opponentMove, let outcome = outcome else { continue }
        
    totalScore += outcome.rawValue + opponentMove.getInput(result: outcome).rawValue
}

print("The total score with the actual guide is: \(totalScore)")
