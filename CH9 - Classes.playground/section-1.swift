//  Swift Translation Guide for Objective-C Developers
//  Chapter 9 - Classes

import UIKit

//  Creating a class step by step as per the book text does not work well within the context
//  of a Swift playground. As a result the much of the class is defined in one block. 
//  Illustrations of class instance usage will still be detailed in the book order.

//    Creating Classes
class BasicControl {

}

class VolumeControl : BasicControl {
    ///   Methods
    func pumpItUp() { }
    class func controlName() -> String { return "Volume" }

    //    Properties
    ///   Stored Properties
    let maxLevel = 10

    ////  Property Observers
    private var internalLevel: Int = 0 {
        willSet {
            if newValue > maxLevel {
                println("Level \(newValue) will exceed max. Preventing this")
            }
        }
        didSet {
            if oldValue == maxLevel {
                internalLevel = maxLevel
            }
        }
    }

    ////  Computed Properties
    var level: Int {
        get {
            return internalLevel
        }
        set(newLevel) {
            internalLevel = newLevel
        }
    }

    ////  Lazy Stored Properties
    lazy var volumeView = UIView()


    //    Initializers
    ///   Using Convenience and Designated Initializers
    init(maxLevel: Int, initialLevel: Int) {
        self.maxLevel = maxLevel
        self.internalLevel = initialLevel

        //    Inheritance
        ///   Calling to the Superclass
        super.init()
    }

    convenience init(goesToEleven: Bool) {
        if goesToEleven {
            self.init(maxLevel: 11, initialLevel: 11)
        } else {
            self.init()
        }
    }

    //    Inheritance
    ///   Overriding a Method
    convenience override init() {
        self.init(maxLevel: 10, initialLevel: 7)
    }

    //    Subscripting
    subscript(levelName: String) -> Int? {
        get {
            switch levelName {
            case "Off":
                return 0
            case "Min":
                return 1
            case "Mid":
                return (maxLevel / 2)
            case "Max":
                return maxLevel
            default:
                return nil
            }
        }
    }
}

var volumeControl = VolumeControl()


//    Methods
volumeControl.pumpItUp()
VolumeControl.controlName()
volumeControl.dynamicType.controlName()


//    Properties
///   Stored Properties
var level: Int
level = volumeControl.level
level = volumeControl.maxLevel

volumeControl.level = 1
level = volumeControl.level


//    Initializers
volumeControl = VolumeControl.init()
volumeControl = VolumeControl()


///   Using Convenience and Designated Initializers
var restrictedVolumeControl = VolumeControl(maxLevel: 7, initialLevel: 3)

var tufnelVolumeControl = VolumeControl(goesToEleven: true)


//    Subscripting
var standardVolumeControl = VolumeControl()

standardVolumeControl["Mid"]
tufnelVolumeControl["Max"]
tufnelVolumeControl["Other"]

