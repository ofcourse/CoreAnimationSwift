//: [Previous](@previous)

/*:
 # 控制流程
 * 顺序
 * 分支
 * 循环
 */
import Foundation
/*:
 ## 分支
 * if
 * switch
 */
/*:
 > Checking API Availability
 if #available(platform name version, ..., *) {
 statements to execute if the APIs are available
 } else {
 fallback statements to execute if the APIs are unavailable
 }
 if #available(platform name version, ..., *) {
 statements to execute if the APIs are available
 } else {
 fallback statements to execute if the APIs are unavailable
 }
 */
if #available(iOS 10, macOS 10.12, *) {
    // Use iOS 10 APIs on iOS, and use macOS 10.12 APIs on macOS
} else {
    // Fall back to earlier iOS and macOS APIs
}
//Early Exit
/*
 > early exit
 A guard statement, like an if statement, executes statements depending on the Boolean value of an expression. You use a guard statement to require that a condition must be true in order for the code after the guard statement to be executed. Unlike an if statement, a guard statement always has an else clause—the code inside the else clause is executed if the condition is not true.
 */
func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    
    print("Hello \(name)!")
    
    guard let location = person["location"] else { //保证 let location = person["location"]
        print("I hope the weather is nice near you.")
        return
    }
    
    print("I hope the weather is nice in \(location).")
}
greet(person: ["name": "John"])

let  a = 10
switch a {
case 1...20:
    print("switch 1...20")
case 5...11:
    print("switch 5...11")
default:
    print("default")
}
/*:
 > Fallthrough
 
 In Swift, switch statements don’t fall through the bottom of each case and into the next one. That is, the entire switch statement completes its execution as soon as the first matching case is completed. By contrast, C requires you to insert an explicit break statement at the end of every switch case to prevent fallthrough. Avoiding default fallthrough means that Swift switch statements are much more concise and predictable than their counterparts in C, and thus they avoid executing multiple switch cases by mistake.
 
 If you need C-style fallthrough behavior, you can opt in to this behavior on a case-by-case basis with the fallthrough keyword. The example below uses fallthrough to create a textual description of a number.
 */
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
//case 5:
 //   description += " 5 "
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
print(description)
/*:
 ----
 ## 循环
 * for-in
 * while  (evaluates its condition at the start of each pass through the loop)
 * repeate-while (evaluates its condition at the end of each pass through the loop)
 */
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}

let base = 3
let power = 10
var answer = 1
for _ in 1...power {  //  The underscore character (_) used in place of a loop variable causes the individual values to be ignored and does not provide access to the current value during each iteration of the loop.
    answer *= base
}
/*
 while condition {
 statements
 }
 repeat {
 statements
 } while condition
 */
//: [Next](@next)
