//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)
//定义和调用函数
func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}
print(greet(person: "Anna"))
func greetAgain(person: String) -> String {
    return "Hello again, " + person + "!"
}
print(greetAgain(person: "Anna"))

//无形式参数的函数
func sayHelloWorld() -> String {
    return "hello, world"
}
print(sayHelloWorld())

//多形式参数的函数
func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}
print(greet(person: "Tim", alreadyGreeted: true))

//无返回值的函数
//严格来讲，函数 greetAnother(person:)还是有一个返回值的，尽管没有定义返回值。没有定义返回类型的函数实际上会返回一个特殊的类型 Void。它其实是一个空的元组，作用相当于没有元素的元组，可以写作 () 。
func greetAnother(person: String) {
    print("Hello, \(person)!")
}
greetAnother(person: "Dave")
//当函数被调用时，函数的返回值可以被忽略：
func printAndCount(string: String) -> Int {
    print(string)
    return string.characters.count
}
func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}
printAndCount(string: "hello, world")
printWithoutCounting(string: "hello, world")

//多返回值的函数
//为了让函数返回多个值作为一个复合的返回值，你可以使用元组类型作为返回类型。
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1 ..< array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")

//可选元组返回类型
//如果元组在函数的返回类型中有可能“没有值”，你可以用一个可选元组返回类型来说明整个元组的可能是 nil
//在可选元组类型的圆括号后边添加一个问号（ ?）例如 (Int, Int)?  或者 (String, Int, Bool)? 。
//类似 (Int, Int)?的可选元组类型和包含可选类型的元组 (Int?, Int?)是不同的。对于可选元组类型，整个元组是可选的，而不仅仅是元组里边的单个值。
//上面的函数 minMax(array:)返回了一个包含两个 Int值的元组。总之，函数不会对传入的数组进行安全性检查。如果 array的实际参数包含了一个空的数组，上面定义的函数 minMax(array:)在尝试调用 array[0]的时候就会触发一个运行时错误。
//为了安全的处理这种“空数组”的情景，就需要把 minMax(array:)函数的返回类型写做可选元组，当数组是空的时候返回一个 nil值：
func minMaxSafe(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty {
        return nil
    }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
if let bounds = minMaxSafe(array: [8, -6, 2, 109, 3, 71]) {
    print("min is \(bounds.min) and max is \(bounds.max)")
}

//指定实际参数标签
func someFunction(argumentLabel parameterName: Int) {
    // In the function body, parameterName refers to the argument value
    // for that parameter.
}
someFunction(argumentLabel: 12)

func greetRepeat(person: String, from hometown: String) -> String {
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}
print(greetRepeat(person: "Bill", from: "Cupertino"))


//省略实际参数标签
func someFunctionAnother(_ firstParameterName: Int, secondParameterName: Int) {
    // In the function body, firstParameterName and secondParameterName
    // refer to the argument values for the first and second parameters.
}
someFunctionAnother(1, secondParameterName: 2)

//默认形式参数值
func someFunctionRepeat(parameterWithDefault: Int = 12) {
    // In the function body, if no arguments are passed to the function
    // call, the value of parameterWithDefault is 12.
}
someFunctionRepeat(parameterWithDefault: 6) // parameterWithDefault is 6
someFunctionRepeat() // parameterWithDefault is 12

//可变形式参数
//numbers类型是 Double...在函数的主体中它会被当作名字是 numbers 类型是 [Double]的常量数组。
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
arithmeticMean(3, 8.25, 18.75)

//输入输出形式参数
//如果你想函数能够修改一个形式参数的值，而且你想这些改变在函数结束之后依然生效，那么就需要将形式参数定义为输入输出形式参数。
//你只能把变量作为输入输出形式参数的实际参数。你不能用常量或者字面量作为实际参数，因为常量和字面量不能修改。在将变量作为实际参数传递给输入输出形式参数的时候，直接在它前边添加一个和符合 ( &) 来明确可以被函数修改。
//输入输出形式参数不能有默认值，可变形式参数不能标记为 inout，如果你给一个形式参数标记了 inout，那么它们也不能标记 var和 let了。
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")


//函数类型
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}
/*
 这两个函数的类型都是 (Int, Int) -> Int 。也读作：
 “有两个形式参数的函数类型，它们都是 Int类型，并且返回一个 Int类型的值。”
 */
//使用函数类型
//你可以给一个常量或变量定义一个函数类型，并且为变量指定一个相应的函数。
var mathFunction: (Int, Int) -> Int = addTwoInts
//“定义一个叫做 mathFunction的变量，它的类型是‘一个能接受两个 Int值的函数，并返回一个 Int值。’将这个新的变量指向 addTwoInts函数。”
print("Result: \(mathFunction(2, 3))")
//不同的函数如果有相同的匹配的类型的话，就可以指定相同的变量，和非函数的类型一样：
mathFunction = multiplyTwoInts
print("Result: \(mathFunction(2, 3))")

//函数类型作为形式参数类型
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 5)

//函数类型作为返回类型
func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
    return backwards ? stepBackward : stepForward
}
var currentValue = 3
let moveNearerToZero = chooseStepFunction(backwards: currentValue > 0)

print("Counting to zero:")
// Counting to zero:
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")


//内嵌函数
//可以在函数的内部定义另外一个函数。这就是内嵌函数。
func chooseStepFunctionOther(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}
//var currentValue = -4
//let moveNearerToZero = chooseStepFunctionOther(backward: currentValue > 0)
//// moveNearerToZero now refers to the nested stepForward() function
//while currentValue != 0 {
//    print("\(currentValue)... ")
//    currentValue = moveNearerToZero(currentValue)
//}
//print("zero!")
