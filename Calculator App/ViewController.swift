//
//  ViewController.swift
//  Calculator App
//
//  Created by Kyle Sherrington on 2021-04-30.
//

import UIKit

class ViewController: UIViewController {
    
    var logicManager = LogicManager()
    var clearDisplay = false
    var isValidPress = false
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func buttonClick(_ sender: UIButton) {
        
        if logicManager.calculationArray.count == 1 {
            clearClick(sender)
        }
        
        isValidPress = true
        
        if clearDisplay == true {
            displayLabel.text = ""
            clearDisplay = false
        }
        displayLabel.text! += sender.currentTitle!
        logicManager.currentNumber = Double(displayLabel.text!)!
    }
    
    @IBAction func operatorClick(_ sender: UIButton) {
        
        clearDisplay = true
        
        if isValidPress == true {
            
            if logicManager.calculationArray.count == 1 {
                logicManager.calculationArray.append(Double(sender.tag))
            } else {
                logicManager.calculationArray.append(logicManager.currentNumber)
                logicManager.calculationArray.append(Double(sender.tag))
            }
            displayLabel.text = String(logicManager.calculationArray[0])
        }
        
        logicManager.lastOperation = Double(sender.tag)
        
        if let result = logicManager.calculateAndReturn(operation: "operation") {
            displayLabel.text = result
        }
        isValidPress = false
    }
    
    @IBAction func equalsClick(_ sender: Any) {
        
        isValidPress = true
        logicManager.lastNumber = logicManager.currentNumber
        
        if let result = logicManager.calculateAndReturn(operation: "equals") {
            displayLabel.text = result
        }
    }
    
    @IBAction func clearClick(_ sender: Any) {
        
        clearDisplay = false
        isValidPress = false
        logicManager.clear()
        displayLabel.text = ""
    }
    
    @IBAction func decimalClick(_ sender: Any) {
        
        if !((displayLabel.text)?.contains("."))! {
            displayLabel.text! += "."
        }
    }
}
