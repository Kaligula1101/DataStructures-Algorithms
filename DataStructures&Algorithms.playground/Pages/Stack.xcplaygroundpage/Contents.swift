import Foundation

example(of: "using stack") {
    var stack = Stack<Int>([])
    stack.push(1)
    stack.push(2)
    stack.push(3)
    
    print(stack)
    
    if let poppedElement = stack.pop() {
        assert(3 == poppedElement)
        print("Popped: \(poppedElement)")
    }
}

example(of: "initializing a stack from an array") {
    let array = ["a", "b", "c", "d"]
    var stack = Stack(array)
    
    print(stack)
    stack.pop()
}

example(of: "initializing a stack from an array literal") {
    var stack: Stack = [1, 2, 3, 4]
    
    print(stack)
    stack.pop()
}
