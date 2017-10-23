//: [Previous](@previous)

/*:
 # 操作符 (An operator is a special symbol or phrase that you use to check, change, or combine values)
 * 一元操作符  如 -a
 * 二元操作符  如a + b
 * 三元操作符  唯一一个三元操作符 a ? b : c
 */
/*:
 ----
 ## 赋值操作符 =   let a = 10
 */
/*:
 ## 算术操作符  + - * / %(取余）
 */
/*:
 ## 复合赋值操作符
 */
import Foundation
var a = 1
a += 2
/*:
 ----
 ## 关系比较操作符
 *  == !=  <  <=  >  >=
 * operator can’t be applied to Bool values.
 */
("blue", -1) < ("purple", 1)        // OK, evaluates to true
//("blue", false) < ("purple", true)  // Error because < can't compare Boolean values
/*:
 ----
 ## Nil-Coalescing Operator ??
 a有值则强制拆包取值，否则赋默认值b   c = a ?? b
 The nil-coalescing operator is shorthand for the code below: a != nil ? a! : b
 */
/*:
 ## 范围操作符
 * 闭合范围操作符  ...
 * 半闭合范围操作符 ..
 * 一边范围操作符 如 [...2]
 */
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}
for name in names[2...] {
    print(name)
}
// Brian
// Jack
for name in names[...2] {
    print(name)
}
// Anna
// Alex
// Brian
for name in names[..<2] {
    print(name)
}
// Anna
// Alex
/*:
 ----
 ## 逻辑操作符
 * 与&& 或|| 非！
 */
/*:
 ----
 ## 位操作符
 * 与& 或| 非~ 异或^
 */
let someBits: UInt8 = 0b10110010
let moreBits: UInt8 = 0b01011110
let combinedbits = someBits | moreBits  // equals 11111110
/*:
 ----
 ## 溢出操作符
 [more AdvancedOperators](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AdvancedOperators.html)
 * Overflow addition (&+)
 * Overflow subtraction (&-)
 * Overflow multiplication (&*)
 */
var potentialOverflow = Int16.max
// potentialOverflow equals 32767, which is the maximum value an Int16 can hold
potentialOverflow += 1
// this causes an error
/*:
 ----
 ## 方法操作符（结构体，类的操作符重载）
 * 操作符重载
 * 自定义操作符
 */
struct Vector2D {
    var x = 0.0, y = 0.0
}
extension Vector2D {
    static func + (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y + right.y)
    }
}
let vector = Vector2D(x: 3.0, y: 1.0)
let anotherVector = Vector2D(x: 2.0, y: 4.0)
let combinedVector = vector + anotherVector
// combinedVector is a Vector2D instance with values of (5.0, 5.0)
extension Vector2D {
    static func += (left: inout Vector2D, right: Vector2D) {
        left = left + right
    }
}
var original = Vector2D(x: 1.0, y: 2.0)
let vectorToAdd = Vector2D(x: 3.0, y: 4.0)
original += vectorToAdd

prefix operator +++
extension Vector2D {
    static prefix func +++ (vector: inout Vector2D) -> Vector2D {
        vector += vector
        return vector
    }
}

var toBeDoubled = Vector2D(x: 1.0, y: 4.0)
let afterDoubling = +++toBeDoubled

infix operator +-: AdditionPrecedence
extension Vector2D {
    static func +- (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y - right.y)
    }
}
let firstVector = Vector2D(x: 1.0, y: 2.0)
let secondVector = Vector2D(x: 3.0, y: 4.0)
let plusMinusVector = firstVector +- secondVector
// plusMinusVector is a Vector2D instance with values of (4.0, -2.0)
// toBeDoubled now has values of (2.0, 8.0)
// afterDoubling also has values of (2.0, 8.0)

//: [Next](@next)
