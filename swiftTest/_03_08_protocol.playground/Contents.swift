//: Playground - noun: a place where people can play

import UIKit

// MARK : 协议  


/*
    * 协议规定的方法，实现时，加 required
    * final 类不能有子类，可以 不加 required
 */
protocol ProtocolA {
    init(name: String)
}

class Class_A : ProtocolA{
    var name: String
    required init(name: String) {
        self.name = name
    }
}

var class_a = Class_A(name: "name_a class")
//print(class_a.name)

// -----------
protocol RandomNumberGenerator {
    func random() -> Double
}

class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

// ------
protocol Protocol_B {
    func printProtocolName()
}

class Class_B {
    var name: String = "null"
    var classDescrip: String {
        return "name: \(name)"
    }
}
var class_B = Class_B()
//print(class_B.classDescrip)

/*
  * 类类型专属协议
    * 你可以在协议的继承列表中，通过添加 class 关键字来限制协议只能被类类型遵循，而结构体或枚举不能遵循该协议。class 关键字必须第一个出现在协议的继承列表中，在其他继承的协议之前：
 */
// protocol SomeClassOnlyProtocol: class, SomeInheritedProtocol {
//    这里是类类型专属协议的定义部分
// }
/* 在以上例子中，协议 SomeClassOnlyProtocol 只能被类类型遵循。如果尝试让结构体或枚举类型遵循该协议，则会导致编译错误。
 
 注意
    当协议定义的要求需要遵循协议的类型必须是引用语义而非值语义时，应该采用类类型专属协议。
 */



/*
 *  检查协议一致性
    你可以使用类型转换中描述的 is 和 as 操作符来检查协议一致性，即是否符合某协议，并且可以转换到指定的协议类型。检查和转换到某个协议类型在语法上和类型的检查和转换完全相同：
 
         is 用来检查实例是否符合某个协议，若符合则返回 true，否则返回 false。
         as? 返回一个可选值，当实例符合某个协议时，返回类型为协议类型的可选值，否则返回 nil。
         as! 将实例强制向下转换到某个协议类型，如果强转失败，会引发运行时错误。
 */
protocol HasArea {
    var area: Double { get }
}

class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double { return pi * radius * radius }
    init(radius: Double) { self.radius = radius }
}
class Country: HasArea {
    var area: Double
    init(area: Double) { self.area = area }
}

class Animal {
    var legs: Int
    init(legs: Int) { self.legs = legs }
}
let objects: [AnyObject] = [
    Circle(radius: 2.0),
    Country(area: 243_610),
    Animal(legs: 4)
]

//for obj in objects {
//    if  obj is HasArea {
//        print(obj)
//    } else {
//        print("not :\(obj)")
//    }
//}

//for object in objects {
//    if let objectWithArea = object as? HasArea {
//        print("Area is \(objectWithArea.area)")
//    } else {
//        print("Something that doesn't have an area")
//    }
//}

// ----------
@objc protocol CounterDataSource {
    @objc optional func incrementForCount(count: Int) -> Int
    @objc optional var fixedIncrement: Int { get }
}
class Counter {
    var count = 0
    var dataSource: CounterDataSource?
    func increment() {
        if let amount = dataSource?.incrementForCount?(count: count) {
            count += amount
        } else if let amount = dataSource?.fixedIncrement {
            count += amount
        }
    }
}
// 协议扩展: 继承协议的类，就不用写协议的方法了
protocol Protocal_C {
    func random() -> Int
}

extension Protocal_C {
    func random() -> Int {
        return 23;
    }
}

class Class_C : Protocal_C {
    
}

var class_c = Class_C()
print(class_c.random())



// MARK : 泛型


func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var a_a = 12
var b_b = 22

swapTwoValues(&a_a, &b_b)
//print("a:\(a_a), b_b:\(b_b)")

var a_Str = "aaa"
var b_Str = "bbb"
swapTwoValues(&a_Str, &b_Str)
//print("a:\(a_Str) b:\(b_Str)")

/*
 类型约束语法
 
     你可以在一个类型参数名后面放置一个类名或者协议名，并用冒号进行分隔，来定义类型约束，它们将成为类型参数列表的一部分。对泛型函数添加类型约束的基本语法如下所示（作用于泛型类型时的语法与之相同）：
     
     func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
     // 这里是泛型函数的函数体部分
     }
     上面这个函数有两个类型参数。第一个类型参数 T，有一个要求 T 必须是 SomeClass 子类的类型约束；第二个类型参数 U，有一个要求 U 必须符合 SomeProtocol 协议的类型约束。
 */


// MARK : http://wiki.jikexueyuan.com/project/swift/chapter2/24_Access_Control.html





















