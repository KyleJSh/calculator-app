//
//  LogicManager.swift
//  Calculator App
//
//  Created by Kyle Sherrington on 2021-05-01.
//

import Foundation

class LogicManager {
    
    // MARK: Variables and Properties
    
    var calculationArray = [Double]()
    var lastNumber = 0.0
    var lastOperation = 0.0
    var currentNumber = 0.0
    
    // MARK: - Methods
    
    func calculateAndReturn(operation: String) -> String? {
        
        if operation == "operation" {
            if calculationArray.count >= 3 {
                
                // calculate and return number
                let newValue = calculate(firstNumber: calculationArray[0], secondNumber: calculationArray[2], operation: Int(calculationArray[1]))
                
                calculationArray.removeAll()
                calculationArray.append(newValue)
                return String(calculationArray[0])
            }

            
        } else if operation == "equals" {
            
            
        }
        
        return nil
    }
    
    // func that calculates two numbers and returns output
    func calculate(firstNumber: Double, secondNumber: Double, operation: Int) -> Double {
    
        var total = 0.0
        
        // tag 0 = add, tag 1 = minus, tag 2 = multiply, tag 3 = divide
        switch operation {
        case 0:
            total = firstNumber + secondNumber
        case 1:
            total = firstNumber - secondNumber
        case 2:
            total = firstNumber * secondNumber
        case 3:
            total = firstNumber / secondNumber
        default:
            print("Wrong index given")
        }
        
        // this returns our number as a double
        return Double(floor(1000*total)/1000)
    
    }
    
}
