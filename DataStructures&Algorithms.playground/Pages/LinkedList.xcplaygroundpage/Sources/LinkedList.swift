import Foundation

// Linked list is a collection of values arranged in a linear, unidirectional sequence. A linked list has some theoretical advantages over contiguous storage options such as the Swift Array:
// *Constant time insertion and removal from the front of the list.
// *Reliable performance characteristics.

// The unidirectional nature of the linked list means that head-first insertions can ignore the “COW tax"

//Linked lists are linear and unidirectional. As soon as you move a reference from one node to another, you can’t go back.
//Linked lists have a O(1) time complexity for head first insertions. Arrays have O(n) time complexity for head-first insertions.
//Conforming to Swift collection protocols such as Sequence and Collection automatically gives you access to many helpful methods.
//Copy-on-write behavior lets you achieve value semantics while maintaining good performance.

public struct LinkedList<Value> {
    public var head: Node<Value>?
    public var tail: Node<Value>?
    
    public init() {}
    
    // Adding a value at the front of the list, also head-first insertion
    public mutating func push(_ value: Value) {
        copyNodes()
        
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    // Adding a value at the end of the list, known as tail-end insertion
    public mutating func append(_ value: Value) {
        copyNodes()
        
        guard !isEmpty else {
            push(value)
            return
        }
        
        tail!.next = Node(value: value)
        
        tail = tail!.next
    }
    
    public var isEmpty: Bool {
        head == nil
    }
    
    // Finding a particular node in the list
    public func node(at index: Int) -> Node<Value>? {
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil, currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        
        return currentNode
    }
    
    // Inserting the new node
    @discardableResult // ignore the return value of this method without the compiler jumping up and down warning about it.
    public mutating func insert(_ value: Value, after node: Node<Value>) -> Node<Value> {
        copyNodes()
        
        guard tail !== node else {
            append(value)
            return tail!
        }
        
        node.next = Node(value: value, next: node.next)
        
        return node.next!
    }
    
    // Removing a value at the front of the list
    @discardableResult
    public mutating func pop() -> Value? {
        copyNodes()
        
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    // Removing a value at the end of the list
    @discardableResult
    public mutating func removeLast() -> Value? {
        copyNodes()
        
        guard let head = head else {
            return nil
        }
        
        // check if the list has only one element
        guard head.next != nil else {
            return pop()
        }
        
        var prev = head
        var current = head
        
        while let next = current.next {
            prev = current
            current = next
        }
        
        prev.next = nil
        tail = prev
        
        return current.value
    }
    
    public mutating func remove(after node: Node<Value>) -> Value? {
//        guard let node = copyNodes(returningCopyOf: node) else {
//            return nil
//        }
        
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        
        return node.next?.value
    }
    
    // COW value semantics
    private mutating func copyNodes() {
        // avoid O(n) every time
        guard !isKnownUniquelyReferenced(&head) else {
          return
        }
        
        guard var oldNode = head else {
            return
        }
        
        head = Node(value: oldNode.value)
        var newNode = head
        
        while let nextOldNode = oldNode.next {
            newNode!.next = Node(value: nextOldNode.value)
            newNode = newNode!.next
            
            oldNode = nextOldNode
        }
        
        tail = newNode
    }
    
    // special for remove operation
    internal mutating func copyNodes(returningCopyOf node: Node<Value>?) -> Node<Value>? {
        guard !isKnownUniquelyReferenced(&head) else {
            return nil
        }
        
        guard var oldNode = head else {
            return nil
        }
        
        head = Node(value: oldNode.value)
        var newNode = head
        var nodeCopy: Node<Value>?
        
        while let nextOldNode = oldNode.next {
            if oldNode === node {
                nodeCopy = newNode
            }
            newNode!.next = Node(value: nextOldNode.value)
            newNode = newNode!.next
            
            oldNode = nextOldNode
        }
        
        return nodeCopy
    }
    
}
