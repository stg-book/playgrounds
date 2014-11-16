//  Swift Translation Guide for Objective-C Developers
//  Chapter 13 - Protocols, Extensions, and Generics

import UIKit

//    Protocols
///   Creating
////  Methods

protocol Estimatable {
    func produceValidEstimate(guess: Int) -> Int
    mutating func decreaseEstimate()

////  Properties
    var maximumValue: Int { get }
    var estimate: Int { get set }
}


///   Conforming to Protocols
struct StoryPoint: Estimatable {
    var maximumValue: Int {
        return 5
    }
    var estimate: Int = 0
    func produceValidEstimate(guess: Int) -> Int {
        return estimate
    }
    mutating func decreaseEstimate() {
        if estimate > 0 { estimate-- }
    }
}

protocol Guessable { }
var estimatableGuessableItem: protocol<Estimatable, Guessable>



//    Extensions
extension StoryPoint {
    mutating func managerOverride() {
        decreaseEstimate()
    }
}


//    Generics
///   Generic Functions

func arrayicize<T>(type: T) -> [T] {
    var arrayOfType: [T] = [type]
    return arrayOfType
}

arrayicize("One")
arrayicize(1)


///   Generic Types
class PointEstimator <T> {
    private var points = [T]()
    func addPoint(point: T) { points.append(point) }
    func estimateFromUserStory(story: String) -> T? {
        let i = arc4random_uniform(UInt32(points.count))
        return points[Int(i)]
    }
}

var estimator = PointEstimator<StoryPoint>()

estimator.addPoint(StoryPoint(estimate: 0))
estimator.addPoint(StoryPoint(estimate: 1))
estimator.addPoint(StoryPoint(estimate: 2))
estimator.addPoint(StoryPoint(estimate: 3))

estimator.estimateFromUserStory("User story")
estimator.estimateFromUserStory("Complex story")
estimator.estimateFromUserStory("Simple story")

class StoryPointEstimator <T: Estimatable> { }

