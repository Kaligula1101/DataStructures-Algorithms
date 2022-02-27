import Foundation


public struct Heap<Element: Equatable> {
    public var elements: [Element] = []
    public let sort: (Element, Element) -> Bool
    
    public init(sort: @escaping (Element, Element) -> Bool, elements: [Element] = []) {
        self.sort = sort
        self.elements = elements
        
        buildHeap()
    }
    
    public var isEmpty: Bool {
        elements.isEmpty
    }
    public var count: Int {
        elements.count
    }
    
    public func peek() -> Element? {
        elements.first
    }
    
    func leftChildIndex(ofParentAt index: Int) -> Int {
        (2 * index) + 1
    }
    
    func rightChildIndex(ofParentAt index: Int) -> Int {
        (2 * index) + 2
    }
    
    func parentIndex(ofChildAt index: Int) -> Int {
        (index - 1) / 2
    }
    
    private mutating func buildHeap() {
        if !elements.isEmpty {
            for i in stride(from: elements.count / 2 - 1, through: 0, by: -1) {
                siftDown(from: i)
            }
        }
    }
    
    // The overall complexity of remove() is O(log n).
    // Swapping elements in an array takes only O(1) while sifting down elements in a heap takes O(log n) time.
    public mutating func remove() -> Element? {
        guard !isEmpty else {
            return nil
        }
        elements.swapAt(0, count - 1)
        defer {
            siftDown(from: 0)
        }
        return elements.removeLast()
    }
    
    public mutating func siftDown(from index: Int) {
        var parent = index
        
        while true {
            let left = leftChildIndex(ofParentAt: parent)
            let right = rightChildIndex(ofParentAt: parent)
            
            var candidate = parent
            
            if left < count && sort(elements[left], elements[candidate]) {
                candidate = left
            }
            if right < count && sort(elements[right], elements[candidate]) {
                candidate = right
            }
            if candidate == parent {
                return
            }
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
    
    // The overall complexity of insert(_:) is O(log n).
    // Appending an element in an array takes only O(1) while sifting up elements in a heap takes O(log n).
    public mutating func insert(_ element: Element) {
        elements.append(element)
        siftUp(from: elements.count - 1)
    }
    
    private mutating func siftUp(from index: Int) {
        var child = index
        var parent = parentIndex(ofChildAt: child)
        
        while child > 0 && sort(elements[child], elements[parent]) {
            elements.swapAt(child, parent)
            child = parent
            parent = parentIndex(ofChildAt: child)
        }
    }
    
    public mutating func remove(at index: Int) -> Element? {
        guard index < elements.count else {
            return nil
        }
        
        if index == elements.count - 1 {
            return elements.removeLast()
        } else {
            elements.swapAt(index, elements.count - 1)
            defer {
                siftDown(from: index)
                siftUp(from: index)
            }
            return elements.removeLast()
        }
    }
    
    private func index(of element: Element, startingAt i: Int) -> Int? {
        if i >= count {
            return nil
        }
        if sort(element, elements[i]) {
            return nil
        }
        if element == elements[i] {
            return i
        }
        if let j = index(of: element, startingAt: leftChildIndex(ofParentAt: i)) {
            return j
        }
        if let j = index(of: element, startingAt: rightChildIndex(ofParentAt: i)) {
            return j
        }
        return nil
    }
    
    public mutating func merge(_ heap: Heap) {
        elements = elements + heap.elements
        buildHeap()
    }
}

public func getNthSmallestElement(n: Int, elements: [Int]) -> Int? {
    var heap = Heap(sort: <, elements: elements)
    var current = 1
    while !heap.isEmpty {
        let element = heap.remove()
        if current == n {
            return element
        }
        current += 1
    }
    return nil
}

func leftChildIndex(ofParentAt index: Int) -> Int {
    (2 * index) + 1
}

func rightChildIndex(ofParentAt index: Int) -> Int {
    (2 * index) + 2
}

public func isMinHeap<Element: Comparable> (elements: [Element]) -> Bool {
    guard !elements.isEmpty else {
        return true
    }
    
    for i in stride(from: elements.count / 2 - 1, through: 0, by: -1) {
        let left = leftChildIndex(ofParentAt: i)
        let right = rightChildIndex(ofParentAt: i)
        if elements[left] < elements[i] {
            return false
        }
        
        if right < elements.count && elements[right] < elements[i]  {
            return false
        }
    }
    
    return true
}
