//  Swift Translation Guide for Objective-C Developers
//  Chapter 7 - Blocks and Closures

import UIKit

//    Defining Closures
///   Creating The Definition
class GreetingMaker {
    func produceGreeting(greetingMaker: (String, String) -> (String)) -> String {
        let greeting: String = greetingMaker("Hello, %@!", "World")
        return greeting;
    }
}

var greetingMaker = GreetingMaker()

greetingMaker.produceGreeting( { (format: String, name: String) -> (String) in
    return NSString(format: format, name);
} )


///   Assigning to Variables
var greetMaker = { (format: String, name: String) -> (String) in
    return NSString(format: format, name)
}


///   Receiving as Function Parameters
//func produceGreeting(greetingMaker: (String, String) -> (String)) -> String {
//    ...
//}

///   Creating Type Aliases
typealias GreetingMakerType = (String, String) -> (String)
func produceGreeting(greetingMaker: GreetingMakerType) -> String {
    let greeting: String = greetingMaker("Hello, %@!", "World")
    return greeting;
}


///   Executing Closures
let greeting = greetMaker("Hello, %@!", "World")



//    Optimizing Closures
///   Implicit returns
greetMaker = { (format: String, name: String) -> (String) in
    NSString(format: format, name)
}


///   Type Inference
greetMaker = { format, name in
    NSString(format: format, name)
}


///   Shorthand argument names
greetMaker = {
    NSString(format: $0, $1)
}


///   Trailing closure syntax
greetingMaker.produceGreeting() {
    NSString(format: $0, $1);
}


///   Operator Functions
struct Pair {
    var first:String, second:String
    func matches( comparison:(String, String) -> Bool) -> Bool {
        return comparison(first, second)
    }
}
let pair = Pair(first: "Swift", second: "Swift")

var match = pair.matches({ (left: String, right: String) -> Bool in
    return left == right
})

match = pair.matches({ left, right in           //  Inferred types
    return left == right
})
match = pair.matches({ return $0 == $1 })       //  Shorthand argument names
match = pair.matches({ $0 == $1 })              //  Implicit return

match = pair.matches(==)                        //  Don't do this, please!



//    Capturing Values
func outerFunction() {
    var outerVariable = 0
    var innerClosure:() -> Int = {
        var innerVariable = 2
        outerVariable = outerVariable + innerVariable
        innerVariable++
        return outerVariable
    }
    innerClosure()
    innerClosure()
    innerClosure()
}

outerFunction()


