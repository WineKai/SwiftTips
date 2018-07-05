//: Playground - noun: a place where people can play

import UIKit

// MARK: --swift 概览
//
//var str = "Hello, playground"
//
//print(str)
//
//
//var myA = 42
//myA = 50
//let myCount = 42
//let floatNum: Float = 4
//
//
//let label = "The width is"
//let width = 94
//
//// string 拼接
//
//// 去掉String 报错  Binary operator '+' cannot be applied to operands of type 'String' and 'Int'
//let widthLabel = label + String(width)
//
//let apples = 3
//let oranges = 5
//let appleSummary = "I have \(apples) apples"
//let fruitSummary = "I have \(apples + oranges) pieces of fruit."
//
//// 数组或字典
//
//// 使用[]声明
//var shoppingList = ["catfish", "water", "tulips", "blue paint"]
//shoppingList[1] = "bottle of water"
//
//var occupations = ["Malcolm":"Captain", "Kaylee":"Mechanic",]
//occupations["Jayne"] = "Public Relations"
//
//// 使用初始化器创建
//let emptyArray = [String]()
//let emptyDictionary = [String: Float]()
//
//// 如果类型信息能被推断，可以用下面的方法表示空数组和空字典
//shoppingList = []
//occupations = [:]
//
////MARK:- 控制流
//let individualScores = [75, 43, 103, 87, 12]
//var teamScore = 0
//for score in individualScores {
//    /**
// if语句当中，条件必须是布尔表达式——这意味着比如说
//     if score {...}将会报错，不再隐式地与零做计算了。
//     */
//    if score > 50 {
//        teamScore += 3
//    } else {
//        teamScore += 1
//    }
//}
//print(teamScore)
//
//var optionalString: String? = "Hello"
//print(optionalString == nil)
//
//
////var optionalName: String? = "John Appleseed"
//var optionalName: String?
//var greeting = "Hello!"
//if let name = optionalName {
//    greeting = "Hello, \(name)"
//} else {
//    greeting = "Hello！"
//}
//// 使用 ?? 运算符提供默认值。如果可选值丢失，默认值就会使用。
//let nickName: String? = nil
//let fullName: String = "John Appleseed"
//let infomalGreeting = "Hi \(nickName ?? fullName)"
//
////Switch 选择语句支持任意类型的数据和各种类型的比较操作——它不再限制于整型和测试相等上。
//let vegetable = "red pepper"
//switch vegetable {
//case "celery":
//    print("celery")
//case "cucumber", "watercress":
//    print("cucumber and watercress")
//case let x where x.hasSuffix("pepper"):
//    print("Is it a spicy \(x)?")
//    // 如果去掉default 报错Switch must be exhaustive
//default:
//    print("Everything tastes good in soup")
//}
//// NOTE:- 在执行完 switch 语句里匹配到的 case 之后，程序就会从 switch 语句中退出。执行并不会继续跳到下一个 case 里，所以完全没有必要显式地在每一个 case 后都标记 break 。
//
//
//let interestingNumbers = ["Prime": [2, 3, 5, 7, 11, 13], "Fibonacci": [1, 1, 2, 3, 5, 8], "Square": [1, 4, 9, 16, 25]]
//var largest = 0
//var largestKey = ""
//for (kind, numbers) in interestingNumbers {
//    for numer in numbers {
//        if numer > largest {
//            largest = numer
//            largestKey = kind
//        }
//    }
//}
//print(largest,largestKey)


//// 使用 while来重复代码快直到条件改变。循环的条件可以放在末尾，这样可以保证循环至少运行了一次。
//
//var n = 2
//while n < 2 {
//    n = n * 2
//}
//print(n)
//
//var m = 2
//repeat {
//    m = m * 2
//} while m < 2
//print(m)
//
//// ..< 创建一个不包含最大值的区间，使用 ... 来创造一个包含最大值和最小值的区间
//var total = 0
//for i in 0 ..< 4 {
//    total += i
//}
//print(total)
//
//
////MARK: - 函数和闭包
//func greet(person: String, day: String) -> String {
//    return "Hello \(person), today is \(day)"
//}
//greet(person: "Bob", day: "Tuesday")
//
//func greet2(_ person: String, on day: String) ->String {
//    return "Hello \(person), today is \(day)"
//}
//greet2("Bob", on: "Wednesday")
//
//
//func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
//    var min = scores[0]
//    var max = scores[0]
//    var sum = 0
//    
//    for score in scores {
//        if score > max {
//            max = score
//        } else if score < min {
//            min = score
//        }
//        sum += score
//    }
//    return (min, max, sum)
//}
//
//// 元组-statistics的调用方法
//let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
//print(statistics.sum)
//print(statistics.2)
//
//// 函数同样可以接受多个参数，然后把它们存放进数组当中
//func sumOf(numbers: Int...) -> Int {
//    var sum = 0
//    for number in numbers {
//        sum += number
//    }
//    return sum
//}
//
//sumOf()
//sumOf(numbers: 42, 597, 12)
//
//
//// 函数内嵌
//func returnFifteen() -> Int {
//    var y = 10
//    func add() {
//        y += 5
//    }
//    add()
//    return y
//}
//returnFifteen()
////函数是一等类型，这意味着函数可以把函数作为值来返回。
//func makeIncrementer() ->((Int) -> Int) {
//    func addOne(number: Int) ->Int {
//        return 1 + number
//    }
//    return addOne
//}
//var increment = makeIncrementer()
//increment(7)
//
// 函数也可以把另外一个函数作为其自身的参数。
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func lessThanTem(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTem)

