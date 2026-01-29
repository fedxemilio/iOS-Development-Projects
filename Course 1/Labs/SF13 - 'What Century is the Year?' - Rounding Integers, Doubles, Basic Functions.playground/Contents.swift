//  🏔️ MTECH Code Challenge SF24: "Subset of an Array"
//  Concept: Move between mathematical and linguistic concerns using formulaic Swift code

//  Instructions:
    //  Create a function that takes an integer representing a year as input, and outputs the century it is in.

//  Notes:
    //  Remember, the first century spans from the year 1 up to and including the year 100, the second century - from the year 101 up to and including the year 200, etc.

//  Examples:
    //  Input: 1752, Output: 18
    //  Input: 1900, Output: 19
    //  Input: 1601, Output: 17
    //  Input: 2000, Output: 20

//  ⌺ Black Diamond Challenge:
    //  Output the century as an ordinal number in a String. That means 21 becomes 21st, 4 becomes 4th, etc.
import Foundation

func getCentury(year: Int) -> Int {
    return (year + 99) / 100

}

func giveCentury(year: Int) -> String {
    let year = (year + 99) / 100
    let final = year % 10
    
    let exceptionsList = [11, 12, 13, 111, 112, 113]
    if exceptionsList.contains(year) {
        return String(year) + "th"
    }
    switch final {
    case 1: return String(year) + "st"
    case 2: return String(year) + "nd"
    case 3: return String(year) + "rd"
    default: return String(year) + "th"
    }
}

print(getCentury(year: 100), getCentury(year: 1501), getCentury(year: 1999), getCentury(year: 5), getCentury(year: 1776), getCentury(year: 2026))
print(giveCentury(year: 100), giveCentury(year: 1201), giveCentury(year: 1999), giveCentury(year: 5), giveCentury(year: 1200), giveCentury(year: 2126))


