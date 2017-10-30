//: Playground - noun: a place where people can play
/*:
 # working with cocoa
 * swift中可以使用oc API, oc 也可以调用swift api
 * oc与c支持模块的框架都能直接导入到swift中引用. 包括所有的oc系统框架及通用的C类库等，如 Foundation, UIKit, and SpriteKit等
 * import Foundation后，swift文件能访问所有Foundation的类，协议，方法，属性，常量等
 */
import UIKit

/*:
 ## swift  import 框架的处理过程
 oc代码先在头文件暴露接口，在swift中，这些头文件先被编译成oc模块，然后被导入成swift api. 导入过程决定oc中的函数，类，方法，类型在swift中的显示。
 ### 类型转换
 *  类型映射-映射oc类型到相等的swift类型，如 id到Any
 *  核心类型映射-映射oc核心类型到可选择的swift类型 如NSString到String
 *  概念映射-映射oc概念到swift,如指错到optionals类型
 *  swift不支持映射C++代码，可以将c++代码用oc或c包装
 */

/*:
 ## oc import swift处理过程与swift import 框架类似
 * swift模块会生成oc头文件，头文件的api, 头文件的api可以映射回oc,有些swift api不能映射回oc，因为有些swift特性，oc无对应的特性来支持。
 */
let number = 42
let bridgedNumber: NSNumber = number as NSNumber

let integerLiteral: NSNumber = 5
let floatLiteral: NSNumber = 3.14159
let booleanLiteral: NSNumber = true
booleanLiteral.uint16Value

import Foundation
let a : NSNumber = 10
/*:
 ## cocoa framework
 桥接类型 swift自动将一些oc类型转换为swift类型，将一些swift类型转换为oc类型
 */

