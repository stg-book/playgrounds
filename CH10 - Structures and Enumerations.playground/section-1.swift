//  Swift Translation Guide for Objective-C Developers
//  Chapter 10 - Structures and Enumerations

import UIKit

//  Creating a structure step by step as per the book text does not work well within the context
//  of a Swift playground. As a result the much of the structure is defined in one block.
//  Illustrations of structure instance usage will still be detailed in the book order.

//    Structures
///   Defining a Structure
struct AlbumCover {
    var blackLevel: Float = 0.0
    var sexistPicture: Bool = false

    static func couldBeBlacker(blackLevel: Float) -> Bool {
        return blackLevel != blackestLevel
    }
    static let blackestLevel: Float = 1.0

    ///   Modifying a Structure
    mutating func makeNoneBlacker() {
        blackLevel = 1.0
    }
}

var albumCover = AlbumCover()
let almostBlackCover = AlbumCover(blackLevel: 0.9, sexistPicture: false)


////  Structures and C Structs
var rect = CGRect(x:50, y:50, width:100, height:100)

let height = rect.height


///   Modifying a Structure
albumCover.blackLevel = 0.5

var view = UIView(frame: rect)
view.frame.size.height = 0

var smellTheGlove = AlbumCover()
var theWhiteAlbum = smellTheGlove
smellTheGlove.blackLevel = 1.0
smellTheGlove.blackLevel
theWhiteAlbum.blackLevel


//    Enumerations
///   Creating Enumerations
enum BasicVolumeLevel: Int {
    case Off = 0, Min, Mid = 5, Max = 10
}


///   Using Enumerations
var volumeLevel = BasicVolumeLevel.Off
if volumeLevel == BasicVolumeLevel.Off {
    println("Off")
}

////  Shortened Name Syntax
volumeLevel = .Max
if volumeLevel == .Max {
    println("Max")
}

switch volumeLevel {
case .Off:
    println("Off")
case .Min:
    println("Min")
case .Mid:
    println("Mid")
case .Max:
    println("Max")
}

////  Working With Raw Values
enum IntVolumeLevel: Int {
    case Off = 0, Min, Mid = 5, Max = 10
}

enum StringVolumeLevel: String {
    case Off = "Off", Min = "Minimum", Mid = "Mid-level", Max = "Maximum"
}

StringVolumeLevel.Mid.rawValue

var maximumLevel = StringVolumeLevel(rawValue: "Maximum")


///   Associated Values
enum VolumeLevel {
    case Off
    case Min(Int)
    case Mid(minLevel: Int, maxLevel: Int)
    case Max(Int)
    case Tufnel(String)

    ///   Methods and Computed Properties
    var numericalLevel: Int {
        get {
            switch self {
            case Off:
                return 0
            case Min(let level):
                return level
            case Max(let level):
                return level
            case Mid(let minLevel, let maxLevel):
                return (maxLevel - minLevel) / 2
            case Tufnel:
                return 11
            }
        }
    }
}

var currentLevel: VolumeLevel
currentLevel = .Off;
currentLevel = .Min(1)
currentLevel = .Mid(minLevel: 1, maxLevel: 10)
currentLevel = .Max(10)
currentLevel = .Tufnel("It's one louder")

switch currentLevel {
case .Off:
    println("Off is always 0")
case .Min(let minLevel):
    println("Minimim level: \(minLevel)")
case .Mid(let minLevel, let maxLevel):
    let midLevel = (maxLevel - minLevel) / 2
    println("Medium level: \(midLevel)")
case .Max(let level):
    println("Maximum level: \(level)")
case .Tufnel(let nigelSpeaks):
    print("Nigel says: \(nigelSpeaks)");
}


//    Nesting Types
class VolumeControl {
    enum VolumeLevel {
        case Off
        case Min(Int)
        case Mid(minLevel: Int, maxLevel: Int)
        case Max(Int)
        case Tufnel(String)

        var numericalLevel: Int {
            get {
                switch self {
                case Off:
                    return 0
                case Min(let level):
                    return level
                case Max(let level):
                    return level
                case Mid(let minLevel, let maxLevel):
                    return (maxLevel - minLevel) / 2
                case Tufnel:
                    return 11
                }
            }
        }
    }

    var volumeLevel: VolumeLevel = VolumeLevel.Off
}

var secretVolumeLevel: VolumeControl.VolumeLevel = VolumeControl.VolumeLevel.Off

