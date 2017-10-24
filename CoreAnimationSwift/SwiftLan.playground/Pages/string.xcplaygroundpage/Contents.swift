//: [Previous](@previous)
/*:
 # 字符串/字符
 * Unicode编码
 * 值类型 (swift’s String type is a value type. If you create a new String value, that String value is copied when it’s passed to a function or method, or when it’s assigned to a constant or variable)
 */
import Foundation

//单行
var str = "Hello, playground"

//多行
let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""
print(quotation)
//multi-line string literal content must begin on a new line
let multilineString = """
These are the same.
"""
print(multilineString)

var a : Int = 10
var b = a
a = 20
print(a)
print(b)
//: [Next](@next)