numbers.map{
    (number: Int) -> Int in
    let result = 3 * number
    return result
}


//MARK: - 闭包
// 单语句闭包隐式地返回语句执行结果
let mappedNumbers = numbers.map {number in 3 * number}
print(mappedNumbers)

//你可以调用参数通过数字而非名字——这个特性在非常简短的闭包当中尤其有用。
//当一个闭包作为函数最后一个参数出入时，可以直接跟在圆括号后边。如果闭包是函数的唯一参数，你可以去掉圆括号直接写闭包。
let sortedNumbers = numbers.sorted{ $0 > $1 }
print(sortedNumbers)

// MARK: -对象和类
/**
 通过在 class后接类名称来创建一个类。在类里边声明属性与声明常量或者变量的方法是相同的，唯一的区别的它们在类环境下。同样的，方法和函数的声明也是相同的写法。
 */
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()

// 添加init 初始化器
class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    // 可以再func 前面加 final 防止子类重写
    func simpleDescriptio() -> String {
        return "\(self.name) shape with \(numberOfSides) sides"
    }
    
    deinit {
        print("deinit")
    }
}

var nameSpace : NamedShape = NamedShape(name: "test")
nameSpace.numberOfSides = 6
var nShapeDescription = nameSpace.simpleDescriptio()

// 重写父类
class Square: NamedShape {
    var sideLength: Double
    init(sideLength : Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescriptio() -> String {
        return "\(self.name) square with sides of length \(sideLength)"
    }
}

let test = Square(sideLength: 5.2, name: "my test square")
test .area()
test.simpleDescriptio()

// 带有 getter 和 setter 的计算属性。
class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    // 在 setter 中，新值被隐式地命名为 newValue。你可以提供一个显式的名字放在 set 后边的圆括号里。
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescriptio() -> String {
        return "An equilateral triangle with sides of length \(sideLength)"
    }
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

//如果不需要计算属性但仍然需要在设置一个新值的前后执行代码，使用 willSet和 didSet。
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)

//当你操作可选项的值的时候，你可以在可选项前边使用 ?比如方法，属性和下标脚本。如果 ?前的值是 nil，那 ?后的所有内容都会被忽略并且整个表达式的值都是 nil。否则，可选项的值将被展开，然后 ?后边的代码根据展开的值执行。在这两种情况当中，表达式的值是一个可选的值。
let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength


// 枚举和结构体
//使用 enum来创建枚举，类似于类和其他所有的命名类型，枚举也能够包含方法。
//成员值仅仅是一组抽象的符号，不能参与任何运算，也不代表任何数据类型！
enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}

let ace = Rank.ace
let aceRawValue = ace.rawValue

if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
}


//枚举成员的值是实际的值，不是原始值的另一种写法。事实上，在这种情况下没有一个有意义的原始值，你根本没有必要提供一个。
enum Suit {
    case spades, hearts, diamonds, clubs
//    注意有两种方法可以调用枚举的 hearts成员：当给 hearts指定一个常量时，枚举成员 Suit.Hearts会被以全名的方式调用因为常量并没有显式地指定类型。在 Switch 语句当中，枚举成员可以通过缩写的方式 .hearts被调用，因为 self已经明确了是 suit。你可以在任何值的类型已经明确的场景下使用使用缩写。
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
    
    func color() -> String {
        switch self {
        case .spades, .diamonds:
            return "black"
        default:
            return "red"
        }
    }
}

let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()
let heartsColor = hearts.color()


//如果枚举拥有原始值，这些值在声明时确定，就是说每一个这个枚举的实例都将拥有相同的原始值。另一个选择是让case与值关联——这些值在你初始化实例的时候确定，这样它们就可以在每个实例中不同了。比如说，考虑在服务器上请求日出和日落时间的case，服务器要么返回请求的信息，要么返回错误信息。
enum ServerResponse {
    case result(String, String)
    case failure(String)
}

