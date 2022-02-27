import Foundation

public class BinaryNode<Element> {
    
    public var value: Element
    public var leftChild: BinaryNode?
    public var rightChild: BinaryNode?
    
    public init(value: Element) {
        self.value = value
    }
}

// MARK: Diagram
extension BinaryNode: CustomStringConvertible {
    
    public var description: String {
        diagram(for: self)
    }
    
    private func diagram(for node: BinaryNode?, _ top: String = "", _ root: String = "", _ bottom: String = "") -> String {
        guard let node = node else {
            return root + "nil\n"
        }
        if node.leftChild == nil && node.rightChild == nil {
            return root + "\(node.value)\n"
        }
        return diagram(for: node.rightChild, top + " ", top + "┌──", top + "│ ") + root + "\(node.value)\n" + diagram(for: node.leftChild, bottom + "│ ", bottom + "└──", bottom + " ")
    }
}

// MARK: Traverse Order Algorithms
extension BinaryNode {
    
    public func traverseInOrder(visit: (Element) -> Void) {
        leftChild?.traverseInOrder(visit: visit)
        visit(value)
        rightChild?.traverseInOrder(visit: visit)
    }
    
    public func traversePreOrder(visit: (Element) -> Void) {
        visit(value)
        leftChild?.traversePreOrder(visit: visit)
        rightChild?.traversePreOrder(visit: visit)
    }
    
    public func traversePostOrder(visit: (Element) -> Void) {
        leftChild?.traversePostOrder(visit: visit)
        rightChild?.traversePostOrder(visit: visit)
        visit(value)
    }
}

// MARK: Challenges

extension BinaryNode {
    // Challenge 1: Height of a Tree
    public func heightOfTree<T>(of node: BinaryNode<T>?) -> Int{
        guard let node = node else {
            return 0
        }
        
        return 1 + max(heightOfTree(of: node.leftChild), heightOfTree(of: node.rightChild))
    }
    
    // Challenge 2: Serialization
    public func serializationPreOrder(visit: (Element?) -> Void) {
        visit(value)
        if let leftChild = leftChild {
            leftChild.serializationPreOrder(visit: visit)
        } else {
            visit(nil)
        }
        if let rightChild = rightChild {
            rightChild.serializationPreOrder(visit: visit)
        } else {
            visit(nil)
        }
    }
}


public func serialize<T>(_ node: BinaryNode<T>) -> [T?] {
    var array: [T?] = []
    node.serializationPreOrder { array.append($0) }
    
    return array
}

public func deserialize<T>(_ array: [T?]) -> BinaryNode<T>? {
    var reversed = Array(array.reversed())
    return deserialize(&reversed)
}

public func deserialize<T>(_ array: inout [T?]) -> BinaryNode<T>? {
    guard !array.isEmpty, let value = array.removeFirst() else {
        return nil
    }
    
    let node = BinaryNode(value: value)
    node.leftChild = deserialize(&array)
    node.rightChild = deserialize(&array)
    
    return node
}
