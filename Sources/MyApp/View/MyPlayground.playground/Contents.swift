import UIKit

var greeting = "Hello, playground"

func add(num1:Int,num2:Int)->Int{
    return num1 + num2
}

let sum=add(num1: 100, num2: 200)

print(sum)

class Person{
    var name:String
    var age:Int
    init(name:String,age:Int){
        self.name=name
        self.age=age
    }
}

extension Person:CustomStringConvertible{
    var description: String{
        get{
            return "{name:\(name) ,age: \(age)}"
        }
    }
}

let Tang=Person(name: "唐健峰", age: 19)
