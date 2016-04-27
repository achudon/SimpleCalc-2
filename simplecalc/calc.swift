//
//  calc.swift
//  simplecalc
//
//  Created by iGuest on 4/26/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import Foundation


public class Calc {
    public var NumCount : Int
    
    public var NumSum : Int
    
    public var History : [String]
    
    init() {
        NumCount = 0
        NumSum = 0
        History = []
    }
    
    private static let _instance : Calc = Calc()
    
    public static var Instance : Calc {
        get { return _instance}
    }
    
    public func Add(left : Int, right : Int) -> Int {
        return left + right
    }
    
    public func Subtract(left : Int, right : Int) -> Int {
        return left - right
    }
    
    public func Divide(left : Int, right : Int) -> Int {
        NSLog("left \(left)")
        NSLog("right \(right)")
        if (right == 0) {
            return 0
        }
        return left / right
    }
    
    public func Multiply(left : Int, right : Int) -> Int {
        return left * right
    }
    
    public func Mod(left : Int, right : Int) -> Int {
        return left % right
    }
    
    public func Count() -> Int {
        return NumCount
    }
    
    public func Avg() -> Int {
        return NumSum / NumCount
    }
    
    public func Factorial(num: Int) -> Int {
        var result = 0
        if (num == 0) {
            result = 1
        } else {
            result = 1
            for var i = num; i > 1; i -= 1 {
                result *= i
            }
        }
        return result
    }
    
    public func AddToCountAndAvg(num : Int) {
        NumCount += 1
        NSLog("count is \(NumCount)")
        NumSum += num
        NSLog("sum is \(NumSum)")
    }
    
    public func IntVersion(toConvert : String) -> Int {
        if Int(toConvert) != nil {
            return Int(toConvert)!
        }
        NSLog("not convertible to an int")
        return 0
    }
}

