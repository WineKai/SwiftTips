//: [Previous](@previous)

import Foundation

let exampleStr = "This is an example!"

exampleStr[exampleStr.startIndex]

exampleStr[exampleStr.index(before: exampleStr.endIndex)]

exampleStr[exampleStr.index(after: exampleStr.startIndex)]

let index = exampleStr.index(exampleStr.startIndex, offsetBy: 3)
exampleStr[index]

for index in exampleStr.indices {
    print("\(exampleStr[index])", separator: "_", terminator: " ")
}
