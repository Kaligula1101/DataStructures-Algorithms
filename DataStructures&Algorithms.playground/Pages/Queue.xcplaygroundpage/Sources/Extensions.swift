import Foundation

extension QueueArray: CustomStringConvertible {
  public var description: String {
    String(describing: array)
  }
}

extension QueueLinkedList: CustomStringConvertible {
  public var description: String {
    String(describing: list)
  }
}

extension QueueRingBuffer: CustomStringConvertible {
  public var description: String {
   String(describing: ringBuffer)
  }
}

extension QueueStack: CustomStringConvertible {
  public var description: String {
    String(describing: leftStack.reversed() + rightStack)
  }
}
