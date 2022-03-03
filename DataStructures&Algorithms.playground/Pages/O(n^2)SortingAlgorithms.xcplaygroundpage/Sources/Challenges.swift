import Foundation


// Challenge 2. First Duplicate
public func firstDuplicate<T>(_ collection: inout T) -> T.Element? where T: BidirectionalCollection & MutableCollection , T.Element: Comparable, T.Element: Hashable {
    guard collection.count >= 2 else {
        return nil
    }
    
    var check: Set<T.Element> = []
    
    for current in collection.indices {
        var shifting = current
        check.update(with: collection[current])
        
        while shifting > collection.startIndex {
            let previous = collection.index(before: shifting)
            
            if check.contains(collection[shifting]) {
                return collection[shifting]
            }
            shifting = previous
        }
    }
    
    return nil
}

// Challenge 3. Reverse Collection
public func reverse<T>(_ collection: inout T) where T: MutableCollection, T.Element: Comparable {
    guard collection.count >= 2 else {
        return
    }
    
    for end in collection.indices.reversed() {
        var swapped = false
        var current = collection.startIndex
        
        while current < end {
            let next = collection.index(after: current)
            collection.swapAt(current, next)
            swapped = true
            current = next
        }
        if !swapped {
            return
        }
    }
}
