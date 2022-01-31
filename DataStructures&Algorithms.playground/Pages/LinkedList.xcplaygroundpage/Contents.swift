import Foundation

example(of: "creating and linking nodes") {
    let node1 = Node(value: 1)
    let node2 = Node(value: 2)
    let node3 = Node(value: 3)

    node1.next = node2
    node2.next = node3

    print(node1)
}

example(of: "push") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)

    print(list)
}

example(of: "append") {
    var list = LinkedList<Int>()
    list.append(1)
    list.append(2)
    list.append(3)

    print(list)
}

example(of: "insert") {
    var list = LinkedList<Int>()
    list.append(1)
    list.append(2)
    list.append(3)

    print("Before inserting: \(list)")

    var middleNode = list.node(at: 1)!
    middleNode = list.insert(0, after: middleNode)

    print("After inserting: \(list)")
}

example(of: "pop") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)

    print("Before popping list: \(list)")
    let poppedValue = list.pop()
    print("After popping list: \(list)")
    print("Popped value: " + String(describing: poppedValue))
}

example(of: "removing the last node") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)

    print("Before removing last node: \(list)")
    let removedValue = list.removeLast()

    print("After removing last node: \(list)")
    print("Removed value: " + String(describing: removedValue))
}

example(of: "removing a node after a particular node") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)

    print("Before removing at particular index: \(list)")
    let index = 1
    let node = list.node(at: index - 1)!
    let removedValue = list.remove(after: node)

    print("After removing at index \(index): \(list)")
    print("Removed value: " + String(describing: removedValue))
}

example(of: "using collection") {
    var list = LinkedList<Int>()
    for i in 0...9 {
        list.append(i)
    }

    print("List: \(list)")
    print("First element: \(list[list.startIndex])")
    print("Array containing first 3 elements: \(Array(list.prefix(3)))")
    print("Array containing last 3 elements: \(Array(list.suffix(3)))")

    let sum = list.reduce(0, +)
    print("Sum of all values: \(sum)")
}

example(of: "linked list cow") {
    var list1 = LinkedList<Int>()
    list1.append(1)
    list1.append(2)
    print("List1 uniquely referenced: \(isKnownUniquelyReferenced(&list1.head))")
    var list2 = list1
    print("List1 uniquely referenced: \(isKnownUniquelyReferenced(&list1.head))")
    print("List1: \(list1)")
    print("List2: \(list2)")

    print("After appending 3 to list2")
    list2.append(3)
    print("List1: \(list1)")
    print("List2: \(list2)")
}

example(of: "challenge 1 - reverse 1") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)

    print("Original list: \(list)")

    print("Printing in reverse:")
    print(reverse1(list))
}

example(of: "challenge 1 - reverse 2") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)

    print("Original list: \(list)")
    print("Printing in reverse:")
    reverse2(list)
}

example(of: "challenge 2 - getMiddleNodeValue1") {
    var list = LinkedList<Int>()
    list.push(4)
    list.push(3)
    list.push(2)
    list.push(1)

    print(getMiddleNodeValue1(list)!)
}

example(of: "challenge 2 - getMiddleNodeValue2 (Node)") {
    var list = LinkedList<Int>()
    list.push(4)
    list.push(3)
    list.push(2)
    list.push(1)

    print(list)

    if let middleNode = getMiddleNodeValue2(list) {
        print(middleNode)
    }
}

example(of: "challenge 3 - reverse1") {
    var list = LinkedList<Int>()
    list.push(4)
    list.push(3)
    list.push(2)
    list.push(1)

    print("Original list: \(list)")

    print("Reversed list:")
    print(getReversed1(list))
}

example(of: "challenge 4 - getMergedSortedList1") {
    var firstList = LinkedList<Int>()
    firstList.push(9)
    firstList.push(4)
    firstList.push(2)
    firstList.push(0)

    print("First list:")

    var secondList = LinkedList<Int>()

    secondList.push(8)
    secondList.push(5)
    secondList.push(3)
    secondList.push(1)

    print("Second list:")

    print("Merged and Sorted list:")
    print(getMergedSortedList1(firstList, secondList))
}

example(of: "challenge 4 - getMergedSortedList2") {
    var firstList = LinkedList<Int>()
    firstList.push(9)
    firstList.push(4)
    firstList.push(2)
    firstList.push(0)

    print("First list:")

    var secondList = LinkedList<Int>()

    secondList.push(8)
    secondList.push(5)
    secondList.push(3)
    secondList.push(1)

    print("Second list:")

    print("Merged and Sorted list:")
    print(getMergedSortedList2(firstList, secondList))
}

example(of: "challenge 5 - removeAllOccurrences1") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(1)
    list.push(2)
    list.push(2)
    list.push(1)
    list.push(0)

    print("Before removing all occurences: \(list)")
    let element = 1
    list.removeAllOccurrences1(of: element)

    print("After removing \(element) from \(list)")
}

example(of: "challenge 5 - removeAllOccurrences2") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(1)
    list.push(2)
    list.push(2)
    list.push(1)
    list.push(1)
    list.push(1)
    list.push(0)

    print("Before removing all occurences: \(list)")
    let element = 1
    list.removeAllOccurrences2(of: element)

    print("After removing \(element) from \(list)")
}
