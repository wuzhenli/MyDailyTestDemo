//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
print(str)


class Person {
    var age: Int = 12
    var name: String?
    var weight: Float?
}



/*  类型的 类型：值 / 引用类型
 结构体和枚举是值类型
 值类型被赋予给一个变量、常量或者被传递给一个函数的时候，其值会被拷贝。

 类是引用类型
 与值类型不同，引用类型在被赋予到一个变量、常量或者被传递到一个函数时，其值不会被拷贝。因此，引用的是已存在的实例本身而不是其拷贝。
 */


/*
 恒等运算符
 
 因为类是引用类型，有可能有多个常量和变量在幕后同时引用同一个类实例。（对于结构体和枚举来说，这并不成立。因为它们作为值类型，在被赋予到常量、变量或者传递到函数时，其值总是会被拷贝。）
 
 如果能够判定两个常量或者变量是否引用同一个类实例将会很有帮助。为了达到这个目的，Swift 内建了两个恒等运算符：
 
 等价于（===）
 不等价于（!==）
 运用这两个运算符检测两个常量或者变量是否引用同一个实例
 */

let p1 = Person()

let p2 = p1

if p1 === p2 {
    print("p1 p2是同一个实例")
} else {
    print("p1 p2不是 同一个实例")
}
/* copy
 字符串、数组、和字典类型的赋值与复制行为
 Swift 中，许多基本类型，诸如String，Array和Dictionary类型均以结构体的形式实现。这意味着被赋值给新的常量或变量，或者被传入函数或方法中时，它们的值会被拷贝。
 
 Objective-C 中NSString，NSArray和NSDictionary类型均以类的形式实现，而并非结构体。它们在被赋值或者被传入函数或方法时，不会发生值拷贝，而是传递现有实例的引用。
 */


/* lazy
 如果一个被标记为 lazy 的属性在没有初始化时就同时被多个线程访问，则无法保证该属性只会被初始化一次。
 */

/* property
 Swift 中的属性没有对应的实例变量，属性的后端存储也无法直接访问。这就避免了不同场景下访问方式的困扰，同时也将属性的定义简化成一个语句。属性的全部信息——包括命名、类型和内存管理特征——都在唯一一个地方（类型定义中）定义。
 */

struct Cube {
    var width : Float
    var height: Float
    var length = 0.0
    var colume : Float {
        get {
            return width * height * Float(length)
        }
    }
}


var c = Cube(width: 3, height: 2, length: 2)
print("\(c.colume)")


/* 属性观察器
 注意
 父类的属性在子类的构造器中被赋值时，它在父类中的 willSet 和 didSet 观察器会被调用，随后才会调用子类的观察器。
    在父类初始化方法调用之前，子类给属性赋值时，观察器不会被调用。 有关构造器代理的更多信息，请参考值类型的构造器代理和类的构造器代理规则。
 */
class StepCount {
    var count: Int = 0 {
        willSet {
            print("newValue:\(newValue)")
        }
        didSet {
            print("oldValue:\(oldValue)")
        }
    }
    
}
var sCount = StepCount()
sCount.count = 1


/* 类型属性
 必须给存储型类型属性指定默认值，因为类型本身没有构造器，
 存储型类型属性是延迟初始化的，它们只有在第一次被访问的时候才会被初始化。即使它们被多个线程同时访问，系统也保证只会对其进行一次初始化，并且不需要对其使用 lazy 修饰符。
 */

class Room {
    static var personNum: Int = 0;
}

// MARK  http://wiki.jikexueyuan.com/project/swift/chapter2/11_Methods.html

/**
 * 结构体、枚举 类型的方法内部不能修改 成员变量的值，如果想修改成员的值，请加 mutating 关键字
 * 变量可以钓鱼mutating方法，常量不可以
 */
struct Point {
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
    func addX() -> Void { // 结构体、枚举 类型的方法内部不能修改 成员变量的值，如果想修改成员的值，请加 mutating 关键字
        print(x)
    }
}
var p = Point(x: 12.0, y: 12.0)
p.moveByX(deltaX: 1.2, y: 1.2)


/**
 * 类方法
 * static关键字定义,子类不能重写父类方法
 * class关键字定义类方法，子类可以重写父类方法
 */
class SomeClass {
    static var count: Int = 100
    
    static func classTypeMehtod() {
        print("classType Method ----类方法")
    }
    class func someTypeMethod() {
        // 在这里实现类型方法
        print("someTypeMethod : 父类")
    }
}
class SomeSunClass : SomeClass {
    override static func someTypeMethod() {
        print("someTypeMethod : 子类")
        classTypeMehtod() // 类方法中直接钓用类方法、类成员
        print("count:\(count)")
    }
}

let someClass_1 = SomeSunClass()
SomeSunClass.classTypeMehtod()
SomeSunClass.someTypeMethod()


//var dicTest = ["a":1, "b":2, "c":3]
//print(dicTest["aa"] ?? "none")
//print(dicTest["bb"] ?? "no bb")



//MARK   构造器
/* 构造器
 注意
 当你为存储型属性设置默认值或者在构造器中为其赋值时，它们的值是被直接设置的，不会触发任何属性观察者。
 */

struct InitStruct {
    var count: Int
    init(outCount inCount:Int) {
        self.count = inCount
    }
//    init( count:Int) {
//        self.count = count
//    }
    
    init(_ count:Int) {
        self.count = count
    }
}
//var initS_1 = InitStruct(count: 1)


class InitClass {
    let text: String
    init(t: String) {
        self.text = t
    }
}

// 学习点 http://wiki.jikexueyuan.com/project/swift/chapter2/14_Initialization.html
//指定构造器和便利构造器












