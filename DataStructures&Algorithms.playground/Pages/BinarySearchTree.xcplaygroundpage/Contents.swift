import Foundation

var exampleTree: BinarySearchTree<Int> {
    var bst = BinarySearchTree<Int>()
    bst.insert(3)
    bst.insert(1)
    bst.insert(4)
    bst.insert(0)
    bst.insert(2)
    bst.insert(5)
    return bst
}

example(of: "building a BST") {
    print(exampleTree)
}

example(of: "finding a node") {
    if exampleTree.contains(5) {
        print("Found 5!")
    } else {
        print("Couldn’t find 5")
    }
}

example(of: "removing a node") {
    var tree = exampleTree
    print("Tree before removal:")
    print(tree)
    tree.remove(3)
    print("Tree after removing root:")
    print(tree)
}

example(of: "Challenge 1") {
    let tree = exampleTree
    print(tree.root?.isBinarySearchTree ?? "No")
}

example(of: "Challenge 2") {
    var tree1 = BinarySearchTree<Int>()
    tree1.insert(18)
    tree1.insert(100)
    tree1.insert(-12)
    
    var tree2 = BinarySearchTree<Int>()
    tree2.insert(18)
    tree2.insert(100)
    tree2.insert(-12)
    
    print(tree1 == tree2)
}

example(of: "Challenge 3") {
    var tree1 = BinarySearchTree<Int>()
    tree1.insert(18)
    tree1.insert(100)
    tree1.insert(-12)
    
    var tree2 = BinarySearchTree<Int>()
    tree2.insert(18)
    tree2.insert(100)
    tree2.insert(-12)
    tree2.insert(10)
    
    print(tree2.contains(tree1))
}
