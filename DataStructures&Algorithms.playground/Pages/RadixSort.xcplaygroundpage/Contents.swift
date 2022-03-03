import Foundation


example(of: "radix sort") {
    var array = [88, 410, 1772, 20]
    print("Original array: \(array)")
    array.radixSort()
    print("Radix sorted: \(array)")
}

example(of: "Challenge. Most significant digit") {
    var array: [Int] = (0...10).map { _ in Int(arc4random()) }
    array.lexicographicalSort()
    print(array)
}
