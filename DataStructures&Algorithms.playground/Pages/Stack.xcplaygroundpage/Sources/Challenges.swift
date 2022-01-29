import Foundation

// Challenge #1
// Create a function that uses a stack to print the contents of an array in reversed order
func reverse1<T>(_ array: [T]) {
    guard !array.isEmpty else { return }
    
    var newArray = array
    var stack = Stack([])
    
    for _ in newArray {
        stack.push(newArray.popLast()!)
    }
    
    print(stack)
}

func reverse2<T>(_ array: [T]) {
    var stack = Stack<T>()
    
    for value in array {
        stack.push(value)
    }
    
    while let value = stack.pop() {
        print(value)
    }
}

// Challenge #2
// Check for balanced parentheses. Given a string, check if there are ( and ) characters, and return true if the parentheses in the string are balanced
func checkParentheses1(_ string: String) -> Bool {
    guard string != "" else { return true }
    
    var stack = Stack<Character>()
    var countStart = 0
    var countEnd = 0
    
    for character in string {
        if character == "(" || character == ")" {
            stack.push(character)
        }
    }
    
    while let character = stack.pop() {
        if character == ")" {
            if stack.isEmpty {
                return false
            }
            countEnd += 1
        } else if character == "(" {
            countStart += 1
        }
    }
    
    if countStart != countEnd {
        return false
    }
    
    return true
}

func checkParentheses2(_ string: String) -> Bool {
    var stack = Stack<Character>()
    
    for character in string {
        if character == "(" {
            stack.push(character)
        } else if character == ")" {
            if stack.isEmpty {
                return false
            } else {
                stack.pop()
            }
        }
    }
    
    return stack.isEmpty
}
