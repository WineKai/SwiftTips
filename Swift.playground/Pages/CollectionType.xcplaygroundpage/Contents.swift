//: [Previous](@previous)

import Foundation

//Swift 提供了三种主要的集合类型，所谓的数组、合集还有字典，用来储存值的集合。数组是有序的值的集合。合集是唯一值的无序集合。字典是无序的键值对集合。

//MARK:- 数组以有序的方式来储存相同类型的值。相同类型的值可以在数组的不同地方多次出现。

// 创建空数组
var someInts = [Int]()
someInts.append(3)
someInts = []
//使用默认值创建数组
var threeDoubles = Array(repeating: 0.0, count: 3)
//通过连接两个数组来创建数组
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles
//数组字面量创建数组
var shoppingList: [String] = ["Eggs", "Milk"]
print("The shopping list contains \(shoppingList.count) items.")


//遍历一个数组
//for-in循环来遍历整个数组
for item in shoppingList {
    print(item)
}
//enumerated()方法来遍历数组。
for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}


// MARK: --合集将同一类型且不重复的值无序地储存在一个集合当中。当元素的顺序不那么重要的时候你就可以使用合集来代替数组，或者你需要确保元素不会重复的时候。

//为了能让类型储存在合集当中，它必须是可哈希的——就是说类型必须提供计算它自身哈希值的方法。哈希值是Int值且所有的对比起来相等的对象都相同，比如 a == b，它遵循 a.hashValue == b.hashValue。
//创建并初始化一个空合集
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")
letters.insert("a")
letters = []

//使用数组字面量创建合集
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
//访问和修改合集
print("I have \(favoriteGenres.count) favorite music genres.")
if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky.")
} else {
    print("I have particular music preferences.")
}
// 添加
favoriteGenres.insert("Jazz")
// 移除
if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that.")
}
//检查合集是否包含了特定的元素，使用 contains(_:)
if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}
//遍历合集
//for-in循环
for genre in favoriteGenres {
    print("\(genre)")
}
//Swift 的 Set类型是无序的。要以特定的顺序遍历合集的值，使用 sorted()方法，它把合集的元素作为使用 < 运算符排序了的数组返回。
for genre in favoriteGenres.sorted() {
    print("\(genre)")
}
//执行合集操作
//https://www.cnswift.org/collection-types
/*
 使用 intersection(_:)方法来创建一个只包含两个合集共有值的新合集；
 使用 symmetricDifference(_:)方法来创建一个只包含两个合集各自有的非共有值的新合集；
 使用 union(_:)方法来创建一个包含两个合集所有值的新合集；
 使用 subtracting(_:)方法来创建一个两个合集当中不包含某个合集值的新合集。
 */
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
oddDigits.intersection(evenDigits).sorted()
// []
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
// [1, 9]
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
// [1, 2, 9]

//合集成员关系和相等性
/*
 使用“相等”运算符 ( == )来判断两个合集是否包含有相同的值；
 使用 isSubset(of:) 方法来确定一个合集的所有值是被某合集包含；
 使用 isSuperset(of:)方法来确定一个合集是否包含某个合集的所有值；
 使用 isStrictSubset(of:) 或者 isStrictSuperset(of:)方法来确定是个合集是否为某一个合集的子集或者超集，但并不相等；
 使用 isDisjoint(with:)方法来判断两个合集是否拥有完全不同的值。
 */

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
// true
farmAnimals.isSuperset(of: houseAnimals)
// true
farmAnimals.isDisjoint(with: cityAnimals)
// true

// MARK: --字典储存无序的互相关联的同一类型的键和同一类型的值的集合
