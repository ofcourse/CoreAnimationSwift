//: [Previous](@previous)
/*:
 # 扩展
 >  类似oc categories分类 可给现存在的类，结构体，枚举，协议增加函数,而不能重载现有函数。
 * 实现协议
 * 增加方法
 */
import Foundation

/*:
 ## Computed Properties
 */
extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}
let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")
// Prints "One inch is 0.0254 meters"
let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")

/*:
 ## Mutating Instance Methods
 */
extension Int {
    mutating func square() {
        self = self * self
    }
}
var someInt = 3
someInt.square()
// Prints "Three feet is 0.914399970739201 meters"
/*:
 ## Nested Types
 */
extension Int {
    enum Kind {
        case negative, zero, positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}
func printIntegerKinds(_ numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .negative:
            print("- ", terminator: "")
        case .zero:
            print("0 ", terminator: "")
        case .positive:
            print("+ ", terminator: "")
        }
    }
    print("")
}
printIntegerKinds([3, 19, -27, 0, -6, 0, 7])

//: [Next](@next)
