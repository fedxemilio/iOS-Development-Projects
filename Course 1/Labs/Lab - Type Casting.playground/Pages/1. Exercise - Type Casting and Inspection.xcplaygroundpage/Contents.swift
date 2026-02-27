/*:
## Exercise - Type Casting and Inspection

 Create a collection of type [Any], including a few doubles, integers, strings, and booleans within the collection. Print the contents of the collection.
 */
var bunchOfStuff: [Any] = [3, 3.5, 4, 4.5, "Comb", "Lighter", false]
print(bunchOfStuff)
//:  Loop through the collection. For each integer, print "The integer has a value of ", followed by the integer value. Repeat the steps for doubles, strings and booleans.
for item in bunchOfStuff {
    if item is Int {
        print("The integer has a value of \(item).")
    } else if item is Double {
        print("The double has a value of \(item).")
    } else if item is String {
        print("The string has a value of '\(item)'.")
    } else if item is Bool {
        print("The boolean has a value of '\(item)'.")
    }
}
//:  Create a [String : Any] dictionary, where the values are a mixture of doubles, integers, strings, and booleans. Print the key/value pairs within the collection
var lotsaStuff: [String: Any] = ["Wages": "Moderate", "Likability": 2.2, "Weather": "Not Good", "Population": 102, "Livability": 2.3, "isSanitary": false, "isAffordable": true]
for (key, value) in lotsaStuff {
    print(key, value)
}
//:  Create a variable `total` of type `Double` set to 0. Then loop through the dictionary, and add the value of each integer and double to your variable's value. For each string value, add 1 to the total. For each boolean, add 2 to the total if the boolean is `true`, or subtract 3 if it's `false`. Print the value of `total`.
var total: Double = 0
for item in lotsaStuff.values {
    if let num = item as? Int {
        total += Double(num)
    } else if let num = item as? Double {
        total += num
    } else if item is String {
        total += 1
    } else if let bool = item as? Bool {
        total += bool ? 2: -3
    }
}
print(total)

//:  Create a variable `total2` of type `Double` set to 0. Loop through the collection again, adding up all the integers and doubles. For each string that you come across during the loop, attempt to convert the string into a number, and add that value to the total. Ignore booleans. Print the total.
var total2: Double = 0
for item in lotsaStuff.values {
    if let num = item as? Int {
        total2 += Double(num)
    } else if let num = item as? Double {
        total2 += num
    } else if let num = item as? String {
        total2 += Double(num) ?? 0
    }
}
print(total)

/*:
page 1 of 2  |  [Next: App Exercise - Workout Types](@next)
 */
