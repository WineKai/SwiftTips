# Swift学习 -- 入门


**1.unowned**

`unowned`引用是`non-zeroing(非零的)`, 在ARC销毁内存后，不会被赋为`nil`, 这表示着当一个对象被销毁时, 它指引的对象不会清零. 也就是说使用unowned引用在某些情况下可能导致`dangling pointers(野指针)`. 所以在访问无主引用的时候，要确保其引用正确，不然会引起内存崩溃.

**2.`weak`:弱引用对象的引用计数不会+1**

**3.声明变量的多种方法：**

```
// 一行声明多个变量或者常量
var x = 0.0, y = 0.0, z = 0.0
// 指定类型
var welcomeMessage: String
// 同时对多个变量指定类型
var red, green, blue: Double
```

**4.变量和常量的名字几乎可以使用任何字符：**

```
let π = 3.14
let 你好 = "你好"
let ?? = "dogcow"
```

**5.`swift`是类型安全的语言，并可以进行类型推断：**

```
// meaningOfLife会被推断成Int
let meaningOfLife = 42
// pi会被推断成Double
let pi = 3.14159
//  anotherPi会被推断成Double
let anotherPi = 3 + 0.14159
```

**6.`typealias`关键字定义类型别名：**

```
// 定义别名
typealias AudioSample = UInt16
// 使用别名
var maxAmplitudeFound = AudioSample.min
```

**7.元组**

元组把多个值合并成单一的复合型的值，例如网络请求的错误信息，可以用元组：

```
// 类型为（Int, String), 
let http404Error = (404, "Not Found")
```
任何类型的排列都可以被用来创建一个元组, 可以包含任意多的类型。例如 `(Int, Int, Int) `或者` (String, Bool)`

使用元组的方法：

```
// 可以将元组的内容分解成单独的变量或者常量
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
// 输出: The status code is 404

// 分解元组时，如果只用其中一部分数据，不需要的数据可以用 _ 代替：
let (statusCode, _) = http404Error


// 从0开始对元组进行索引来访问元素
print ("The status code is \(http404Error.0)")
// 输出: The status code is 404
```

在定义元组的时候可以给单个元素命名：

```
let http200Status = (statusCode: 200, description: "OK")

// 通过名字访问元素
print ("The status code is \(http200Status.statusCode)")
// 输出： The status code is 200
```


**8.可选项和nil**

可选项的含义：有个X变量（或者常量），它可能有值，也可能没有值。

```
在OC中没有可选项概念。有个近似的 nil ,nil的意思“缺少一个可用对象”。
```
举栗说明：

```
let number = "123"
let convert = Int(number)
// 上面的初始化可能会失败，convert会被返回一个可选的Int,
因为有些String是无法转成Int。此时covert可能值为nil


// 关于nil
我们可以给一个可选变量赋值一个nil
var optionalCode: Int? = 404
optionalCode = nil
// 此时optionalCode没有值

**注意： nil 不能用于费可选的常量或变量。

// 如果定义的可选变量没有提供一个默认值，会被自动设置成nil
var someString: String?

** 注意：Swift中的nil和OC的nil不同，OC中nil是一个空指针，
Swift中nil不是指针，是一种值缺失的特殊类型
```

**9.可选项绑定**

可以使用可选项绑定判断是否有值，实现如下：

```
// if 语句
if let name = optionalName {
	// TO DO
}

// 对第8条的第一个栗子进行如下改造：
if let convert = Int(number) {
	print(" covert = \(convert)")
} else {
	print(" converted failure ")
}
// 含义：如果Int(number)返回的有值，将值赋给convert,否则提示错误


// 还可以在一个if语句中包含多个可选项绑定，只有所有的绑定为true时，判断语句才为true

if let firstNum = Int("4"), let secondNum = Int("42"), firstNum > secondNum {
	print("true")
}
```

**10.隐式展开可选项**

可选项明确了常量（变量）可以没有值，如果使用可选项时，经常要检查有没有值，如第9条所示，有时候我们确认每次访问的时候都有值就不需要每次去检查。这就是隐式展开可选项。通过在声明的类型后面加感叹号（String!)而不是问号（String?)

```
let optionalString: String? = "Optional String"
let tempString: String = optionalString! // 需要解包

let anotherString: String! = "unwrapped String"
let anotherTempString: String = anotherString // 不需要解包
```

**11.错误处理**

相比对可选项的值是否存在来判断程序的执行结果，错误处理机制可以获取更多的信息（错误的形成原因）

在函数声明中加入`throws`来声明函数会抛出一个错误，当调用这个函数时，需要在表达式前加`try`关键字

```
func willThrowError() throws {

}
// Swift 自动将错误传递到它的生效范围（catch分句）
do {
	try willThrowError()
	// no error
} catch {
	// error
}
```

`do`语句创建了一个新的容器，可以让错误传到多个`catch`分句里

```
func makeATest() throws {
	// 、、、
}
do {
	try makeATest()
	testing()
} catch Error.completedTest {
	endTest()
} catch Error.missQuestions (let questions) {
	inputResult(questions)
}
```
上面的栗子，在没有输入结果的时候，`makeATest()`会抛出一个错误，然后执行相对应的`catch`语句，如果`makeATest()`没有抛出错误，执行`testing()`方法，如果有错误并满足`Error.completedTest `又将会有一个错误抛出，执行`endTest()`


**12.断言和先决条件**


