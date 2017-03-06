//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

enum VendingMachineError: Error {
    case invalidSelection                    //选择无效
    case insufficientFunds(coinsNeeded: Int) //金额不足
    case outOfStock                          //缺货
}

throw VendingMachineError.insufficientFunds(coinsNeeded: 23)


