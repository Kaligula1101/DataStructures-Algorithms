example(of: "merge sort") {
    let array = [7, 2, 6, 3, 9]
    print("Original: \(array)")
    print("Merge sorted: \(mergeSort(array))")
}

example(of: "Challenge 1. Speeding up appends") {
    let size = 1024
    var values: [Int] = []
    
    values.reserveCapacity(size) // done
    
    for i in 0 ..< size {
        values.append(i)
    }
}

example(of: "Challenge 2. Merge two sequences") {
    let array1 = [1, 2, 3, 4, 5, 6, 7, 8]
    let array2 = [1, 3, 4, 5, 5, 6, 7, 7]
    for element in merge(first: array1, second: array2) {
        print(element)
    }
}
