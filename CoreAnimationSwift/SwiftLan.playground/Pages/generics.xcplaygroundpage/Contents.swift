//: [Previous](@previous)
/*:
 # 泛型
 */
import Foundation
// question:
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
func swapTwoStrings(_ a: inout String, _ b: inout String) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoDoubles(_ a: inout Double, _ b: inout Double) {
    let temporaryA = a
    a = b
    b = temporaryA
}

// answer:
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt = 3
var anotherInt = 107
swapTwoValues(&someInt, &anotherInt)
// someInt is now 107, and anotherInt is now 3

var someString = "hello"
var anotherString = "world"
swapTwoValues(&someString, &anotherString)
/*:
 ## 泛型类型约束
 */
/*
 func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
 // function body goes here
 }
 */
/*:
 ## 关联类型
 
 */
/*:
 ## 泛型where
 */
func allItemsMatch<C1: Container, C2: Container>
    (_ someContainer: C1, _ anotherContainer: C2) -> Bool
    where C1.Item == C2.Item, C1.Item: Equatable {
        
        // Check that both containers contain the same number of items.
        if someContainer.count != anotherContainer.count {
            return false
        }
        
        // Check each pair of items to see if they're equivalent.
        for i in 0..<someContainer.count {
            if someContainer[i] != anotherContainer[i] {
                return false
            }
        }
        
        // All items match, so return true.
        return true
}
/*
 extension Stack where Element: Equatable {
 func isTop(_ item: Element) -> Bool {
 guard let topItem = items.last else {
 return false
 }
 return topItem == item
 }
 }
 */
protocol ComparableContainer: Container where Item: Comparable { }
protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
    
    associatedtype Iterator: IteratorProtocol where Iterator.Element == Item
    func makeIterator() -> Iterator
}
//: [Next](@next)
