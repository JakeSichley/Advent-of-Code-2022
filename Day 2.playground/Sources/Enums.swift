import Foundation

public enum Outcome: Int {
    case Lose = 0
    case Draw = 3
    case Win = 6
}

public enum RockPaperScissors: Int {
    case Rock = 1
    case Paper
    case Scissors
    
    public func getOutcome(other: RockPaperScissors) -> Outcome {
        switch self {
        case .Rock:
            switch other {
            case .Rock:
                return .Draw
            case .Paper:
                return .Lose
            case .Scissors:
                return . Win
            }
        case .Paper:
            switch other {
            case .Rock:
                return .Win
            case .Paper:
                return .Draw
            case .Scissors:
                return .Lose
            }
        case .Scissors:
            switch other {
            case .Rock:
                return .Lose
            case .Paper:
                return .Win
            case .Scissors:
                return .Draw
            }
        }
    }
    
    public func getInput(result: Outcome) -> RockPaperScissors {
        switch self {
        case .Rock:
            switch result {
            case .Lose:
                return .Scissors
            case .Draw:
                return .Rock
            case .Win:
                return .Paper
            }
        case .Paper:
            switch result {
            case .Lose:
                return .Rock
            case .Draw:
                return .Paper
            case .Win:
                return .Scissors
            }
        case .Scissors:
            switch result {
            case .Lose:
                return .Paper
            case .Draw:
                return .Scissors
            case .Win:
                return .Rock
            }
        }
    }
}
