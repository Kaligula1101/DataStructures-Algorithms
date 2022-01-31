import Foundation

// Queues use FIFO or first-in first-out ordering, meaning the first element added will always be the first to be removed. Queues are handy when you need to maintain the order of your elements to process later.
public protocol Queue {
    associatedtype Element
    
    // Insert an element at the back of the queue. Returns true if the operation was successful
    mutating func enqueue(_ element: Element) -> Bool
    // Remove the element at the front of the queue and return it
    mutating func dequeue() -> Element?
    
    var isEmpty: Bool { get }
    // Return the element at the front of the queue without removing it
    var peek: Element? { get }
}

