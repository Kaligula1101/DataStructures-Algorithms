import Foundation

// Challenge #3
// Imagine that you are playing a game of Monopoly with your friends. The problem is that everyone always forgets whose turn it is! Create a Monopoly organizer that always tells you whose turn it is.

public protocol BoardGameManager {
    associatedtype Player
    mutating func nextPlayer() -> Player?
}

extension QueueRingBuffer: BoardGameManager {
    
    mutating public func nextPlayer() -> T? {
        guard let player = dequeue() else {
            return nil
        }
        
        _ = enqueue(player)
        return player
    }
}

// Challenge #4
// Implement a method to reverse the contents of a queue
extension QueueArray {
    
    mutating public func reversed1() -> QueueArray {
        var queue = self
        var i = queue.array.count - 1
        let countForDeletion = i
        
        while i >= 0 {
            _ = queue.enqueue(queue.array[i])
            i -= 1
        }
        
        for _ in 0...countForDeletion {
            _ = queue.dequeue()
        }
        
        return queue
    }
}

extension QueueArray {
    
    mutating public func reversed2() -> QueueArray {
        var queue = self
        var stack = Stack<T>()
        while let element = queue.dequeue() {
            stack.push(element)
        }
        while let element = stack.pop() {
            _ = queue.enqueue(element)
        }
        return queue
    }
}

// Challenge #5
// A double-ended queue — a.k.a. a deque — is, as its name suggests, a queue where elementscan be added or removed from the front or back.

public enum Direction {
    case front
    case back
}

protocol Deque {
    associatedtype Element
    var isEmpty: Bool { get }
    func peek(from direction: Direction) -> Element?
    mutating func enqueue(_ element: Element,
                          to direction: Direction) -> Bool
    mutating func dequeue(from direction: Direction) -> Element?
}

public struct DequeArray<T>: Deque {
    public typealias Element = T
    var array: [T] = []
    
    public init() {}
    
    public var isEmpty: Bool {
        array.isEmpty
    }
    
    public func peek(from direction: Direction) -> T? {
        switch direction {
        case .front:
            return array.first
        case .back:
            return array.last
        }
    }
    
    public mutating func enqueue(_ element: T, to direction: Direction) -> Bool {
        switch direction {
        case .front:
            array.insert(element, at: 0)
        case .back:
            array.append(element)
        }
        return true
    }
    
    public mutating func dequeue(from direction: Direction) -> T? {
        guard !isEmpty else {
            return nil
        }
        
        switch direction {
        case .front:
            return array.remove(at: 0)
        case .back:
            return array.removeLast()
        }
    }
}

public struct DequeRingBuffer<T>: Deque {
    public typealias Element = T
    var ringBuffer: RingBuffer<T>
    
    public init(count: Int) {
        ringBuffer = RingBuffer<T>(count: count)
    }
    
    public var isEmpty: Bool {
        ringBuffer.isEmpty
    }
    
    public func peek(from direction: Direction) -> T? {
        switch direction {
        case .front:
            return ringBuffer.first
        case .back:
            return ringBuffer.last
        }
    }
    
    public mutating func enqueue(_ element: Element, to direction: Direction) -> Bool {
        switch direction {
        case .front:
            _ = ringBuffer.write(element)
        case .back:
            _ = ringBuffer.writeBack(element)
        }
        return true
    }
    
    public mutating func dequeue(from direction: Direction) -> T? {
        guard !isEmpty else {
            return nil
        }
        
        switch direction {
        case .front:
            return ringBuffer.read()
        case .back:
            return ringBuffer.readBack()
        }
    }
}

extension RingBuffer {
    public var last: T? {
        array[array.count - 1]
    }
    
    public mutating func writeBack(_ element: T) -> Bool {
        if !isFull {
            array[writeIndexBack % array.count] = element
            writeIndex -= 1
            return true
        } else {
            return false
        }
    }
    
    public mutating func readBack() -> T? {
        if !isEmpty {
            let element = array[readIndexBack % array.count]
            readIndex -= 1
            return element
        } else {
            return nil
        }
    }
}



public struct Stack<Element> {
    
    private var storage: [Element] = []
    
    public init() { }
    
    public init(_ elements: [Element]) {
        storage = elements
    }
    
    public mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
        storage.popLast()
    }
    
    public func peek() -> Element? {
        storage.last
    }
    
    public var isEmpty: Bool {
        peek() == nil
    }
}

extension Stack: CustomDebugStringConvertible {
    public var debugDescription: String {
    """
    ----top----
    \(storage.map { "\($0)" }.reversed().joined(separator: "\n"))
    -----------
    """
    }
}

extension Stack: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: Element...) {
        storage = elements
    }
}
