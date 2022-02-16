import Foundation


example(of: "depth-first traversal") {
    let tree = makeBeverageTree()
    tree.forEachDepthFirst { print($0.value) }
}

example(of: "level-order traversal") {
    let tree = makeBeverageTree()
    tree.forEachLevelOrder { print($0.value) }
}

example(of: "searching for a node") {
    let tree = makeBeverageTree()
    tree.forEachLevelOrder { print($0.value) }
    
    if let searchResult1 = tree.search("ginger ale") {
        print("Found node: \(searchResult1.value)")
    }
    if let searchResult2 = tree.search("WKD Blue") {
        print(searchResult2.value)
    } else {
        print("Couldn't find WKD Blue")
    }
}

// Tree is used in numerous facets of software development, such as:
// - Representing hierarchical relationships.
// - Managing sorted data.
// - Facilitating fast lookup operations.

// - Trees share similarities to linked lists, but a tree node can link to many child nodes where linked-list nodes may only link to one successor node.
// - Every tree node, except for the root node, has exactly one parent node.
// - A root node has no parent nodes.
// - Leaf nodes have no child nodes.
// - Be comfortable with the tree terminology such as parent, child, leaf and root. Many of these terms are common tongue for fellow programmers and will help explain other tree structures.
// - Traversals, such as depth-first and level-order traversals, aren’t specific to the general tree. They work on other kinds of trees, although their implementation will be slightly different based on how the tree is structured.

// By convention,
// a node has a strong ownership relationship with its children
// but a weak non-ownership relationship with its parent

// MARK: Challenges
example(of: "Challenge 1 - print order-level values #1") {
    let tree = makeNumberTree()
    tree.forEachLevelOrder { _ in }
}

func printEachLevel<T>(for tree: TreeNode<T>) {
    var queue = Queue<TreeNode<T>>()
    var nodesLeftInCurrentLevel = 0
    queue.enqueue(tree)
    
    while !queue.isEmpty {
        
        nodesLeftInCurrentLevel = queue.count
        
        while nodesLeftInCurrentLevel > 0 {
            guard let node = queue.dequeue() else { break }
            print("\(node.value) ", terminator: "")
            node.children.forEach { queue.enqueue($0) }
            nodesLeftInCurrentLevel -= 1
        }
        
        print()
    }
}

example(of: "Challenge 1 - print order-level values #2") {
    let tree = makeNumberTree()
    printEachLevel(for: tree)
}


// helpers

func makeBeverageTree() -> TreeNode<String> {
    let tree = TreeNode("Beverages")
    
    let hot = TreeNode("hot")
    let cold = TreeNode("cold")
    
    let tea = TreeNode("tea")
    let coffee = TreeNode("coffee")
    let chocolate = TreeNode("cocoa")
    
    let blackTea = TreeNode("black")
    let greenTea = TreeNode("green")
    let chaiTea = TreeNode("chai")
    
    let soda = TreeNode("soda")
    let milk = TreeNode("milk")
    
    let gingerAle = TreeNode("ginger ale")
    let bitterLemon = TreeNode("bitter lemon")
    
    tree.add(hot)
    tree.add(cold)
    
    hot.add(tea)
    hot.add(coffee)
    hot.add(chocolate)
    
    cold.add(soda)
    cold.add(milk)
    
    tea.add(blackTea)
    tea.add(greenTea)
    tea.add(chaiTea)
    
    soda.add(gingerAle)
    soda.add(bitterLemon)
    
    return tree
}

func makeNumberTree() -> TreeNode<Int> {
    let tree = TreeNode(15)
    
    let one = TreeNode(1)
    let seventeen = TreeNode(17)
    let twenty = TreeNode(20)
    
    let dobuleOne = TreeNode(1)
    let five = TreeNode(5)
    let zero = TreeNode(0)
    
    let two = TreeNode(2)
    
    let doubleFive = TreeNode(5)
    let seven = TreeNode(7)
    
    tree.add(one)
    tree.add(seventeen)
    tree.add(twenty)
    
    one.add(dobuleOne)
    one.add(five)
    one.add(zero)
    
    seventeen.add(two)
    
    twenty.add(doubleFive)
    twenty.add(seven)
    
    return tree
}
