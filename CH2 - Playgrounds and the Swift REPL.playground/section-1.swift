//  Swift Translation Guide for Objective-C Developers
//  Chapter 2 - Playgrounds and the Swift REPL

import UIKit


//    Swift Playgrounds
///   A Quick Tour of Swift Playgrounds
////  The Results Sidebar

var name = "Objective-C"
name = "Swift"
var str = "Hello, " + name


////  Quick Look

let parentView = UIView(frame: CGRectMake(0, 0, 200, 100))
parentView.backgroundColor = UIColor.redColor()

let childView = UIView(frame: CGRectMake(0, 0, 160, 60))
childView.backgroundColor = UIColor.whiteColor()

parentView.addSubview(childView)
childView.center = parentView.center

let label = UILabel(frame: CGRectMake(0, 0, 160, 60))
label.textAlignment = NSTextAlignment.Center
label.text = "Swift!"

childView.addSubview(label)
parentView


////  The Timeline

var sum = 0
for (var i = 1; i <= 10; i++) {
    sum += i
}

