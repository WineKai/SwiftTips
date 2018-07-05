//: [Previous](@previous)

import Foundation

let languageName = "Swift"
//languageName = "Swift++"
// this is a compile-time error - languageName cannot be changed


// MARK: --元组
let http404Error = (404, "Not Found")

//可以将一个元组的内容分解成单独的常量或变量：
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")

//分解元组的时候，如果只需要使用其中的一部分数据，不需要的数据可以用下滑线（ _ ）代替：
let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")

//利用从零开始的索引数字访问元组中的单独元素：
print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")

//定义元组的时候给其中的单个元素命名：
let http200Status = (statusCode: 200, description: "OK")
//命名之后，可以通过访问名字来获取元素的值了：
print("The status code is \(http200Status.statusCode)")
print("The status message is \(http200Status.description)")


/*可选项
可以利用可选项来处理值可能缺失的情况。可选项意味着：

这里有一个值，他等于x
或者

这里根本没有值
 NOTE:在 C 和 Objective-C 中，没有可选项的概念。在 Objective-C 中有一个近似的特性，一个方法可以返回一个对象或者返回 nil 。 nil 的意思是“缺少一个可用对象”。然而，他只能用在对象上，却不能作用在结构体，基础的 C 类型和枚举值上。对于这些类型，Objective-C 会返回一个特殊的值（例如 NSNotFound ）来表示值的缺失。这种方法是建立在假设调用者知道这个特殊的值并记得去检查他。然而，Swift 中的可选项就可以让你知道任何类型的值的缺失，他并不需要一个特殊的值。
 */

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

var serverResponseCode: Int? = 404
serverResponseCode = nil
/*
 nil 不能用于非可选的常量或者变量，如果你的代码中变量或常量需要作用于特定条件下的值缺失，可以给他声明为相应类型的可选项。
 
 Swift 中的 nil 和Objective-C 中的 nil 不同，在 Objective-C 中 nil 是一个指向不存在对象的指针。在 Swift中， nil 不是指针，他是值缺失的一种特殊类型，任何类型的可选项都可以设置成 nil 而不仅仅是对象类型。
 
 */
// MARK:-If 语句以及强制展开
if convertedNumber != nil {
    print("convertedNumber contains some integer value.")
}
//一旦你确定可选中包含值，你可以在可选的名字后面加一个感叹号 （ ! ） 来获取值，感叹号的意思就是说“我知道这个可选项里边有值，展开吧。”这就是所谓的可选值的强制展开。

if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!).")
}

//可选项绑定
//下面的两个 if 语句是等价的：
if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}

if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}


//有时在一些程序结构中可选项一旦被设定值之后，就会一直拥有值。在这种情况下，就可以去掉检查的需求，也不必每次访问的时候都进行展开，因为它可以安全的确认每次访问的时候都有一个值。
//可以把隐式展开可选项当做在每次访问它的时候被给予了自动进行展开的权限，你可以在声明可选项的时候添加一个叹号而不是每次调用的时候在可选项后边添加一个叹号。
//不要在一个变量将来会变为 nil 的情况下使用隐式展开可选项。如果你需要检查一个变量在生存期内是否会变为 nil ，就使用普通的可选项
let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // 需要感叹号

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString // 不需要感叹号

//错误处理
func canThrowAnError() throws {
    // this function may or may not throw an error
//    通过在函数声明过程当中加入 throws 关键字来表明这个函数会抛出一个错误。当你调用了一个可以抛出错误的函数时，需要在表达式前预置 try 关键字。
}
//Swift 会自动将错误传递到它们的生效范围之外，直到它们被 catch 分句处理。
do {
    try canThrowAnError()
    // no error was thrown
} catch {
    // an error was thrown
}
//do 语句创建了一个新的容器范围，可以让错误被传递到到不止一个的 catch 分句里。


//断言和先决条件

