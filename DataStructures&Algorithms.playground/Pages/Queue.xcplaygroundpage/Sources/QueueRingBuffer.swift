import Foundation

public struct QueueRingBuffer<T>: Queue {
    var ringBuffer: RingBuffer<T>
    
    // Must include a count parameter since the ring buffer has a fixed size
    public init(count: Int) {
        ringBuffer = RingBuffer<T>(count: count)
    }
    
    public var isEmpty: Bool {
        ringBuffer.isEmpty
    }
    
    public var peek: T? {
        ringBuffer.first
    }
    
    public mutating func enqueue(_ element: T) -> Bool { // O(1)
        ringBuffer.write(element)
    }
    
    public mutating func dequeue() -> T? {
        ringBuffer.read()
    }
}

// The ring buffer-based queue has the same time complexity for enqueue and dequeue as the linked list implementation. The only difference is the space complexity. The ring buffer has a fixed size, which means that enqueue can fail.
