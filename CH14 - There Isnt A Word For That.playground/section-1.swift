//  Swift Translation Guide for Objective-C Developers
//  Chapter 14 - There Isn't A Word For That

import UIKit

// Only in Objective-C

//var method: Method = class_getInstanceMethod(object_getClass(dict), Selector.convertFromStringLiteral("description"))


class DynamicClass: NSObject {
    @objc func myMethod() {

    }
}

class NSObject: Foundation.NSObject { }

func underscore(number: Int) {

}

//    New to Swift
///   Custom Operators

infix operator /^ { associativity left precedence 100 }
func /^ (left: Double, right: Double) -> Int {
    return Int(ceil(left / right))
}

let pageCount = 3100 /^ 250

protocol Estimatable {
    func produceValidEstimate(guess: Int) -> Int
    mutating func estimateHigh()
    mutating func increaseEstimate()
    mutating func decreaseEstimate()

    var maximumValue: Int { get }
    var estimate: Int { get set }
}

struct StoryPoint: Estimatable {
    var maximumValue: Int {
        return 5
    }
    var estimate: Int = 0
    func produceValidEstimate(guess: Int) -> Int {
        return estimate
    }
    mutating func estimateHigh() {
        estimate = maximumValue
    }
    mutating func increaseEstimate() {
        if estimate < maximumValue { estimate++ }
    }
    mutating func decreaseEstimate() {
        if estimate > StoryPoint.minimumValue { estimate-- }
    }
    static var minimumValue: Int { return 0 }
}

func + (left: StoryPoint, right: StoryPoint) -> StoryPoint {
    return StoryPoint(estimate: (left.estimate + right.estimate))
}
let onePointer = StoryPoint(estimate: 1)
let twoPointer = StoryPoint(estimate: 2)
let threePointer = onePointer + twoPointer



///   Filter, Map, and Reduce
class Story {
    let name: String
    var point: StoryPoint
    init(_ name: String, _ point: StoryPoint) {
        self.name = name
        self.point = point
    }
}

let currentStories = [
    Story("Story 1", StoryPoint(estimate: 3)),
    Story("Story 2", StoryPoint(estimate: 1)),
    Story("Story 3", StoryPoint(estimate: 4)),
    Story("Story 4", StoryPoint(estimate: 1)),
    Story("Story 5", StoryPoint(estimate: 3)),
    Story("Story 6", StoryPoint(estimate: 2)),
    Story("Story 7", StoryPoint(estimate: 0)),
    Story("Story 8", StoryPoint(estimate: 1))
]

////  Filter
let filteredStories = filter(currentStories) { (story: Story) -> Bool in
    return story.point.estimate > 0 && story.point.estimate < 4
}

filteredStories.count


////  Map
let pointsOnly = map(filteredStories) { (story: Story) -> Int in
    let point = story.point
    return point.estimate
}

pointsOnly


////  Reduce
let totalPoints = reduce(pointsOnly, 0) { (subtotal: Int, nextValue: Int) -> Int in
    return subtotal + nextValue
}

totalPoints
