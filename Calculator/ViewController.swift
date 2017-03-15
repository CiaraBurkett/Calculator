//
//  ViewController.swift
//  Calculator
//
//  Created by Ciara Burkett on 3/15/17.
//  Copyright © 2017 Ciara Burkett. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentOperation: Operator = Operator.nothing
    var calcState: CalculationState = CalculationState.enteringNum
    var firstValue: String = ""
    
    @IBOutlet weak var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // Button Actions
    @IBAction func numberClicked (_ sender: UIButton) {
        updateDisplay (number: String (sender.tag))
    }
    
    func updateDisplay (number: String) {
        if (calcState == CalculationState.newNumStarted) {
            if let num = resultLabel.text {
                if num != "" {
                    firstValue = num
                }
            }
            calcState = CalculationState.enteringNum
            resultLabel.text = number
        }
        else if calcState == CalculationState.enteringNum {
            resultLabel.text = resultLabel.text! + number
        }
    }
    
    @IBAction func operatorClicked (_ sender: UIButton) {
        calcState = CalculationState.newNumStarted
        
        if let num = resultLabel.text {
            if num != "" {
                firstValue = num
                resultLabel.text = ""
            }
        }
        
        switch sender.tag {
        case 10:
            print("add")
            currentOperation = Operator.add
        case 11:
            print("minus")
            currentOperation = Operator.subtract
        case 12:
            print("times")
            currentOperation = Operator.multiply
        case 13:
            print("divide")
            currentOperation = Operator.divide
        default:
            return
        }
    }
    
    @IBAction func equalsClicked (_ sender: UIButton) {
        calculateSum()
        
    }
    
    func calculateSum() {
        if (firstValue.isEmpty) {
            return
        }
        
        var result = ""
        
        if currentOperation == Operator.multiply {
            result = "\(Double(firstValue)! * Double(resultLabel.text!)!)"
        }
        else if currentOperation == Operator.divide {
            result = "\(Double(firstValue)! / Double(resultLabel.text!)!)"
        }
        else if currentOperation == Operator.add {
            result = "\(Double(firstValue)! + Double(resultLabel.text!)!)"
        }
        else if currentOperation == Operator.subtract {
            result = "\(Double(firstValue)! - Double(resultLabel.text!)!)"
        }
        
        resultLabel.text = result
        calcState = CalculationState.newNumStarted
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

