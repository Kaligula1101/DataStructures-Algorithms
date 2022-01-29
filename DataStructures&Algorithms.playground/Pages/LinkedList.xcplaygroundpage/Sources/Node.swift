import Foundation

// Nodes have two responsibilities:
// *Hold a value.
// *Hold a reference to the next node. A nil value represents the end of the list.
public class Node<Value> {
    public var value: Value
    public var next: Node?
    
    public init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}
