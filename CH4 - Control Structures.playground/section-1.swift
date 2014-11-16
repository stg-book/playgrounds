//  Swift Translation Guide for Objective-C Developers
//  Chapter 4 - Control Structures

import UIKit

//    General Changes
///   Parentheses Are Optional
for var i = 0; i < 3; i++ {  }


///   Braces Are Mandatory
let number = 0
if number < 0 {
    println("Negative number")
} else if number > 0 {
    println("Positive number")
} else {
    println("Zero")
}


///   Boolean Conditions
let integerValue = 0
if integerValue != 0 {
    // Perform an action if not zero
}


//    Loops
///   For and For-In
for i in 1...10 {  }

for _ in 1...10 {  }


///   While and Do-While
var possibleView: UIView?
while let actualView = possibleView?.superview {
    possibleView = actualView
}


//    To Integers and Beyond!
///   Strings
let stringValue = "MatchB"
switch stringValue {
    case "MatchA":
        println("MatchA")
    case "MatchB":
        println("MatchB")
    default:
        println("Default")
}


///   Enumerations
var cell = UITableViewCell()
switch cell.accessoryType {
    case UITableViewCellAccessoryType.None:
        println("None")
    case UITableViewCellAccessoryType.DisclosureIndicator:
        println("Disclosure Indicator")
    case UITableViewCellAccessoryType.DetailDisclosureButton:
        println("Disclosure Button")
    case UITableViewCellAccessoryType.Checkmark:
        println("Checkmark")
    case UITableViewCellAccessoryType.DetailButton:
        println("Detail Button")
}


///   Ranges
var testScore = 73
var grade = ""
switch testScore {
    case 0..<40:
        grade = "F"
    case 40..<60:
        grade = "C"
    case 60..<80:
        grade = "B"
    default:
        grade = "A"
}


///   Pattern Matching
////  Tuples
var indexPath = NSIndexPath(forRow: 0, inSection: 1)

switch (indexPath.section, indexPath.row) {
case (0, 0):
    println("Configuring one row in section 0")
case (1, 0):
    println("Configuring cell in row 0 distinct from the rest of section 1")
case (1, 1):
    println("Configuring cell in row 1 distinct from the rest of section 1")
case (2, 0):
    println("Configuring general cell in section 2")
case (2, 1):
    println("Configuring general cell in section 2")
case (2, 2):
    println("Configuring general cell in section 2")
case (2, 3):
    println("Configure cells in rows 3, 4 and 5 distinct from rest of section 2")
case (2, 4):
    println("Configure cells in rows 3, 4 and 5 distinct from rest of section 2")
case (2, 5):
    println("Configure cells in rows 3, 4 and 5 distinct from rest of section 2")
case (2, 6):
    println("Configuring general cell in section 2")
case (3, 0):
    println("Configuring general cell in section 3")
case (4, 0):
    println("Configuring general cell in section 4")
}

////  Wildcards
switch (indexPath.section, indexPath.row) {
case (0, _):
    println("Configuring section 0")
case (1, 0):
    println("Configuring cell in row 0 distinct from the rest of section 1")
case (1, _):
    println("Configure remaining cells in section 1 the same way")
case (2, 3):
    println("Configure cells in rows 3, 4 and 5 distinct from rest of section 2")
case (2, 4):
    println("Configure cells in rows 3, 4 and 5 distinct from rest of section 2")
case (2, 5):
    println("Configure cells in rows 3, 4 and 5 distinct from rest of section 2")
case (2, _):
    println("Configure remaining cells in section 2 the same way")
case (_, 0):
    println("Configure row 0 in any other sections distinct from the rest of the section")
case (_, _):
    println("Configure remaining cells in any other sections the same way")
}


switch (indexPath.section, indexPath.row) {
case (0, _):
    println("Configuring section 0")
case (1, 0):
    println("Configuring cell in row 0 distinct from the rest of section 1")
case (1, _):
    println("Configure remaining cells in section 1 the same way")
case (2, 3...5):
    println("Configure cells in rows 3, 4 and 5 distinct from rest of section 2")
case (2, _):
    println("Configure remaining cells in section 2 the same way")
case (_, 0):
    println("Configure row 0 in any other sections distinct from the rest of the section")
case (_, _):
    println("Configure remaining cells in any other sections the same way")
}


////  Value Bindings
switch (indexPath.section, indexPath.row) {
case (0, _):
    println("Configuring section 0")
case (1, 0):
    println("Configuring cell in row 0 distinct from the rest of section 1")
case (1, _):
    println("Configure remaining cells in section 1 the same way")
case (2, 3...5):
    println("Configure cells in rows 3, 4 and 5 distinct from rest of section 2")
case (2, _):
    println("Configure remaining cells in section 2 the same way")
case (_, 0):
    println("Configure row 0 in any other sections distinct from the rest of the section")
case (var section, var row):
    section++
    row++
    println("Configuring cell \(row) in section \(section)")
}


////  Where Clauses

let highlightedSections = [ indexPath.section ]
let highlightedRows = [ indexPath.row ]
switch (indexPath.section, indexPath.row) {
case (0, _):
    println("Configuring section 0")
case (1, 0):
    println("Configuring cell in row 0 distinct from the rest of section 1")
case (1, _):
    println("Configure remaining cells in section 1 the same way")
case (2, 3...5):
    println("Configure cells in rows 3, 4 and 5 distinct from rest of section 2")
case (2, _):
    println("Configure remaining cells in section 2 the same way")
case (_, 0):
    println("Configure row 0 in any other sections distinct from the rest of the section")
case (var section, let row) where
        contains(highlightedSections, indexPath.section) &&
        contains(highlightedRows, indexPath.row):
    section++
    println("Configuring highlighted cell \(row + 1) in section \(section)")
case (var section, let row):
    section++
    println("Configuring cell \(row + 1) in section \(section)")
}



