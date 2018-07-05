//: [Previous](@previous)

import Foundation

// MARK: -- For-in 循环
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}
//Dictionary 中的元素没有必要安照它们写入的顺序遍历出来。 Dictionary 的内容内在无序，并且不在取回遍历时保证有序。需要注意的是，你给 Dictionary 插入元素的次序并不能代表你遍历时候的顺序
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}
//如果你不需要序列的每一个值，你可以使用下划线来取代遍历名以忽略值。
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")
//使用 stride(from:to:by:) 函数来跳过不想要的标记。
let minutes = 60
let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    // render the tick mark every 5 minutes (0, 5, 10, 15 ... 45, 50, 55)
}
let hours = 12
let hourInterval = 3
for tickMark in stride(from: 3, through: hours, by: hourInterval) {
    // render the tick mark every 3 hours (3, 6, 9, 12)
}


//  MARK: --While 循环
/*
while 在每次循环开始的时候计算它自己的条件；
repeat-while 在每次循环结束的时候计算它自己的条件。
*/


//  MARK: --Switch
//相比 C 和 Objective-C 里的 switch 语句来说，Swift 里的 switch 语句不会默认从每个情况的末尾贯穿到下一个情况里。相反，整个 switch 语句会在匹配到第一个 switch 情况执行完毕之后退出，不再需要显式的 break 语句。这使得 switch 语句比 C 的更安全和易用，并且避免了意外地执行多个 switch 情况。
//尽管 break 在 Swift 里不是必须的，你仍然可以使用 break 语句来匹配和忽略特定的情况，或者在某个情况执行完成之前就打断它。移步 Switch 语句中的 Break 来了解更多。
//区间匹配
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
var naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")


//元组
/*
 你可以使用元组来在一个 switch 语句中测试多个值。每个元组中的元素都可以与不同的值或者区间进行匹配。另外，使用下划线（ _）来表明匹配所有可能的值。
 */
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("(0, 0) is at the origin")
case (_, 0):
    print("(\(somePoint.0), 0) is on the x-axis")
case (0, _):
    print("(0, \(somePoint.1)) is on the y-axis")
case (-2...2, -2...2):
    print("(\(somePoint.0), \(somePoint.1)) is inside the box")
default:
    print("(\(somePoint.0), \(somePoint.1)) is outside of the box")
}
// prints "(1, 1) is inside the box"

//值绑定
//switch 情况可以将匹配到的值临时绑定为一个常量或者变量，来给情况的函数体使用。这就是所谓的值绑定，因为值是在情况的函数体里“绑定”到临时的常量或者变量的。
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}

//MARK : --Where
//switch 情况可以使用 where 分句来检查额外的情况。
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}// prints "(1, -1) is on the line x == -y"

//复合情况
//多个 switch 共享同一个函数体的多个情况可以在 case 后写多个模式来复合，在每个模式之间用逗号分隔。如果任何一个模式匹配了，那么这个情况都会被认为是匹配的。如果模式太长，可以把它们写成多行，比如说：
let someCharacter: Character = "e"
switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) is not a vowel or a consonant")
}
// Prints "e is a vowel"

//复合情况同样可以包含值绑定。所有复合情况的模式都必须包含相同的值绑定集合，并且复合情况中的每一个绑定都得有相同的类型格式。这才能确保无论复合情况的那部分匹配了，接下来的函数体中的代码都能访问到绑定的值并且值的类型也都相同。
let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}
// Prints "On an axis, 9 from the origin"


// MARK: - 控制转移语句


//continue 语句告诉循环停止正在做的事情并且再次从头开始循环的下一次遍历。它是说“我不再继续当前的循环遍历了”而不是离开整个的循环。
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
for character in puzzleInput.characters {
    switch character {
    case "a", "e", "i", "o", "u", " ":
        continue
    default:
        puzzleOutput.append(character)
    }
}
print(puzzleOutput)


//break 语句会立即结束整个控制流语句。当你想要提前结束 switch 或者循环语句或者其他情况时可以在 switch 语句或者循环语句中使用 break 语句。
/*
循环语句中的 Break
当在循环语句中使用时， break 会立即结束循环的执行，并且转移控制到循环结束花括号（ } ）后的第一行代码上。当前遍历循环里的其他代码都不会被执行，并且余下的遍历循环也不会开始了。
 */


/*
 Switch 语句里的 Break
 当在switch语句里使用时， break 导致 switch 语句立即结束它的执行，并且转移控制到 switch 语句结束花括号（ } ）之后的第一行代码上。
 
 switch 的情况如果只包含注释的话会导致编译时错误。注释不是语句，并且不会导致 switch 情况被忽略。要使用 break 语句来忽略 switch 情况。
 */

//下面的栗子匹配一个 Character 值并且决定它表示四种语言中哪种语言的数字符号。简明起见，多个值被覆盖在了一个 switch 情况中：
let numberSymbol: Character = "三"  // Simplified Chinese for the number 3
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑":
    possibleIntegerValue = 1
case "2", "٢", "二", "๒":
    possibleIntegerValue = 2
case "3", "٣", "三", "๓":
    possibleIntegerValue = 3
case "4", "٤", "四", "๔":
    possibleIntegerValue = 4
default:
    break
}
if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue).")
} else {
    print("An integer value could not be found for \(numberSymbol).")
}
// prints "The integer value of 三 is 3."

//Fall through
//Swift 中的 Switch 语句不会从每个情况的末尾贯穿到下一个情况中。相反，整个 switch 语句会在第一个匹配到的情况执行完毕之后就直接结束执行。
//如果你确实需要 C 风格的贯穿行为，你可以选择在每个情况末尾使用 fallthrough 关键字。下面的栗子使用了 fallthrough 来创建一个数字的文字描述：
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
//    fallthrough 关键字不会为switch情况检查贯穿入情况的条件。 fallthrough 关键字只是使代码执行直接移动到下一个情况（或者 default 情况）的代码块中，就像C的标准 switch 语句行为一样。
    fallthrough
    //    fallthrough 关键字不会为switch情况检查贯穿入情况的条件。 fallthrough 关键字只是使代码执行直接移动到下一个情况（或者 default 情况）的代码块中，就像C的标准 switch 语句行为一样。
    fallthrough
default:
    description += " an integer."
}
print(description)
// prints "The number 5 is a prime number, and also an integer."


