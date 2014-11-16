//  Swift Translation Guide for Objective-C Developers
//  Chapter 3 - Language Basics

import UIKit

//    Variable Declarations
///   Var and Let
var counter: Int = 0
let maxCounter: Int = 10

var deferredCounter: Int

// Other code can go here, as long as it does not 
// reference the deferredCounter variable

deferredCounter = 0

class IntContainer {
    var internalInt: Int = 0
}
let intContainer = IntContainer()
intContainer.internalInt = 3


///   Type Inference
var inferredCounter = UInt.min


//    Syntax
///   Comments

/**
A Basic Class

Performs some basic activities and leads a boring life

Additional paragraphs of information

:Section Header:

Some more information.
*/
class BasicClass {
    /// A String property containing Stringy information
    var basicProperty: String = ""

    /// Creates a BasicClass
    ///
    /// This is a bit more detail on the method createBasicClassWithBasicProperty. The parameters
    /// will be detailed below using special keywords, as will the return value.
    ///
    /// :param: basicProperty a String containing a basic property
    /// :returns: a configured BasicClass
    class func createBasicClassWithBasicProperty(# basicProperty: String) -> BasicClass {
        let basicClass: BasicClass = BasicClass()
        basicClass.basicProperty = basicProperty
        return basicClass
    }
}


//    Operators
///   Different
////  Overflow Changes
var withOverflow: UInt8 = 230 &+ 50


///   New
////  Range Operators
for counter in 3...6 {
    println(counter)
}

for counter in 3..<6 {
    println(counter)
}

////  Type Operators
let view: UIView = UILabel();
if view is UILabel {
    let label = view as UILabel
}

////  Pattern Match Operators
let integerValue = 6
if 1...9 ~= integerValue {
    println("integer value is in ranger 1 to 9")
}


//    Tuples
///   Creating and Using Tuples
let coordinate = (3, 2)
let otherCoordinate = (x: 3, y: 2)

let (x1, y1) = coordinate
let (_, y2) = otherCoordinate


///   Reusing Tuples
typealias ThreeDCoordinate = (x: Int, y: Int, z: Int)
let originPoint: ThreeDCoordinate = (0, 0, 0)


