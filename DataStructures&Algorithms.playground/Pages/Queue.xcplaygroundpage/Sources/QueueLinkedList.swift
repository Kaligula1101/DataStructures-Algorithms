import Foundation

public class QueueLinkedList<T>: Queue {
    var list = DoublyLinkedList<T>()
    
    public init() {}
    
    public func enqueue(_ element: T) -> Bool { // O(1)
        list.append(element)
        
        return true
    }
    
    public func dequeue() -> T? { // O(1)
        guard !list.isEmpty, let element = list.first else {
            return nil
        }
        
        return list.remove(element)
    }
    
    public var isEmpty: Bool {
        list.isEmpty
    }
    
    public var peek: T? {
        list.first?.value
    }
}

// The main weakness with QueueLinkedList is not apparent from the table. Despite O(1) performance, it suffers from high overhead. Each element has to have extra storage for the forward and back reference. Moreover, every time you create a new element, it requires a relatively expensive dynamic allocation. By contrast, QueueArray does a faster bulk allocation.
