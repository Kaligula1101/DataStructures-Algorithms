import Foundation

// LIFO (last-in-first-out)
// A stack’s purpose is to limit the number of ways to access your data
//
// Examples of using stacks:
// *iOS uses the navigation stack to push and pop view controllers into and out of view.
// *Memory allocation uses stacks at the architectural level. Memory for local variables is also managed using a stack.
// *Search and conquer algorithms, such as finding a path out of a maze, use stacks to facilitate backtracking.

public struct Stack<Element> {
    var storage: [Element] = []
    
    public init(_ elements: [Element]) {
        storage = elements
    }
    
    public mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    @discardableResult //allows us to enable case without having to deal with annoying warning
    public mutating func pop() -> Element? {
        storage.popLast()
    }
    
    // return the last element without mutating of storage
    public func peek() -> Element? {
        storage.last
    }
    
    public var isEmpty: Bool {
        peek() == nil
    }
}
