//: [Previous](@previous)
/*:
 # 集合
 * Array 有序列表
 * Set  无序列表(元素不重复）
 * Dictionary 字典
 */
import Foundation
/*:
 ## Array 有序列表
 */
var someInts = [Int]()
var threeDoubles = Array(repeating: 0.0, count: 3)
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
var shoppingList: [String] = ["Eggs", "Milk"] //Creating an Array with an Array Literal
/*:
 ----
 ## Set  无序列表(元素不重复）
 * intersection
 * union
 * subtracting
 * symmetricDifference
 */
var letters = Set<Character>()
letters.insert("a")
letters.insert("a")
print("letters is of type Set<Character> with \(letters.count) items.")

/*:
 ----
 ## Dictionary 字典
 */
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]   //Creating a Dictionary with a Dictionary Literal
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}
print(airports["DUB"])

for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}
for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}
for airportName in airports.values {
    print("Airport name: \(airportName)")
}
let airportCodes = [String](airports.keys)

//: [Next](@next)
