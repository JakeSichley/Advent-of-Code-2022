import Foundation

public struct WorkAssignment {
    
    // MARK: - Properties
    
    let lowerBound: Int
    let upperBound: Int
    
    // MARK: - Lifecycle
    
    public init?(rawInput: String) {
        let bounds = rawInput.split(separator: "-")
        
        guard bounds.count == 2,
              let lower = Int(bounds[0]),
              let upper = Int(bounds[1]) else {
            return nil
        }
        
        self.lowerBound = lower
        self.upperBound = upper
    }
    
    // MARK: - Helper Functions
    
    public func includes(otherAssignment: WorkAssignment) -> Bool {
        return lowerBound <= otherAssignment.lowerBound && upperBound >= otherAssignment.upperBound
    }
    
    public func partiallyIncludes(otherAssignment: WorkAssignment) -> Bool {
        return lowerBound <= otherAssignment.lowerBound && upperBound >= otherAssignment.lowerBound
    }
}

public class WorkPairs {
    
    // MARK: - Properties
    
    let workGroupOne: WorkAssignment
    let workGroupTwo: WorkAssignment
    
    public var workAssignmentsOverlap: Bool {
        return workGroupOne.includes(otherAssignment: workGroupTwo) || workGroupTwo.includes(otherAssignment: workGroupOne)
    }
    
    public var workAssignmentsPartiallyOverlap: Bool {
        return workGroupOne.partiallyIncludes(otherAssignment: workGroupTwo) ||
            workGroupTwo.partiallyIncludes(otherAssignment: workGroupOne)
    }
    
    // MARK: - Lifecycle
    
    public init?(rawInput: String) {
        let components = rawInput.split(separator: ",")
        
        guard components.count == 2,
              let groupOne = WorkAssignment(rawInput: String(components[0])),
              let groupTwo = WorkAssignment(rawInput: String(components[1])) else {
            return nil
        }
        
        self.workGroupOne = groupOne
        self.workGroupTwo = groupTwo
    }
}
