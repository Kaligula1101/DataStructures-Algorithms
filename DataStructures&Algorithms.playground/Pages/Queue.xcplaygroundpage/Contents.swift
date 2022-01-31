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
