//: var
//: [Previous](@previous)
/*:
 # 变量
 1. 用var关键字声明
 1. 格式： var constantName : Type = InitValue 如：var appWidth:Int = 640
 1. 类型推导，可省略类型 var constantName  = InitValue 如 var height = 300
 1. 不能动态更新变量值类型 如 var uid:Int = 20 再 uid = "30" 会出错;
 */

import Foundation

var str = "Hello, playground"
// error str = 200
//打印变量
print("The current value of friendlyWelcome is \(str)")

//: [Next](@next)


