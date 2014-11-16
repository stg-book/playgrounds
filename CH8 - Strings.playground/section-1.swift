//  Swift Translation Guide for Objective-C Developers
//  Chapter 8 - Strings

import UIKit

//    Constructing Strings
let initString = String.init("By init")
let constructorString = String("By constructor")
let literalString = "By literal syntax"

let concatenatedString = "Hello, " + "World!"

let entity = "World"
let interpolatedString = "Hello, \(entity)!"

let character: Character = "="
let characterString = String(character)

let dividingLine = String(count: 20, repeatedValue: character)


//    Manipulating Strings
///   Examining String Values
var string: String = "string"

var index = string.startIndex
let firstCharacter = string[index]

index = advance(index, 1)
let secondCharacter = string[index]

index = string.endIndex
index = advance(index, -2)
let secondLastCharacter = string[index]

index = advance(string.startIndex, 7, advance(string.endIndex, -1))
string[index]

let stringLength = countElements(string)

for character in string {
    print(character)
}

///   Comparing strings
let string1 = "string"
let string2 = "strong"
let string3 = "string"

string1 == string2
string1 == string3

string1 != string2

let string4 = "strung"

string1 < string2
string4 > string2
string3 <= string1

string1.isEmpty

/// Using hasPrefix and hasSuffix
string1.hasPrefix("str")
string2.hasSuffix("ng")


///   Modifiying String Content
////  Appending a String or Character
string.extend(".swift")

let newCharacter: Character = "!"
string.append(newCharacter)


////  Inserting a String or Character
string = "string"

index = string.startIndex
index = advance(index, 2)
string.splice("utt", atIndex:index)

index = advance(index, 3)
string.insert("e", atIndex: index)


////  Replacing a Range of Characters
var firstIndex = advance(string.startIndex, 1)
var secondIndex = advance(firstIndex, 6)
var range = firstIndex...secondIndex
string.replaceRange(range, with: "imulati")


////  Removing a Single Character or a Range of Characters
firstIndex = advance(string.startIndex, 1)
secondIndex = advance(firstIndex, 4)
range = firstIndex...secondIndex
string.removeRange(range)

firstIndex = advance(string.startIndex, 1)
var removedCharacter = string.removeAtIndex(firstIndex)
println(string)


////  Removing All Characters From a String
string.removeAll(keepCapacity: false)


//    Interacting With NSString
///   Substrings
var sourceString = "exponentially"

var fromIndex = advance(sourceString.endIndex, -4)
sourceString.substringFromIndex(fromIndex)

var toIndex = advance(sourceString.startIndex, 8)
sourceString.substringToIndex(toIndex)

fromIndex = advance(sourceString.startIndex, 3)
toIndex = advance(fromIndex, 2)
sourceString.substringWithRange(fromIndex...toIndex)


///   Conversions
var conversionString = "swift string"
conversionString = conversionString.uppercaseString
conversionString = conversionString.lowercaseString
conversionString = conversionString.capitalizedString


///    Working with Paths
var path = "/Users"
path = path.stringByAppendingPathComponent("mkelly")
path = path.stringByAppendingPathComponent("Documents")
path = path.stringByAppendingPathComponent("Swift Translation Guide")
path = path.stringByAppendingPathComponent("Strings")
path = path.stringByAppendingPathExtension("swift")!

path = path.stringByDeletingPathExtension
path = path.stringByDeletingLastPathComponent

path = path.stringByAddingPercentEscapesUsingEncoding(NSASCIIStringEncoding)!


///   Explicitly Creating an NSString
var nsString = NSString(format: "From %@", "NSString")
let nsMutableString = NSMutableString(format: "From %@", "NSString")
nsMutableString.replaceCharactersInRange(NSRange(location: 5, length: 8), withString: "NSMutableString")


//    Unicode
var accentedString = "Aoibhínn"

countElements(accentedString)
countElements(accentedString.utf8)

var alternativeConstruction = "Aoibhi\u{301}nn"
countElements(alternativeConstruction)
countElements(alternativeConstruction.utf8)

accentedString == alternativeConstruction

