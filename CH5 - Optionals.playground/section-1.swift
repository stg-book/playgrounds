//  Swift Translation Guide for Objective-C Developers
//  Chapter 5 - Optionals

import UIKit


//    Using An Optional
var optional: Int? = 0
var anotherOptional: Int?
anotherOptional = optional

///   Unwrapping
var message: String? = "hi there"
var tidyMessage = message!.capitalizedString

message = nil
if message != nil {
    tidyMessage = message!.capitalizedString
}


///   Optional Binding
if message != nil {
    let definiteMessage = message!
    tidyMessage = definiteMessage.capitalizedString
}

if let definiteMessage = message {
    tidyMessage = definiteMessage.capitalizedString
}


///   Implicit Unwrapping
message = "hi there"
var definiteMessage: String! = message
tidyMessage = definiteMessage.capitalizedString


///   Optional Chaining
let bottomView = UIView()
let view2 = UIView()
let view3 = UIView()
let view4 = UIView()

view4.addSubview(view3)
view3.addSubview(view2)
view2.addSubview(bottomView)

if let secondView = bottomView.superview {
    if let thirdView = secondView.superview {
        if let fourthView = thirdView.superview {
            fourthView
        }
    }
}

let fourthView = bottomView.superview?.superview?.superview


//    Things to Watch Out For
///   Nil Coalescing Operator
definiteMessage = message != nil ? message! : "Default"

definiteMessage = message ?? "Default"


///   No Need to Unwrap
var optionalWithoutValue: String? = nil
var interpolatedString = "Here comes the optional: \(optionalWithoutValue)!"

