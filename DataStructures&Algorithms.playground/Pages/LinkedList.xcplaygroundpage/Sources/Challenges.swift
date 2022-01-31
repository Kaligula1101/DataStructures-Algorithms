import Foundation

// Challenge #1
// Create a function that prints the nodes of a linked list in reverse order.
public func reverse1<Value>(_ list: LinkedList<Value>) -> LinkedList<Value> {
    var reversedList = LinkedList<Value>()
    
    var node = list.head
    
    while node != nil {
        reversedList.push(node!.value)
        node = node!.next
    }
    
    return reversedList
}

public func reverse2<Value>(_ list: LinkedList<Value>) {
    reverse2(list.head)
}

private func reverse2<Value>(_ node: Node<Value>?) {
    // base case
    guard let node = node else { return }
    
    reverse2(node.next)
    print(node.value)
}

// Challenge #2
// Create a function that finds the middle node of a linked list.
public func getMiddleNodeValue1<Value>(_ list: LinkedList<Value>) -> Value? {
    guard var node = list.head else { return nil }
    
    var count = 1
    
    while node.next != nil {
        node = node.next!
        count += 1
    }
    
    return list.node(at: count / 2)!.value
}

public func getMiddleNodeValue2<Value>(_ list: LinkedList<Value>) -> Node<Value>? {
    var slow = list.head
    var fast = list.head
    
    while let nextFast = fast?.next {
        fast = nextFast.next
        slow = slow?.next
    }
    
    return slow
}

// Challenge #3
//Create a function that reverses a linked list. You do this by manipulating the nodes so that they’re linked in the other direction.
public func getReversed1<Value>(_ list: LinkedList<Value>) -> LinkedList<Value> {
    var reversedList = list
    
    reversedList.tail = reversedList.head
    
    var prev = reversedList.head
    var current = reversedList.head?.next
    prev?.next = nil
    
    while current != nil {
        let next = current?.next
        
        current?.next = prev
        prev = current
        current = next
    }
    reversedList.head = prev
    
    return reversedList
}

//Challenge #4
//Create a function that takes two sorted linked lists and merges them into a single sorted linked list. Your goal is to return a new linked list that contains the nodes from two lists in sorted order. You may assume the sort order is ascending.
public func getMergedSortedList1<Value: Comparable>(_ firstList: LinkedList<Value>, _ secondList: LinkedList<Value>) -> LinkedList<Value> {
    var mergedList = LinkedList<Value>()
    
    var nodeOfFirstList = firstList.head
    var nodeOfSecondList = secondList.head
    
    while nodeOfFirstList != nil || nodeOfSecondList != nil {
        if nodeOfFirstList != nil {
            mergedList.append(nodeOfFirstList!.value)
            nodeOfFirstList = nodeOfFirstList!.next
        }
        
        if nodeOfSecondList != nil {
            mergedList.append(nodeOfSecondList!.value)
            nodeOfSecondList = nodeOfSecondList!.next
        }
    }
    
    var nodeOfMergedList = mergedList.head
    var node = mergedList.head
    
    while nodeOfMergedList != nil {
        while node != nil {
            if let next = node!.next?.value, node!.value > next {
                node!.next!.value = node!.value
                node!.value = next
            }
            node = node!.next
        }
        node = mergedList.head
        
        nodeOfMergedList = nodeOfMergedList!.next
    }
    
    
    return mergedList
}

public func getMergedSortedList2<Value: Comparable>(_ left: LinkedList<Value>, _ right: LinkedList<Value>) -> LinkedList<Value> {
    guard !left.isEmpty else {
        return right
    }
    
    guard !right.isEmpty else {
        return left
    }
    
    var newHead: Node<Value>?
    var tail: Node<Value>?
    
    var currentLeft = left.head
    var currentRight = right.head
    
    if let leftNode = currentLeft, let rightNode = currentRight {
        if leftNode.value < rightNode.value {
            newHead = leftNode
            currentLeft = leftNode.next
        } else {
            newHead = rightNode
            currentRight = rightNode.next
        }
        tail = newHead
    }
    
    while let leftNode = currentLeft, let rightNode = currentRight {
        if leftNode.value < rightNode.value {
            tail?.next = leftNode
            currentLeft = leftNode.next
        } else {
            tail?.next = rightNode
            currentRight = rightNode.next
        }
        tail = tail?.next
    }
    
    if let leftNodes = currentLeft {
        tail?.next = leftNodes
    }
    
    if let rightNodes = currentRight {
        tail?.next = rightNodes
    }
    
    var list = LinkedList<Value>()
    list.head = newHead
    list.tail = {
        while let next = tail?.next {
            tail = next
        }
        return tail
    }()
    return list
}

//Challenge #5
//Create a function that removes all occurrences of a specific element from a linked list.
extension LinkedList where Value: Equatable { // not correct
    public mutating func removeAllOccurrences1(of element: Value) {
        var prev = head
        var current = head?.next
        
        while current?.next != nil {
            if current!.next === tail {
                tail = prev
            }
            if current!.value == element {
                let _ = self.remove(after: prev!)
            }
            prev = current
            current = current?.next
        }
    }
}

extension LinkedList where Value: Equatable {
    public mutating func removeAllOccurrences2(of value: Value) {
        while let head = self.head, head.value == value {
            self.head = head.next
        }
        
        var prev = head
        var current = head?.next
        
        while let currentNode = current {
            if currentNode.next == nil {
                tail = prev
            }
            guard currentNode.value != value else {
                prev?.next = currentNode.next
                current = prev?.next
                continue
            }
            
            prev = current
            current = current?.next
        }
        
        tail = prev
    }
}
