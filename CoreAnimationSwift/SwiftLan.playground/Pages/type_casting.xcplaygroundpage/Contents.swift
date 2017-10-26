//: [Previous](@previous)
/*:
 # 类型转换
 > 类型转换就是检测类实例的类型，或将类实例 转换为其继承体系中的父类或子类
 
 * is  类型判断（类似oc isKindOfClass）
 * as  向下类型转换 (as!强制类型转换  as?条件类型转换)
 */
import Foundation

/*
 if item is Movie {
 movieCount += 1
 } else if item is Song {
 songCount += 1
 }
 if let movie = item as? Movie {
 print("Movie: \(movie.name), dir. \(movie.director)")
 } else if let song = item as? Song {
 print("Song: \(song.name), by \(song.artist)")

 */
/*:
 ## 向下类型转换
 *
 * Any 代表任意类型，包括函数类型,结构体等
 * AnyObject 代表任意类实例
 */
var things = [Any]()

things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append({ (name: String) -> String in "Hello, \(name)" })

for thing in things {
    switch thing {
    case 0 as Int:
        print("zero as an Int")
    case 0 as Double:
        print("zero as a Double")
    case let someInt as Int:
        print("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    case is Double:
        print("some other double value that I don't want to print")
    case let someString as String:
        print("a string value of \"\(someString)\"")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    case let stringConverter as (String) -> String:
        print(stringConverter("Michael"))
    default:
        print("something else")
    }
}
//: [Next](@next)
