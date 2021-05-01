//
//  LogicManager.swift
//  Calculator App
//
//  Created by Kyle Sherrington on 2021-05-01.
//

import Foundation

class LogicManager {
    
    var calculationArray = [Double]()
    var lastNumber = 0.0
    var lastOperation = 0.0
    var currentNumber = 0.0
    
    func clear() {
        
        calculationArray = []
        lastNumber = 0.0
        lastOperation = 0.0
        currentNumber = 0.0
    }
    
    func calculateAndReturn(operation: String) -> String? {
        
        if operation == "operation" {
            if calculationArray.count >= 3 {
                
                // calculate and return number
                let newValue = calculate(firstNumber: calculationArray[0], secondNumber: calculationArray[2], operation: Int(calculationArray[1]))
                
                calculationArray.removeAll()
                calculationArray.append(newValue)
                calculationArray.append(lastOperation)
                return String(calculationArray[0])
            }
            
        } else if operation == "equals" {
            if calculationArray.count >= 1 {
                
                // calculate and return number
                let newValue = calculate(firstNumber: calculationArray[0], secondNumber: lastNumber, operation: Int(lastOperation))
                
                calculationArray.removeAll()
                calculationArray.append(newValue)
                return String(calculationArray[0])
            }
        }
        return nil
    }
    
    func calculate(firstNumber: Double, secondNumber: Double, operation: Int) -> Double {
        
        var total = 0.0
        
        if let operations = Enumerations.Operations(rawValue: operation) {
            switch operations {
            case .add:
                total = firstNumber + secondNumber
            case .subtract:
                total = firstNumber - secondNumber
            case .multiply:
                total = firstNumber * secondNumber
            case .divide:
                total = firstNumber / secondNumber
            default:
                print("Wrong index given")
            }}
        
        // this returns our number as a double
        return Double(floor(1000*total)/1000)
    }
}
