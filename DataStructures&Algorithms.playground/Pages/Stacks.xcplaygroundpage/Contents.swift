import Foundation

// LIFO (last-in-first-out)
// A stack’s purpose is to limit the number of ways to access your data
//
// Examples of using stacks:
// *iOS uses the navigation stack to push and pop view controllers into and out of view.
// *Memory allocation uses stacks at the architectural level. Memory for local variables is also managed using a stack.
// *Search and conquer algorithms, such as finding a path out of a maze, use stacks to facilitate backtracking.

public struct Stack<Element> {
    private var storage: [Element] = []
    
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

example(of: "using stack") {
    var stack = Stack<Int>([])
    stack.push(1)
    stack.push(2)
    stack.push(3)
    
    print(stack)
    
    if let poppedElement = stack.pop() {
        assert(3 == poppedElement)
        print("Popped: \(poppedElement)")
    }
}

example(of: "initializing a stack from an array") {
    let array = ["a", "b", "c", "d"]
    var stack = Stack(array)
    
    print(stack)
    stack.pop()
}

example(of: "initializing a stack from an array literal") {
    var stack: Stack = [1, 2, 3, 4]
    
    print(stack)
    stack.pop()
}



// MARK: Make stack initializable from an array literal
extension Stack: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: Element...) {
        storage = elements
    }
}

// MARK: Debug Description
extension Stack: CustomDebugStringConvertible {
    public var debugDescription: String {
        """
        ----top----
        \(storage.map { "\($0)" }.reversed().joined(separator: "\n"))
        -----------
        """
      }
}
