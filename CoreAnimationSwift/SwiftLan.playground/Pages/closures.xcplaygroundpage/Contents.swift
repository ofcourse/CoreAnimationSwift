//: [Previous](@previous)
/*:
 # 闭包
 > Closures can capture and store references to any constants and variables from the context in which they are defined. This is known as closing over those constants and variables.
 
 Global and nested functions, as introduced in Functions, are actually special cases of closures. Closures take one of three forms:
 * Global functions are closures that have a name and do not capture any values.
 * Nested functions are closures that have a name and can capture values from their enclosing function.
 * Closure expressions are unnamed closures written in a lightweight syntax that can capture values from their surrounding conte
 闭包是引用类型
 函数：是一个有名字的闭包。
 普通函数：是一个有名字但不会捕获任何值的闭包。
 嵌套函数：是一个有名字并可以捕获其封闭函数域内值的闭包。
 */
/*:
 ## 闭包语法
 > { (parameters) -> return type in
 statements
 }
 */
    import Foundation
    let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
    func backward(_ s1: String, _ s2: String) -> Bool {
        return s1 > s2
    }
    //Inferring Type From Context
    var reversedNames = names.sorted(by: backward)
    reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
        return s1 > s2
    })
    reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 } )
    reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )
    reversedNames = names.sorted(by: { $0 > $1 } )
    reversedNames = names.sorted(by: >)
    //Trailing Closures
    //Closures Are Reference Types
/*:
 > 逃逸闭包概念：当一个闭包作为参数传到一个函数中，但是这个闭包在函数返回之后才被执行，我们称该闭包从函数中逃逸。逃逸闭包多用来做函数回调，与Objective-C里的Block有异曲同工之妙。
 逃逸闭包必须满足下面2个条件：
 * 1、闭包作为一个参数传到函数中
 * 2、闭包在函数返回之后才执行
 */
/*:
 ----
> 自动闭包：闭包作为参数传递给函数时，可以将闭包定义为自动闭包（使用关键字@autoclosure）。这样传递参数时，可以直接传递一段代码（或者一个变量、表达式），系统会自动将这段代码转化成闭包。需要注意：过度使用 autoclosures 会让你的代码变得难以理解
 */
/*:
 ## 起别名
也可以关键字“typealias”先声明一个闭包数据类型。类似于OC中的typedef起别名
 */
typealias AddBlock = (Int, Int) -> (Int)

let Add:AddBlock = {
    (c,d) in
    return c + d
}

let Result = Add(100,150)
print("Result = \(Result)")
//: [Next](@next)
