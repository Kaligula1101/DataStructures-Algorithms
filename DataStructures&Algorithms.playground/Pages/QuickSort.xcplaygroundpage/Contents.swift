example(of: "QuickSortNaive") {
    let list = [12, 0, 3, 9, 2, 21, 18, 27, 1, 5, 8, -1, 8]
    quicksortNaive(list)
    print(list)
}

example(of: "QuickSortLomuto") {
    var list = [12, 0, 3, 9, 2, 21, 18, 27, 1, 5, 8, -1, 8]
    quicksortLomuto(&list, low: 0, high: list.count - 1)
    print(list)
}

example(of: "QuickSortHoare") {
    var list = [12, 0, 3, 9, 2, 21, 18, 27, 1, 5, 8, -1, 8]
    quicksortHoare(&list, low: 0, high: list.count - 1)
    print(list)
}

example(of: "QuickSortMedian") {
    var list = [12, 0, 3, 9, 2, 21, 18, 27, 1, 5, 8, -1, 8]
    quickSortMedian(&list, low: 0, high: list.count - 1)
    print(list)
}

example(of: "QuckSortDutchFlag") {
    var list = [12, 0, 3, 9, 2, 21, 18, 27, 1, 5, 8, -1, 8]
    quicksortDutchFlag(&list, low: 0, high: list.count - 1)
    print(list)
}
