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
    
    class func work() {
        print("Type Method: Person: 警察.")
    }
    
    // 使用static关键字创建类方法
    static func nameOfPerson(name: String) {
        print("Type Method: Person name: \(name)")
    }
}

class InSome:SomeClass {
    override class func work() {
        
    }
    //cannot override static method
    /*override static func nameOfPerson(name: String) {
        
    }*/
}

//https://stackoverflow.com/questions/35035185/swift-metatype-type-self
let cls : SomeClass.Type = SomeClass.self //属于类的类方法
cls.doIt()
let cls2 : SomeClass = SomeClass() //实例
cls2.doItOnlyIfInstanceOfThisType()

/*func t() {
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
        //.disposed(by: disposeBag)
}
t()*/
SomeClass.work()
SomeClass.nameOfPerson(name: "static name")

//static & class 类方法的区别: 都是类方法，但是static的方法不能重写，但class的可以 http://www.jianshu.com/p/a9c9e7313438
