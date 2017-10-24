//: [Previous](@previous)
/*:
 # 错误处理
 */
import Foundation

//In Swift, errors are represented by values of types that conform to the Error protocol.
enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}
/*:
 ----
 ## Handling Errors Using Do-Catch
 > do {
 try expression
 statements
 } catch pattern 1 {
 statements
 } catch pattern 2 where condition {
 statements
 }
 */
/*:
 ## Converting Errors to Optional Values try?
 Disabling Error Propagation 确定不会报错，禁止错误传递 （如图片资料一定存在，app发布的时候本地一定存在该资源）
 let photo = try! loadImage(atPath: "./Resources/John Appleseed.jpg")
 */
/*:
 ## Specifying Cleanup Actions  defer
 * defer在函数退出之前执行，不管有没有报错或执行return语名，最终都会执行defer
 */
/*
func processFile(filename: String) throws {
    if exists(filename) {
        let file = open(filename)
        defer {
            close(file)
        }
        while let line = try file.readline() {
            // Work with the file.
        }
        // close(file) is called here, at the end of the scope.
    }
} */
//: [Next](@next)
