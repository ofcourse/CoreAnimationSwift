//: [Previous](@previous)
/*:
 # 结构体&类
 * 结构体值类型，类引用类型
 * 结构体没继承，类有继承
 */
/*:
 >类 Identity Operators Identical to (===) Not identical to (!==)
Assignment and Copy Behavior for Strings, Arrays, and Dictionaries
 In Swift, many basic data types such as String, Array, and Dictionary are implemented as structures. This means that data such as strings, arrays, and dictionaries are copied when they are assigned to a new constant or variable, or when they are passed to a function or method.
 This behavior is different from Foundation: NSString, NSArray, and NSDictionary are implemented as classes, not structures. Strings, arrays, and dictionaries in Foundation are always assigned and passed around as a reference to an existing instance, rather than as a copy.
*/
/*:
 ----
 ## 存储属性
 */
import Foundation

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6
/*:
 ----
 ## 延迟加载存储属性
 只有在第一次使用时，才会初始化
 */
class DataImporter {
}
class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
    // the DataManager class would provide data management functionality here
}
/*:
 ----
 ## 计算属性
 
 > If you have experience with Objective-C, you may know that it provides two ways to store values and references as part of a class instance. In addition to properties, you can use instance variables as a backing store for the values stored in a property.
 Swift unifies these concepts into a single property declaration. A Swift property does not have a corresponding instance variable, and the backing store for a property is not accessed directly. This approach avoids confusion about how the value is accessed in different contexts and simplifies the property’s declaration into a single, definitive statement. All information about the property—including its name, type, and memory management characteristics—is defined in a single location as part of the type’s definition.
 
 */
struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set {
        origin.x = newValue.x - (size.width / 2)
        origin.y = newValue.y - (size.height / 2)
        }
        /*
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }*/
    }
}
/*:
 ----
 ## 只读计算属性
 */
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
//fourByFiveByTwo.volume = 55 //error
/*:
 ----
 ## Property Observers
 */
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
// About to set totalSteps to 200
// Added 200 steps
/*:
 ----
 ## Type Property Syntax
 */
struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}
print(SomeStructure.storedTypeProperty)
/*:
 ----
 ## Modifying Value Types from Within Instance Methods
*/
struct Point2 {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
var somePoint = Point2(x: 1.0, y: 1.0)
somePoint.moveBy(x: 2.0, y: 3.0)
print("The point is now at (\(somePoint.x), \(somePoint.y))")
let fixedPoint = Point2(x: 3.0, y: 3.0)
//fixedPoint.moveBy(x: 2.0, y: 3.0)
// this will report an error
class SomeClass {
    class func someTypeMethod() {
        // type method implementation goes here
    }
}
SomeClass.someTypeMethod()
/*:
 ----
 ## Subscripts
 */
struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}
var matrix = Matrix(rows: 2, columns: 2)
matrix[0, 1] = 1.5
matrix[1, 0] = 3.2
print(matrix)
/*:
 ----
 ## 初如化
 > Swift中不加修饰的init方法都需要在方法中保证所有非Optional的实例变量被赋值初始化，而在子类中也强制 （显式或隐式地）调用super版本的designated初始化，所以无论如何走何种路径，被初始化的对象总是可以完成完整的初始化的。
 * 初始化路径必须保证对象完全初始化，这可以通过调用本类型的designated初始化方法来得到保证；
 * 子类的designated初始化方法必须调用父类的designated方法，以保证父类也完成初始化。
 [more info](http://www.csdn.net/article/2015-01-07/2823458-init-keywords)
 */
class ClassA {
    let numA: Int
    let numB: Int
static var numC: Int { get set }
    init(num: Int) {
        numA = num
        numB = numA //error: return from initializer without initializing all stored properties
        //numC = numA
        ClassA.numC = numA
    }
}
var cA = ClassA(num:1)
/*:
 ----
 ## Deinitialization
 >deinit {
 // perform the deinitialization
 }
 ##
 */

/*:
 ----
 ##
 */
//: [Next](@next)
