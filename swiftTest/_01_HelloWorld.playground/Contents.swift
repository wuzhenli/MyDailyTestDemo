//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var i: Int = 1
var i_1: Int16 = 2
var i_2: Int32 = 3

var b: Bool = false

let httpError = (404, "not found")

let (code, msg) = httpError
//print(httpError.0)


let str1: String? = "may be nil"
let str2: String = str1! // 加 ！ 获取值

let str3: String = "man be nil alse"
let str4: String = str3


var str_char = "chartes"
str_char += "ddd"
//for c in str_char.characters {
//    print(c)
//}

// MARK : http://wiki.jikexueyuan.com/project/swift/chapter2/07_Closures.html

var students = ["aleis", "json", "elment", "ldioe"]
//print(students)
var sortStu = students.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
var sortStu_2 = students.sorted(by: {s1 , s2 in return s1 > s2} )
//print(sortStu_2)
var sortStuAsc = sortStu_2.sorted(by: <)
//print("Asc:\(sortStuAsc)")
var reverName = sortStuAsc.sorted() {$0 > $1}
//print(reverName)


func funClosure(closure:() -> Void) {
    
}

funClosure(closure: {
    print("-----")
})

funClosure() {
    print("funClosure")
}



let cast = ["Vivien", "Marlon", "Kim", "Karl"]
let lowerNames = cast.map { $0.lowercased()}
//print(lowerNames)
let countNames = cast.map{ $0.characters.count }
//print(countNames)

/*  值捕获  */


/* 输入输出参数 */
func funcInputOutput_1(_ count: Int) {
//    count = 12 // 函数参数默认是常量,不能修改参数的值.
    print("count:\(count)")
}
//funcInputOutput_1(22)

func swapCount(a: inout Int, b: inout Int) {
    let t = a
    a = b
    b = t
}
var io_a = 12, io_b = 23
swapCount(a: &io_a, b: &io_b)
//print("io_a:\(io_a)  io_b:\(io_b)")

/* 函数类型 */
func addInt(a: Int, b: Int) -> Int {
    return a+b
}

var addFunc: (Int, Int) -> Int = addInt
print(addFunc(io_a, io_b))


// MARK: 枚举
enum Direction: Int {
    case east = 0
    case north
    case south
    case west
}
let direction = Direction.west
print(direction)






