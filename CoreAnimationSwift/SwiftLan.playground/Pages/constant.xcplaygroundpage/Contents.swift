//: [Previous](@previous)
/*:
 # 常量
  1. 用let关键字声明
  1. 格式： let constantName : Type = InitValue 如：let appWidth:Int = 640
  1. 类型推导，可省略类型 let constantName  = InitValue 如 let height = 300
  1. 初始化后，不可再修改赋值；可先定义，再赋值，赋值后不可修改
 */

import Foundation

let appWidth: Int = 640
let appHeight = 300
let appScreen:Int
appScreen = 200
//error appHeight= 200
//: [Next](@next)