//断言和先决条件用来检测运行时发生的事情。使用它们来保证在执行后续代码前某必要条件是满足的
//使用断言和先决条件来验证那些你在写代码时候的期望和假定
//不同于错误处理中，断言和先决条件并不用于可回复或者期望的错误。由于错误断言或先决条件显示非法的程序状态，所以没办法来抓取错误断言。
//使用他们来强制数据和状态正确会让你的 app 在有非法状态时终止的更可预料，并帮助你更好的 debug。在检测到异常状态时尽可能快地停止执行同样能够帮助你减小由于异常状态造成的损失。
//断言和先决条件的不同之处在于他们什么时候做检查：断言只在 debug 构建的时候检查，但先决条件则在 debug 和生产构建中生效。在生产构建中，断言中的条件不会被计算。这就是说你可以在开发的过程当中随便使用断言而无需担心影响生产性能。
let age = -3
//下面一行代码会抛出：Assertion failed: A person's age cannot be less than zero: file MyPlayground.playground, line 112
//assert(age >= 0, "A person's age cannot be less than zero")

if age > 10 {
    print("You can ride the roller-coaster or the ferris wheel.")
} else if age > 0 {
    print("You can ride the ferris wheel.")
} else {
//  下面一行代码会抛出  Fatal error: A person's age can't be less than zero.: file MyPlayground.playground, line 119
//    assertionFailure("A person's age can't be less than zero.")
}

//MARK: -- 强制先决条件
//在你代码中任何条件可能潜在为假但必须肯定为真才能继续执行的地方使用先决条件。比如说，使用先决条件来检测下标没有越界，或者检测函数是否收到了一个合法的值。

// In the implementation of a subscript...
//precondition(index > 0, "Index must be greater than zero.")

//字符串
//如果需要很多行的字符串，使用多行字符串字面量。多行字符串字面量是用三个双引号引起来的一系列字符：
let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""
//如同上面展示的那样，由于多行用了三个双引号而不是一个，你可以在多行字面量中使用单个双引号 " 。要在多行字符串中包含 """ ，你必须用反斜杠（ \ ）转义至少其中一个双引号。举例来说：
let threeDoubleQuotes = """
Escaping the first quote \"""
Escaping all three quotes \"\"\"
"""
//多行字符串可以缩进以匹配周围的代码。双引号（ """ ）前的空格会告诉 Swift 其他行前应该有多少空白是需要忽略的。比如说，尽管下面函数中多行字符串字面量缩进了，但实际上字符串不会以任何空白开头。
func generateQuotation() -> String {
    let quotation = """
        The White Rabbit put on his spectacles.  "Where shall I begin,
        please your Majesty?" he asked.
        
        "Begin at the beginning," the King said gravely, "and go on
        till you come to the end; then stop."
        """
    return quotation
}
print(quotation == generateQuotation())

//Swift 的 String类型是一种值类型。如果你创建了一个新的 String值， String值在传递给方法或者函数的时候会被复制过去，还有赋值给常量或者变量的时候也是一样。每一次赋值和传递，现存的 String值都会被复制一次，传递走的是拷贝而不是原本, 编译器优化了字符串使用的资源，实际上拷贝只会在确实需要的时候才进行。

//连接字符串和字符
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2

var instruction = "look over"
instruction += string2

let exclamationMark: Character = "!"
welcome.append(exclamationMark)

//字符串插值
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"

//字符串字面量中的特殊字符
/*
转义特殊字符 \0 (空字符)， \\ (反斜杠)， \t (水平制表符)， \n (换行符)， \r(回车符)， \" (双引号) 以及 \' (单引号)；
任意的 Unicode 标量，写作 \u{n}，里边的 n是一个 1-8 个与合法 Unicode 码位相等的16进制数字。
 */
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
// "Imagination is more important than knowledge" - Einstein
let dollarSign = "\u{24}" // $, Unicode scalar U+0024
let blackHeart = "\u{2665}" // ♥, Unicode scalar U+2665
let sparklingHeart = "\u{1F496}" // 💖, Unicode scalar U+1F496


let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.count) characters")
