//: [Previous](@previous)

import Foundation
import RxSwift

var str = "Hello, playground"

//: [Next](@next)

class SomeClass {
    class func doIt() {
        print("I'm a class method. I belong to my type.")
    }
    
    func doItOnlyIfInstanceOfThisType() {
        print("I'm a instance method. I belong to my type instance.")
    }
}

//https://stackoverflow.com/questions/35035185/swift-metatype-type-self
let cls : SomeClass.Type = SomeClass.self //属于类的类方法
cls.doIt()
let cls2 : SomeClass = SomeClass() //实例
cls2.doItOnlyIfInstanceOfThisType()

func t() {
    Observable<Int>.from([1, 2, 3, -1, 5])
        .map { value -> Int in
            if value > 0 {
                return value
            } else {
                //throw CustomError.myCustom
                print("error")
            }
        }
        .debug()
        .subscribe()
        .disposed(by: disposeBag)
}
t()

