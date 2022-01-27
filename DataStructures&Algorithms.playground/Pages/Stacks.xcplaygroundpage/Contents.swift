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

// MARK: Challenges

// Challenge #1
// Create a function that uses a stack to print the contents of an array in reversed order
func reverse1<T>(_ array: [T]) {
    guard !array.isEmpty else { return }
    
    var newArray = array
    var stack = Stack([])
    
    for _ in newArray {
        stack.push(newArray.popLast()!)
    }
    
    print(stack)
}

func reverse2<T>(_ array: [T]) {
    var stack = Stack<T>()
    
    for value in array {
        stack.push(value)
    }
    
    while let value = stack.pop() {
        print(value)
    }
}

reverse1([1, 2, 3, 4])
reverse2([1, 2, 3, 4])

// Challenge #2
// Check for balanced parentheses. Given a string, check if there are ( and ) characters, and return true if the parentheses in the string are balanced
func checkParentheses1(_ string: String) -> Bool {
    guard string != "" else { return true }
    
    var stack = Stack<Character>()
    var countStart = 0
    var countEnd = 0
    
    for character in string {
        if character == "(" || character == ")" {
            stack.push(character)
        }
    }
    
    while let character = stack.pop() {
        if character == ")" {
            if stack.isEmpty {
                return false
            }
            countEnd += 1
        } else if character == "(" {
            countStart += 1
        }
    }
    
    print(countStart)
    if countStart != countEnd {
        return false
    }
    
    return true
}

func checkParentheses2(_ string: String) -> Bool {
    var stack = Stack<Character>()
    
    for character in string {
        if character == "(" {
            stack.push(character)
        } else if character == ")" {
            if stack.isEmpty {
                return false
            } else {
                stack.pop()
            }
        }
    }
    
    return stack.isEmpty
}

print(checkParentheses1(")(some"))
print(checkParentheses2("((some)"))
