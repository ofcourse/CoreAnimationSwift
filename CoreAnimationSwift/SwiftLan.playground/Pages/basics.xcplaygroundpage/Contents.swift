//: [Previous](@previous)
/*:
 # 基础数据类型
 Int,Double,Float,Bool,String,集合类型：Array,Set,Dictionary;元组,Optional Type
 */
import Foundation

var str = "Hello, playground", y = 2.0
let cat = "🐱"; print(cat) //分号

/*:
 ----
 ## 整型
 Int/UInt
 On a 32-bit platform, Int is the same size as Int32/UInt32.
 On a 64-bit platform, Int is the same size as Int64/UInt64.
 
 */

/*:
 ----
  ## 浮点型
 Double represents a 64-bit floating-point number.
 Float represents a 32-bit floating-point number.

*/

/*:
 ----
 ## 数字字面量
   十字制，二进制0b，八进制0o，十六进制0x
 */
let decimalInteger = 17           //十进制
let binaryInteger = 0b10001       // 17 in binary notation
let octalInteger = 0o21           // 17 in octal notation
let hexadecimalInteger = 0x11     // 17 in hexadecimal notation
/*:
 ----
 ## 类型转换
*/
let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi = Double(three) + pointOneFourOneFiveNine
/*:
 ----
 类型别名 type aliases define an alternative name for an existing type. You define type aliases with the typealias keyword.
*/
typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min
/*:
 ----
 ## Bool (true,false)
 Bool 类型只能是 true,false两种值，不能像c/oc那样允许非0值为true, if i {} 会报错
 */
/*:
 # 元组
  将多个变量值混合组成一个变量
 */
let http404Error = (404, "Not Found")
let (statusCode, statusMessage) = http404Error //将元组中的值解绑赋值到多个单一变量中
print("The status code is \(statusCode)")
// Prints "The status code is 404"
print("The status message is \(statusMessage)")
// Prints "The status message is Not Found"
let (justTheStatusCode, _) = http404Error //If you only need some of the tuple’s values, ignore parts of the tuple with an underscore (_) when you decompose the tuple:
print("The status code is \(justTheStatusCode)")
// Prints "The status code is 404"
print("The status code is \(http404Error.0)")  //Alternatively, access the individual element values in a tuple using index numbers starting at zero:
// Prints "The status code is 404"
print("The status message is \(http404Error.1)")
// Prints "The status message is Not Found"
let http200Status = (statusCode: 200, description: "OK") //You can name the individual elements in a tuple when the tuple is defined:
print("The status code is \(http200Status.statusCode)")  //If you name the elements in a tuple, you can use the element names to access the values of those elements:
// Prints "The status code is 200"
print("The status message is \(http200Status.description)")
// Prints "The status message is OK
/*:
 ## 可空类型 Options 要么有值，要么是nil
  * 强制解包！取值 （确定拆包后一定有值）,如IBOutlet属性
 * 可空类型隐式拆包 if let constantName = someOptional {}
 */
if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {//多个都要拆包成功
    print("\(firstNumber) < \(secondNumber) < 100")
}
// Prints "4 < 42 < 100"
if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}
let possibleString: String? = "An optional string."
let forcedString: String = possibleString!
var assumedString: String! = nil
assumedString = nil
/*:
 ----
 ## 错误处理
  throws, do try catch
 */
func canThrowAnError() throws {
    // this function may or may not throw an error
}
do {
    try makeASandwich()
    eatASandwich()
} catch SandwichError.outOfCleanDishes {
    washDishes()
} catch SandwichError.missingIngredients(let ingredients) {
    buyGroceries(ingredients)
}
/*:
 ----
 ## 断言
*/
 assert(1 > 0)  //debug模式下有效，正式release下面assert不生效
 precondition(1 > 0, "Index must be greater than zero.") //debug,release都生效
//: [Next](@next)
