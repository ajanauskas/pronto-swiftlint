import Foundation

let someForceCast = NSObject() as! Int
let colonOnWrongSide :Int = 0
// SwiftLint is syntax-aware
// NSNumber() as! Int => no error
"let colonOnWrongSide :Int = 0" // => no error
