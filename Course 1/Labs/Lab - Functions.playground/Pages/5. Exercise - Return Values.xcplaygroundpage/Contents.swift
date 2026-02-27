/*:
## Exercise - Return Values

 Write a function called `greeting` that takes a `String` argument called name, and returns a `String` that greets the name that was passed into the function. I.e. if you pass in "Sophie" the return value might be "Hi, Sophie! How are you?" Use the function and print the result.
 */
func greeting(_ name: String) -> String {
    "Heyyo, \(name)! How's it?"
}
print(greeting("Henry"))
//:  Write a function that takes two `Int` arguments, and returns an `Int`. The function should multiply the two arguments, add 2, then return the result. Use the function and print the result.
func multiplyAndTwoMore(_ num1: Int, _ num2: Int) -> Int {
    num1 * num2 + 2
}
print(multiplyAndTwoMore(8, 5))
/*:
[Previous](@previous)  |  page 5 of 6  |  [Next: App Exercise - Separating Functions](@next)
 */
