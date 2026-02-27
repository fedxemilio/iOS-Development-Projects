//
//  Calculator.swift
//  Calculator Project
//
//  Created by Jane Madsen on 9/29/25.
//

import SwiftUI

@Observable
class Calculator {
    var displayedString = "0"
    var current: Double = 0
    var operation: CalculatorInput = .equal
    
    func handleInput(_ input: CalculatorInput) {
        switch input {
            
        case .backspace:
            displayedString.removeLast()
            if displayedString.last == "." {displayedString.removeLast()}
            if displayedString == "-" {displayedString.removeLast()}
            if displayedString.isEmpty {displayedString = "0"}
            
        case .clear:
            displayedString = "0"
            current = 0
            operation = .equal
            
        case .percent:
            guard let display = Double(displayedString) else {return}
            displayedString = String(display / 100)
            format()
            
        case .invertSign:
            guard let display = Double(displayedString) else {return}
            displayedString = String(display * -1)
            format()
            
        case .decimal:
            guard !displayedString.contains(".") else {return}
            displayedString += "."
            
        case .divide:
            operate(newOp: .divide)
            
        case .multiply:
            operate(newOp: .multiply)
            
        case .subtract:
            operate(newOp: .subtract)
            
        case .add:
            operate(newOp: .add)
            
        case .equal:
            displayedString = evaluate() //skip operate to display sum
            operation = .equal //stops next operator from operating using display sum when pressed
            format()
            
        default:
            if displayedString == "0" {
                displayedString = String(input.rawValue)
            } else {
                displayedString += String(input.rawValue)
            }
        }
    }
    
    func operate(newOp: CalculatorInput) {
        guard Double(displayedString) != nil else {return}
        if operation != .equal {
            displayedString = evaluate()
        }
        current = Double(displayedString)! //value AFTER evaluate is called
        displayedString = "0"
        operation = newOp
    }
    
    func evaluate() -> String {
        guard let display = Double(displayedString) else {return "ERROR"}

        if operation == .add {
            current += display
            return String(current)
        }
        if operation == .subtract {
            current -= display
            return String(current)
        }
        if operation == .multiply {
            current *= display
            return String(current)
        }
        if operation == .divide {
            current /= display
            return String(current)
        }
        else {return displayedString}
        
    }
    
    func format() {
        guard let display = Double(displayedString) else {return}
        let multiplier = pow(10.0, 10.0)
        let roundedValue = (display * multiplier).rounded() / multiplier
        if roundedValue.truncatingRemainder(dividingBy: 1) == 0 {
            displayedString = String(Int(roundedValue))
        } else {displayedString = String(roundedValue)}
    }
}


#Preview {
    ContentView()
}
