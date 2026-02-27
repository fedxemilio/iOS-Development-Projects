/*:
## Exercise - Create Functions

 Write a function called `introduceMyself` that prints a brief introduction of yourself. Call the function and observe the printout.
 */
func introduceMyself(name: String) {
    print("Hello, I'm Emilio and I have a decent life. No complaints.")
}

//:  Write a function called `magicEightBall` that generates a random number and then uses either a switch statement or if-else-if statements to print different responses based on the random number generated. `let randomNum = Int.random(in: 0...4)` will generate a random number from 0 to 4, after which you can print different phrases corresponding to the number generated. Call the function multiple times and observe the different printouts.
import Foundation

func magicEightBall() {
    let randomNum = Int.random(in: 0...4)
    switch randomNum {
    case 1:
        print("You're going into debt again  :(")
    case 2:
        print("Nothing significant happening to you...")
    case 3:
        print("Wow, something wow is about to happen. Wow.")
    case 4:
        print("You'll be better off soon. I guess.")
    default:
        print("Wut")
    }
}

magicEightBall()
magicEightBall()
magicEightBall()
magicEightBall()

/*:
page 1 of 6  |  [Next: App Exercise - A Functioning App](@next)
 */
