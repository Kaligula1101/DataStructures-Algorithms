import Foundation

example(of: "QueueArray") {
    var queue = QueueArray<String>()
    queue.enqueue("Ray")
    queue.enqueue("Brian")
    queue.enqueue("Eric")
    print(queue)
    queue.dequeue()
    print(queue)
}

example(of: "QueueLinkedList") {
    let queue = QueueLinkedList<String>()
    queue.enqueue("Ray")
    queue.enqueue("Brian")
    queue.enqueue("Eric")
    print(queue)
    queue.dequeue()
    print(queue)
}

example(of: "QueueRingBuffer") {
    var queue = QueueRingBuffer<String>(count: 10)
    queue.enqueue("Ray")
    queue.enqueue("Brian")
    queue.enqueue("Eric")
    print(queue)
    queue.dequeue()
    print(queue)
}

example(of: "QueueStack") {
    var queue = QueueStack<String>()
    queue.enqueue("Ray")
    queue.enqueue("Brian")
    queue.enqueue("Eric")
    print(queue)
    queue.dequeue()
    print(queue)
}

// Queue takes a FIFO strategy; an element added first must also be removed first.
// Enqueue inserts an element to the back of the queue.
// Dequeue removes the element at the front of the queue.
// Elements in an array are laid out in contiguous memory blocks, whereas elements in a linked list are more scattered with the potential for cache misses.
// Ring-buffer-queue-based implementation is suitable for queues with a fixed size.
// Compared to other data structures, leveraging two stacks improves the dequeue(_:) time complexity to amortized O(1) operation.
// Double-stack implementation beats out linked list in terms of storage locality.

// Challenges

example(of: "Challenge 3 - MonopolyGame") {
    var queue = QueueRingBuffer<String>(count: 4)
    queue.enqueue("Vincent")
    queue.enqueue("Remel")
    queue.enqueue("Lukiih")
    queue.enqueue("Allison")
    print(queue)

    print("===== boardgame =======")
    queue.nextPlayer()
    print(queue)
    queue.nextPlayer()
    print(queue)
    queue.nextPlayer()
    print(queue)
    queue.nextPlayer()
    print(queue)
}

example(of: "Challenge 4 - reversed1") {
    var queue = QueueArray<Int>()
    for i in 1...5 {
        queue.enqueue(i)
    }
    print(queue)
    
    print(queue.reversed1())
}

example(of: "Challenge 4 - reversed2") {
    var queue = QueueArray<Int>()
    for i in 1...5 {
        queue.enqueue(i)
    }
    print(queue)
    
    print(queue.reversed2())
}

example(of: "Challenge 5 - DequeRingBuffer") {
    var deque = DequeArray<Int>()
    deque.enqueue(1, to: .back)
    deque.enqueue(2, to: .back)
    deque.enqueue(3, to: .back)
    deque.enqueue(4, to: .back)

    print(deque)

    deque.enqueue(5, to: .front)

    print(deque)

    deque.dequeue(from: .back)
    deque.dequeue(from: .back)
    deque.dequeue(from: .back)
    deque.dequeue(from: .front)

    print(deque)

}