let success = ServerResponse.result("6:00 am", "8:00 pm")
let failure = ServerResponse.failure("Out of cheese")

switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure... \(message)")
}

switch failure {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure... \(message)")
}


//MARK:--结构体
//使用 struct来创建结构体。结构体提供很多类似与类的行为，包括方法和初始化器。其中最重要的一点区别就是结构体总是会在传递的时候拷贝其自身，而类则会传递引用。
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()


// 协议和扩展
protocol ExampleProtocol {
    var simpleDescription: String { get }
//     mutating 关键字修饰方法是为了能在该方法中修改 struct 或是 enum 的变量
    mutating func adjust()
}
//类，枚举以及结构体都兼容协议。
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class"
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
}

var aSimple = SimpleClass()
aSimple.adjust()
let aDescription = aSimple.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
//    注意使用 mutating关键字来声明在 SimpleStructure中使方法可以修改结构体。在 SimpleClass中则不需要这样声明，因为类里的方法总是可以修改其自身属性的。
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}

var bSimple = SimpleStructure()
bSimple.adjust()
let bDescription = bSimple.simpleDescription

//使用 extension来给现存的类型增加功能，比如说新的方法和计算属性。你可以使用扩展来使协议来别处定义的类型，或者你导入的其他库或框架。
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription)

//Double类型写一个扩展，添加 absoluteValue属性。
extension Double: ExampleProtocol {
    var simpleDescription: String {
        return "The absolute value is \(self)."
    }
    mutating func adjust() {
        self = fabs(self)
    }
}
var tempDouble: Double = -12.3
tempDouble.adjust()
print(tempDouble.simpleDescription)

//尽管变量 protocolValue有 SimpleClass的运行时类型，但编译器还是把它看做 ExampleProtocol。这意味着你不能访问类在这个协议中扩展的方法或者属性。
let protocolValue: ExampleProtocol = aSimple
print(protocolValue.simpleDescription)
// print(protocolValue.anotherProperty) // Uncomment to see the error

// MARK: - 错误处理
enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}
//使用 throw 来抛出一个错误并且用 throws 来标记一个可以抛出错误的函数。如果你在函数里抛出一个错误，函数会立即返回并且调用函数的代码会处理错误。
func send(job: Int, toPrinter printerName: String) throws -> String {
//    if printerName ==  {
//    } else if printerName == "" {
//        throw PrinterError.outOfPaper
//    }
//
    switch printerName {
    case "Never Has Toner":
        throw PrinterError.noToner
    case "Out of paper":
        throw PrinterError.outOfPaper
    case "On fire":
        throw PrinterError.onFire
    default:
        return "Job sent"
    }
}
//有好几种方法来处理错误。一种是使用 do-catch 。在 do 代码块里，你用 try 来在能抛出错误的函数前标记。在 catch 代码块，错误会自动赋予名字 error ，如果你不给定其他名字的话。
do {
    let printerResponse = try send(job: 1040, toPrinter: "Never Has Toner")
    print(printerResponse)
} catch {
    print(error)
}
//可以提供多个 catch 代码块来处理特定的错误。你可以在 catch 后写一个模式，用法和 switch 语句里的 case 一样。
do {
    let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}

//一种处理错误的方法是使用 try? 来转换结果为可选项。如果函数抛出了错误，那么错误被忽略并且结果为 nil 。否则，结果是一个包含了函数返回值的可选项。
let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1884, toPrinter: "Never Has Toner")

//使用 defer 来写在函数返回后也会被执行的代码块，无论是否错误被抛出。你甚至可以在没有错误处理的时候使用 defer ，来简化需要在多处地方返回的函数。
//defer 关键字指定了一个代码块，这个代码块中的代码，会在所在的作用域结束后被调用。
//https://www.jianshu.com/p/cbdcc65f948a  defer与guard
var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    let  result = fridgeContent.contains(food)
    return result
}
fridgeContains("banana")
print(fridgeIsOpen)


// MARK: --泛型
//把名字写在尖括号里来创建一个泛型方法或者类型。
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0 ..< numberOfTimes {
        result.append(item)
    }
    return result
}
makeArray(repeating: "knock", numberOfTimes: 4)
//可以从函数和方法同时还有类，枚举以及结构体创建泛型。
enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}

var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)
//在类型名称后紧接 where来明确一系列需求——比如说，来要求类型实现一个协议，要求两个类型必须相同，或者要求类必须继承自特定的父类。
// <T: Equatable>和 <T where T: Equatable>是同一回事。
func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
        for lhsItem in lhs {
            for rhsItem in rhs {
                if lhsItem == rhsItem {
                    return true
                }
            }
        }
        return false
}
anyCommonElements([1, 2, 3], [3])









