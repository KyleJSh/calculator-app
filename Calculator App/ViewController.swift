//
//  ViewController.swift
//  Calculator App
//
//  Created by Kyle Sherrington on 2021-04-30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    var logicManager = LogicManager()
    
    var clearDisplay = false
    
    var isValidPress = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(logicManager.calculate(firstNumber: 2.0, secondNumber: 2.0, operation: 3))
        
    }

    @IBAction func buttonClick(_ sender: UIButton) {
        
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
         
            logicManager.calculationArray.append(logicManager.currentNumber)
            logicManager.calculationArray.append(Double(sender.tag))
            
        }
        
        isValidPress = false
        
        if let result = logicManager.calculateAndReturn(operation: "operation") {
            
            displayLabel.text = result
            
        }
        
        print(logicManager.calculationArray)
    }
    
    
    
    @IBAction func equalsClick(_ sender: Any) {
        print("Equals clicked")
    }
    
    
}

