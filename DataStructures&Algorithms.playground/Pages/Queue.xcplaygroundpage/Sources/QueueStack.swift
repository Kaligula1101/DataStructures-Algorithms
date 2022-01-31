import Foundation

public struct QueueStack<T>: Queue {
    var leftStack: [T] = []
    var rightStack: [T] = []
    
    public init() {}
    
    public var isEmpty: Bool {
        leftStack.isEmpty && rightStack.isEmpty
    }
    
    public var peek: T? { // O(1)
        !leftStack.isEmpty ? leftStack.last : rightStack.first
    }
    
    public mutating func enqueue(_ element: T) -> Bool { // O(1)
        rightStack.append(element)
        
        return true
    }
    
    public mutating func dequeue() -> T? { // O(1), But worst-case performance is O(n) when the right queue needs to be reversed or runs out of capacity. Running out of capacity doesn’t happen very often thanks to doubling it every time it happens.
        if leftStack.isEmpty {
            leftStack = rightStack.reversed()
            rightStack.removeAll()
        }
        
        return leftStack.popLast()
    }
    
}

// The idea behind using two stacks is simple. Whenever enqueue an element, it goes in the right stack.
// When need to dequeue an element, reverse the right stack and place it in the left stack so that can retrieve the elements using FIFO order
// Finally, it beats the linked list in terms of spatial locality. This is because array elements are next to each other in memory blocks. So a large number of elements will be loaded in a cache on first access. Even though arrays require O(n), for simple copy operations, it is a very fast O(n) happening close to memory bandwidth
