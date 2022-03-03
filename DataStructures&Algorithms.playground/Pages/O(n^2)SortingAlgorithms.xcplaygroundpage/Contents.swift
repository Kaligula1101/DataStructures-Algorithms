example(of: "bubble sort") {
    var array = [9, 4, 10, 3]
    print("Original: \(array)")
    bubbleSort(&array)
    print("Bubble sorted: \(array)")
}

example(of: "selection sort") {
    var array = [9, 4, 10, 3]
    print("Original: \(array)")
    selectionSort(&array)
    print("Selection sorted: \(array)")
}

example(of: "insertion sort") {
    var array = [9, 4, 10, 3]
    print("Original: \(array)")
    insertionSort(&array)
    print("Insertion sorted: \(array)")
}

example(of: "Challenge 2. First Duplicate") {
    var array = [9, 4, 10, 4, 3]
    print("Original: \(array)")
    print(firstDuplicate(&array) ?? "Nothing")
}
example(of: "Challenge 3. Reverse Collection") {
    var array = [9, 4, 10, 3]
    print("Original: \(array)")
    reverse(&array)
    print("Reverse: \(array)")
}
