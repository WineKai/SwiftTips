//: [Previous](@previous)

import Foundation


//闭包表达式

let names = ["Chris","Alex","Ewa","Barry","Daniella"]

func backward (_ s1 : String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)
var testNames = names.sorted()

//闭包表达式语法
//展示一个之前 backward(_:_:) 函数的闭包表达版本：
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
//闭包的函数整体部分由关键字 in 导入，这个关键字表示闭包的形式参数类型和返回类型定义已经完成，并且闭包的函数体即将开始。
//闭包的函数体特别短以至于能够只用一行来书写：
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 } )
//从语境中推断类型
//当闭包被用作函数的实际参数时你都不需要用完整格式来书写行内闭包。
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )

//从单表达式闭包隐式返回
//单表达式闭包能够通过从它们的声明中删掉 return 关键字来隐式返回它们单个表达式的结果，前面的栗子可以写作：
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )

//简写的实际参数名
//Swift 自动对行内闭包提供简写实际参数名，你也可以通过 $0 , $1 , $2 等名字来引用闭包的实际参数值。
reversedNames = names.sorted(by: { $0 > $1 } )

//运算符函数
//Swift 的 String 类型定义了关于大于号（ >）的特定字符串实现，让其作为一个有两个 String 类型形式参数的函数并返回一个 Bool 类型的值
reversedNames = names.sorted(by: >)



//尾随闭包
//如果你需要将一个很长的闭包表达式作为函数最后一个实际参数传递给函数，使用尾随闭包将增强函数的可读性。尾随闭包是一个被书写在函数形式参数的括号外面（后面）的闭包表达式：

func someFunctionThatTakesAClosure(closure:() -> Void){
    //function body goes here
}

//这里是您如何调用该函数而不使用尾随闭包。

someFunctionThatTakesAClosure(closure: {
    //closure's body goes here
})

//下面是如何使用尾随闭包来调用这个函数。

someFunctionThatTakesAClosure() {
    // trailing closure's body goes here
}

//来自于上文的 闭包表达式一节的字符串排列闭包也可以作为一个尾随闭包被书写在 sorted(by:) 方法的括号外面：
reversedNames = names.sorted() { $0 > $1 }
//如果闭包表达式作为函数的唯一实际参数传入，而你又使用了尾随闭包的语法，那你就不需要在函数名后边写圆括号了：
reversedNames = names.sorted { $0 > $1 }

let digitNames = [
    0: "Zero",1: "One",2: "Two",  3: "Three",4: "Four",
    5: "Five",6: "Six",7: "Seven",8: "Eight",9: "Nine"
]

let numbers = [16,58,510]

// number.map不需要在 map 后面加任何圆括号，因为 map(_:)方法仅仅只有一个形式参数，这个形式参数将以尾随闭包的形式来书写：
let strings = numbers.map {
    (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}




//捕获值
//一个闭包能够从上下文捕获已被定义的常量和变量。即使定义这些常量和变量的原作用域已经不存在，闭包仍能够在其函数体内引用和修改这些值。

//incrementer() 函数是没有任何形式参数， runningTotal 和 amount 不是来自于函数体的内部，而是通过捕获主函数的 runningTotal 和 amount 把它们内嵌在自身函数内部供使用。
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
//return a value of 10
incrementByTen()
//return a value of 20
incrementByTen()
//return a value of 30

let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()
// returns a value of 7

//再次调用原来增量器 ( incrementByTen )  继续增加它自己的变量 runningTotal 的值，并且不会影响 incrementBySeven 捕获的变量 runningTotal 值：
incrementByTen()
// returns a value of 40

//闭包是引用类型
//无论你什么时候安赋值一个函数或者闭包给常量或者变量，你实际上都是将常量和变量设置为对函数和闭包的引用。这上面这个例子中，闭包选择 incrementByTen 指向一个常量，而不是闭包它自身的内容。
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()
//return a value of 50



//逃逸闭包

//当闭包作为一个实际参数传递给一个函数的时候，我们就说这个闭包逃逸了，因为它可以在函数返回之后被调用。
//当你声明一个接受闭包作为形式参数的函数时，你可以在形式参数前写 @escaping 来明确闭包是允许逃逸的。
//很多函数接收闭包实际参数来作为启动异步任务的回调。函数在启动任务后返回，但是闭包要直到任务完成——闭包需要逃逸，以便于稍后调用。
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

//让闭包 @escaping 意味着你必须在闭包中显式地引用 self ，比如说，下面的代码中，传给 someFunctionWithEscapingClosure(_:) 的闭包是一个逃逸闭包，也就是说它需要显式地引用 self 。相反，传给 someFunctionWithNonescapingClosure(_:) 的闭包是非逃逸闭包，也就是说它可以隐式地引用 self 。
func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}
class SomeClass {
    var x = 10
    func dpSomething() {
        someFunctionWithEscapingClosure {
            self.x = 100
        }
        someFunctionWithNonescapingClosure {
            x = 200
        }
    }
}
let instance = SomeClass()
instance.dpSomething()
print(instance.x)

completionHandlers.first?()
print(instance.x)


//自动闭包
//自动闭包允许你延迟处理，因此闭包内部的代码直到你调用它的时候才会运行。对于有副作用或者占用资源的代码来说很有用，因为它可以允许你控制代码何时才进行求值。
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)
// Prints "5"
let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)
// Prints "5"
print("Now serving \(customerProvider())!")
// Prints "Now serving Chris!"
print(customersInLine.count)
// Prints "4"
// NOTE:--尽管 customersInLine 数组的第一个元素以闭包的一部分被移除了，但任务并没有执行直到闭包被实际调用。如果闭包永远不被调用，那么闭包里边的表达式就永远不会求值。注意 customerProvider 的类型不是 String 而是  () -> String ——一个不接受实际参数并且返回一个字符串的函数。

//NOTE:----- customerProvider 的类型不是 String 而是  () -> String ——一个不接受实际参数并且返回一个字符串的函数。

//当你传一个闭包作为实际参数到函数的时候，你会得到与延迟处理相同的行为。
// customersInLine is ["Alex", "Ewa", "Barry", "Daniella"]
func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: { customersInLine.remove(at: 0) } )
// Prints "Now serving Alex!"
/*
上边的函数 serve(customer:) 接收一个明确的返回下一个客户名称的闭包。下边的另一个版本的 serveOther(customer:) 执行相同的任务但是不使用明确的闭包而是通过 @autoclosure 标志标记它的形式参数使用了自动闭包。现在你可以调用函数就像它接收了一个 String 实际参数而不是闭包。实际参数自动地转换为闭包，因为 customerProvider 形式参数的类型被标记为 @autoclosure 标记。
 */
// customersInLine is ["Ewa", "Barry", "Daniella"]
func serveOther(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serveOther(customer: customersInLine.remove(at: 0))
// Prints "Now serving Ewa!"
//滥用自动闭包会导致你的代码难以读懂。上下文和函数名应该写清楚求值是延迟的。


//如果你想要自动闭包允许逃逸，就同时使用 @autoclosure 和 @escaping 标志。
// customersInLine is ["Barry", "Daniella"]
var customerProviders: [() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}
collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))

print("Collected \(customerProviders.count) closures.")
// Prints "Collected 2 closures."
for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")
}
// Prints "Now serving Barry!"
// Prints "Now serving Daniella!"

