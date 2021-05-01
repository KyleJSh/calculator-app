//
//  ViewController.swift
//  Calculator App
//
//  Created by Kyle Sherrington on 2021-04-30.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Declarations
    
    var logicManager = LogicManager()
    var clearDisplay = false
    var isValidPress = false
    var verticalStack = UIStackView()
    var displayLabel = UILabel()
    
    var firstColumnFromTheLeftButtons = ["CE", "7", "4", "1", "0"]
    var secondColumnFromTheLeftButtons = ["", "8", "5", "2", ""]
    var thirdColumnFromTheLeftButtons = ["", "9", "6", "3", "."]
    var fourthColumnFromTheLeftButtons = ["÷", "x", "-", "+", "="]
    
    // MARK: - Programmatic UI
    
    override func viewDidLoad() {
        
        view.backgroundColor = .black
        setupAndAddStackView()
        setupAndAddHorizontalStackView()
    }
    
    func setupAndAddStackView() {
        
        view.addSubview(verticalStack)
        verticalStack.axis = .vertical
        verticalStack.distribution = .fillEqually
        verticalStack.spacing = 1
        
        verticalStack.translatesAutoresizingMaskIntoConstraints =  false
        verticalStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        verticalStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        verticalStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        verticalStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
    }
    
    func setupAndAddHorizontalStackView() {
        
        for i in 0...6 {
            
            let horizontalStackView = UIStackView()
            horizontalStackView.spacing = 1
            horizontalStackView.axis = .horizontal
            horizontalStackView.distribution = .fillEqually
            verticalStack.addArrangedSubview(horizontalStackView)
            
            if i == 1 {
                // add display label
                horizontalStackView.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 25)
                horizontalStackView.isLayoutMarginsRelativeArrangement = true
                addDisplayLabel(view: horizontalStackView)
                
            } else if i >= 2 {
                // add buttons
                addButtonsToStackView(view: horizontalStackView, forRowAt: i)
            }
        }
    }
    
    func addDisplayLabel(view: UIStackView) {
        displayLabel.font = displayLabel.font.withSize(30)
        displayLabel.textAlignment = .right
        displayLabel.textColor = .white
        displayLabel.text = ""
        view.addArrangedSubview(displayLabel)
    }
    
    func addButtonsToStackView(view: UIStackView, forRowAt: Int) {
        
        let horizontalStackRow = forRowAt-2
        
        for i in 0...3 {
            
            if let columns = Enumerations.Columns(rawValue: i) {
                
                let button = UIButton(type: .system)
                button.setTitleColor(.white, for: .normal)
                button.backgroundColor = .systemGray
                view.addArrangedSubview(button)
                
                switch columns {
                case .firstFromLeft:
                    button.setTitle(firstColumnFromTheLeftButtons[horizontalStackRow], for: .normal)
                    
                    if horizontalStackRow == 0 {
                        
                        button.addTarget(self, action: #selector(clearClick(sender:)), for: .touchUpInside)
                        
                    } else {
                        
                        button.addTarget(self, action: #selector(buttonClick(sender:)), for: .touchUpInside)
                        
                    }
                    
                case .secondFromLeft:
                    button.setTitle(secondColumnFromTheLeftButtons[horizontalStackRow], for: .normal)
                    
                    if horizontalStackRow > 0 && horizontalStackRow < 4 {
                        button.addTarget(self, action: #selector(buttonClick(sender:)), for: .touchUpInside)
                    }
                    
                case .thirdFromLeft:
                    button.setTitle(thirdColumnFromTheLeftButtons[horizontalStackRow], for: .normal)
                    
                    if horizontalStackRow > 0 {
                        button.addTarget(self, action: #selector(buttonClick(sender:)), for: .touchUpInside)
                    } else if horizontalStackRow == 4 {
                        
                        button.addTarget(self, action: #selector(decimalClick(sender:)), for: .touchUpInside)
                        
                    }
                    
                case .fourthFromLeft:
                    button.setTitle(fourthColumnFromTheLeftButtons[horizontalStackRow], for: .normal)
                    button.backgroundColor = .orange
                    
                    if horizontalStackRow == 4 {
                        button.addTarget(self, action: #selector(equalsClick(sender:)), for: .touchUpInside)
                        
                        
                    } else {
                        
                        button.addTarget(self, action: #selector(operatorClick(sender:)), for: .touchUpInside)
                        button.tag = 3 - horizontalStackRow
                    }
                }
            }}
    }
    
    // MARK: - Objective-C Functions
    
    @objc func equalsClick(sender: UIButton) {
        
        isValidPress = true
        logicManager.lastNumber = logicManager.currentNumber
        
        if let result = logicManager.calculateAndReturn(operation: "equals") {
            displayLabel.text = result
        }
    }
    
    @objc func operatorClick(sender: UIButton) {
        
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
    
    @objc func clearClick(sender: UIButton) {
        
        clearDisplay = false
        isValidPress = false
        logicManager.clear()
        displayLabel.text = ""
    }
    
    @objc func buttonClick(sender: UIButton) {
        
        if logicManager.calculationArray.count == 1 {
            clearClick(sender: sender)
        }
        
        isValidPress = true
        
        if clearDisplay == true {
            displayLabel.text = ""
            clearDisplay = false
        }
        displayLabel.text! += sender.currentTitle!
        logicManager.currentNumber = Double(displayLabel.text!)!
        
    }
    
    @objc func decimalClick(sender: UIButton) {
        
        if !((displayLabel.text)?.contains("."))! {
            displayLabel.text! += "."
        }
    }
}
