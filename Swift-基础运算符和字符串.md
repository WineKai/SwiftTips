**1.空值运算符**

`a ?? b` 等同于：`a != nil ? a! : b`

**2.区间运算符**

* 闭区间
  a ... b : 定义了从a到b的一组范围，并包含a和b。a的值不能大于b。
* 半开区间
  a ..< b : 定义了从a到b但不包括b的区间，
* 单侧区间
  [2...]  : 适用用数组，从索引2开始到尽可能远的位置。
  
  栗子：

``` 
  for name in names[2 ..]  {
  		print(name)
  }
```
半开区间运算符的单侧形式：

``` 
  for name in names[..< 2]  {
  		print(name)
  }
```

**3.字符串相关**

Swift的String是一种值类型。值在传递给方法或者函数的时候会被复制。复制只会在需要使用的时候才进行。

* 使用字符串字面量作为常量或者变量的初始值：

```
//  Swift会为 someString 推断类型为 String.

let someString = "Some string"

// 多行字符串字面量， 可以使用三个双引号引住

let question = """
The question is : "What time is it now?
and what are you going to do?
"""

// 使用三个双引号之后可以再字面量中使用单个双引号，如果需要在字符串中包含”“”，必须用反斜杠\转义。

let nextQ = """
first question \"""
second question \"\"\"
"""


// 多行格式中，字符串字面量包含了双引号包括的所有行。
// 起始于三个双引号(""")之后的第一行，结束语三个双引号(""")之前的一行，不会在开始或者结束带有换行。
let sameString = "The two strings are the same"
let sameString1 = """
The two strings are the same
"""

// 多行字符串可以缩进匹配周围代码。如下所示。
// 尾部的三个双引号前的空格会告诉Swift在其他行钱应该有多少空白是需要忽略的，下面的字符虽然有缩进，但是加上字符串不会以任何空白开头。
    func generateQuotation() -> String {
        let quotation = """
                        The White Rabbit put on his spectacles. "Where shall I begin,
                        please your Majesty?" he asked.

                        "Begin at the beginning," the King said gravely," and go on
                        till you come to the end; then stop."
                        """
        return quotation
    }
    
// 如果某行空格超过了结束的双引号，空格就会被包含进来
	"""
	The White Rabbit put on his spectacles. "Where shall I begin,
	____________________please your Majesty?" he asked.
	//上面这行的区域会被包括(_下划线代表是空格，并不是输入了下划线）
	"Begin at the beginning," the King said gravely," and go on
	till you come to the end; then stop."
	"""

```

* 字符串的可变性
 
```
var variableString = "Horse"
variableString += " and carriage"
```

* 可以通过for-in循环遍历String中的每个独立的`Character`值:

```
for character in "Dog" {
	print(character)
}
```
* String的连接
可以用 `+` 或者 `+=` 来连接一个String:

```
let str1 = "Hello"
let str2 = "world"
var str3 = str1 + str2

var temp = "look"
temp += str2

```

* 访问和修改字符串

可以通过`String.Index`来访问字符串中的`Character`,不能通过整数值索引。使用`startIndex`访问`String`中的第一个`Character`位置;`endIndex`访问`String`中的z最后一个`Character`位置:

```
let exampleStr = "This is an example!"
exampleStr[exampleStr.startIndex]
// T

exampleStr[exampleStr.index(before: exampleStr.endIndex)]
// !

exampleStr[exampleStr.index(after: exampleStr.startIndex)]
// h

let index = exampleStr.index(exampleStr.startIndex, offsetBy: 3)
exampleStr[index]
// s

// 访问的索引位置超出字符串的范围之外会crash
// 可以使用`indices`访问每个字符的索引
for index in exampleStr.indices {
	print("\(exampleStr[index]")
}
```
* 插入和删除



