//  Swift Translation Guide for Objective-C Developers
//  Chapter 12 - Collections

import UIKit
import Swift

protocol ArrayCompliant { }

class ClassOne: ArrayCompliant { }

class ClassTwo: ArrayCompliant { }


//    Arrays
///   Creating Arrays
var stringArray: [String]

stringArray = [String]()

var inferredStringArray = [String]()

var storyPoints: [Int] = [1, 2, 3, 5, 8]

var inferredStoryPoints = [1, 2, 3, 5, 8]

protocol Estimatable { }
var miscStoryPoints = [Estimatable]()


///   Reading Array Contents
let secondItem = storyPoints[1]

let arraySize = storyPoints.count
let lastItem = storyPoints[arraySize - 1]

let firstIndex = advance(storyPoints.startIndex, 1)
let lastIndex = advance(firstIndex, 2)
let subArray = storyPoints[firstIndex...lastIndex]

let backwardsArray = storyPoints.reverse()

let threePointerIndex = find(storyPoints, 3)


///   Manipulating Arrays
////  Adding Objects
storyPoints.append(13)

let extraPoints = [21, 34]
storyPoints.extend(extraPoints)

storyPoints.insert(4, atIndex: 3)

let missingPoints = [6, 7]
storyPoints.splice(missingPoints, atIndex: 5)


////  Removing Objects
var removedElement = storyPoints.removeAtIndex(3)

removedElement = storyPoints.removeLast()

if let eightPointerIndex = find(storyPoints, 8) {
    storyPoints.removeAtIndex(eightPointerIndex)
}

storyPoints.removeRange(4...5)

storyPoints.removeAll()



////  Replacing Objects

storyPoints = [1, 2, 3, 4, 5, 6]
storyPoints[3] = 5

storyPoints[4...5] = [8, 9, 10, 11]

storyPoints.replaceRange(5...7, with:[13, 21])

////  Sorting
func descendingSort(first: Int, second: Int) -> Bool {
    return first > second
}
storyPoints.sort(descendingSort)

let ascendingPoints = storyPoints.sorted {
    $0 < $1
}


//    Dictionaries
///   Creating Dictionaries
var translationDictionary = [String: String]()

translationDictionary = [
    "favorite": "favourite",
    "color": "colour",
    "initializer": "initialiser",
    "parentheses": "round brackets",
    "pound sign": "hash",
    "behavior": "behaviour"
]


///   Reading from Dictionaries
var realWord = translationDictionary["color"]

for (key, value) in translationDictionary {
    println("\(key): \(value)")
}

translationDictionary.count

translationDictionary.isEmpty

var keys = translationDictionary.keys

for key in keys {
    println("\(key)")
}

keys.isEmpty

var values = translationDictionary.values
for value in values {
    println("\(value)")
}

var keyIndex = translationDictionary.indexForKey("pound sign")
if let validKeyIndex = keyIndex {
    realWord = translationDictionary.values[validKeyIndex]
}


///   Manipulating Dictionaries
////  Adding and  Replacing Objects
translationDictionary.count
translationDictionary["Apple has"] = "Apple have"
translationDictionary.count
translationDictionary["pound sign"] = "octothorpe"
translationDictionary.count

let oldWord = translationDictionary.updateValue("coloUr", forKey: "color")

////  Removing Objects
let removedWord = translationDictionary.removeValueForKey("Apple has")

let index = translationDictionary.startIndex
translationDictionary.removeAtIndex(index)

translationDictionary.removeAll()


// Mutability
var mutableArray = [1, 2, 3, 4]
//func mutatingTheArray(theArray: [Int]) {
//    theArray.append(5)
//}

func mutatingTheArray(var theArray: [Int]) -> [Int] {
    theArray.append(5)
    return theArray
}

mutableArray = mutatingTheArray(mutableArray)



