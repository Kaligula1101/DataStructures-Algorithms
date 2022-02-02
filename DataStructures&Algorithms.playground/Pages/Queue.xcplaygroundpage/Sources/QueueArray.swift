import Foundation

public struct QueueArray<T>: Queue {
    var array: [T] = []
    
    public init() {}
    
    public var isEmpty: Bool {
        array.isEmpty
    }
    
    public var peek: T? {
        array.first
    }
    
    public mutating func enqueue(_ element: T) -> Bool { // on average O(1), but worse is O(n) when the copy is performed
        array.append(element)
        
        return true
    }
    
    public mutating func dequeue() -> T? { // O(n)
        array.isEmpty ? nil : array.removeFirst()
    }
}
