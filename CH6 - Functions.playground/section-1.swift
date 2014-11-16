//  Swift Translation Guide for Objective-C Developers
//  Chapter 6 - Functions

import UIKit

//    Defining Functions
///   Parameter Naming
////  Unnamed Parameters
func createRectBetweenPoints(firstCorner: CGPoint, secondCorner: CGPoint) {
    let horizontalSize = secondCorner.x - firstCorner.x
    let verticalSize = secondCorner.y - firstCorner.y

    let rect = CGRectMake(firstCorner.x, firstCorner.y, horizontalSize, verticalSize)
}

let firstPoint = CGPointMake(0, 0)
let secondPoint = CGPointMake(100, 100)
createRectBetweenPoints(firstPoint, secondPoint)


////  Matching Named Parameters
func createRectBetweenPoints(#firstCorner: CGPoint, #secondCorner: CGPoint) {
    let horizontalSize = secondCorner.x - firstCorner.x
    let verticalSize = secondCorner.y - firstCorner.y

    let rect = CGRectMake(firstCorner.x, firstCorner.y, horizontalSize, verticalSize)
}

createRectBetweenPoints(firstCorner: firstPoint, secondCorner: secondPoint)


//    Differentiated Named Parameters
func createRectBetweenPoints(firstPoint firstCorner: CGPoint, secondPoint secondCorner: CGPoint) {
    let horizontalSize = secondCorner.x - firstCorner.x
    let verticalSize = secondCorner.y - firstCorner.y

    let rect = CGRectMake(firstCorner.x, firstCorner.y, horizontalSize, verticalSize)
}

createRectBetweenPoints(firstPoint: firstPoint, secondPoint: secondPoint)

func createRectBetweenFirstPoint(firstCorner: CGPoint, andSecondPoint secondCorner: CGPoint) {
    let horizontalSize = secondCorner.x - firstCorner.x
    let verticalSize = secondCorner.y - firstCorner.y

    let rect = CGRectMake(firstCorner.x, firstCorner.y, horizontalSize, verticalSize)
}

createRectBetweenFirstPoint(firstPoint, andSecondPoint: secondPoint)


///   Default Parameter Values
func createUrlStringForDomain(domain:String, withPath path:String = "", andProtocol proto:String = "http") -> String {
    return "\(proto)://\(domain)/\(path)"
}

let swiftBlogUrl = createUrlStringForDomain("developer.apple.com", withPath: "swift/blog", andProtocol: "https")
let bbcNewsUrl = createUrlStringForDomain("www.bbc.co.uk", withPath: "news")
let googleUrl = createUrlStringForDomain("www.google.com")



///   Return Values
func createRectBetweenFirstPoint(firstCorner: CGPoint, andSecondPoint secondCorner: CGPoint) -> CGRect {
    let horizontalSize = secondCorner.x - firstCorner.x
    let verticalSize = secondCorner.y - firstCorner.y

    let rect = CGRectMake(firstCorner.x, firstCorner.y, horizontalSize, verticalSize)
    return rect
}


///   Modifying Function Parameters
func canWeChangeItNoWeCant(let constantParam: Int) {
//    constantParam = 0;
}


////  Variable Parameters
func canWeChangeItYesWeCan(var variableParam: Int) {
    variableParam = 0
}


////  In-out Parameters
func doubleThisInt(inout intToChange: Int) -> Bool {
    intToChange *= 2
    return true
}

var intToChange = 2
var success = doubleThisInt(&intToChange)
println("Doubled int: \(intToChange)")


///   Variadic Parameters
func stringFromCharacters(forward: Bool, characters: Character...) -> String {
    var outputString: String = ""
    for character in characters {
        if (forward) {
            outputString = outputString + String(character)
        } else {
            outputString = String(character) + outputString
        }
    }
    return outputString
}

let outputString = stringFromCharacters(false, "a", "b", "c")


//    Function Scopes
///   Nested Functions
func outerFunction() {
    var outerVariable = 0

    func innerFunction() {
        outerVariable++
    }
    innerFunction()
    innerFunction()
    innerFunction()

    println(outerVariable)
}

outerFunction()


//    Using Functions
///   Function Types
func isNumberSameAsString(number: Int, string: String) -> Bool {
    return "\(number)" == string
}

var numberFunction = isNumberSameAsString
numberFunction(350125, "350125")

func isNumber(number: Int, sameAsString string: String) -> Bool {
    return "\(number)" == string
}

let unspecifiedNumberFunction = isNumber
let explicitNumberFunction: (Int, sameAsString: String) -> (Bool) = isNumber
let generalNumberFunction: (Int, String) -> (Bool) = isNumber

unspecifiedNumberFunction(1, sameAsString: "1")
explicitNumberFunction(2, sameAsString: "2")
generalNumberFunction(3, "3")

typealias numberToStringComparisonType = (Int, String) -> (Bool)

let typedNumberFunction: numberToStringComparisonType = isNumber
typedNumberFunction(4, "4")


///   Using Functions As Parameter Values
func compareNumber(number: Int, toString string: String, withComparator comparator: numberToStringComparisonType) -> Bool {
    return comparator(number, string)
}

compareNumber(5, toString: "5", withComparator: generalNumberFunction)


///   Usings Functions As Return Values
func compareStringToNumber(number: Int, string: String) -> Bool {
    if let convertedInt = string.toInt() {
        return number == convertedInt
    } else {
        return false
    }
}

compareNumber(6, toString: "6", withComparator: compareStringToNumber)

func compareNumber(number: Int, toString string:String, forwards:Bool) -> Bool {
    if (forwards) {
        return compareNumber(number, toString: string, withComparator: isNumberSameAsString)
    } else {
        return compareNumber(number, toString: string, withComparator: compareStringToNumber)
    }
}

func selectComparator(forwards: Bool) -> ((Int, String) -> (Bool)) {
    if (forwards) {
        return isNumberSameAsString
    } else {
        return compareStringToNumber
    }
}


func terselyCompareNumber(number: Int, toString string:String, forwards:Bool) -> Bool {
    let comparator = selectComparator(forwards)
    return compareNumber(number, toString: string, withComparator: comparator)
}

