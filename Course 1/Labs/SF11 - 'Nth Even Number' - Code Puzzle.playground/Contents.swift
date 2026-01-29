//  🏔️ MTECH Code Challenge SF25: "Nth Even Number"
//  Concept: Use abstract thinking to solve an unintuitive coding puzzle

//  Instructions:
    //  Given input n, return the nth even number.

//  Notes:
    //  The input will never be 0.

//  Examples:
    // Input: 1, Output: 0 (the first even number is 0)
    // Input: 3, Output: 4 (the 3rd even number is 4 (0, 2, 4))
    // Input: 100, Output: 198
    // Input: 1298734, Output: 2597466

func nEvenNum(num: Int) -> Int {
    return num * 2 - 2
}

print(nEvenNum(num: 1), nEvenNum(num: 3), nEvenNum(num: 100), nEvenNum(num: 1298734))

//  ⌺ Black Diamond Challenge:
    //  Add a boolean parameter called "even". If true, return the nth even number; if false, return the nth odd number.

import Foundation

func nEvenNums(num: Int, even: Bool) -> Int {
    if even {
        return num * 2 - 2
    } else {
        return num * 2 - 1
    }
}

print(nEvenNums(num: 1, even: false), nEvenNums(num: 3, even: false), nEvenNums(num: 100, even: false), nEvenNums(num: 1298734, even: false))
