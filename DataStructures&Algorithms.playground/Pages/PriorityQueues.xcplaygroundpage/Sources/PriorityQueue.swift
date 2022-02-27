import Foundation

public struct PriorityQueue<Element: Equatable>: Queue {
    private var heap: Heap<Element>
    
    public init(sort: @escaping (Element, Element) -> Bool, elements: [Element] = []) {
        heap = Heap(sort: sort, elements: elements)
    }
    
    public var isEmpty: Bool {
        heap.isEmpty
    }
    public var peek: Element? {
        heap.peek()
    }
    
    public mutating func enqueue(_ element: Element) -> Bool {
        heap.insert(element)
        return true
    }
    public mutating func dequeue() -> Element? {
        heap.remove()
    }
}

public struct ArrayPriorityQueue<Element: Equatable>: Queue {
    private var array: Array<Element>
    
    public init(array: Array<Element>) {
        self.array = array
    }
    
    public var isEmpty: Bool {
        array.isEmpty
    }
    public var peek: Element? {
        array.first
    }
    
    public mutating func enqueue(_ element: Element) -> Bool {
        array.append(element)
        return true
    }
    public mutating func dequeue() -> Element? {
        array.removeLast()
    }
}
