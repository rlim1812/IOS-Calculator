//
//  ViewController.swift
//  Calculator
//
//  Created by Ryan Lim on 8/9/16.
//  Copyright © 2016 Ryan Lim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var currentOperation: Operator = Operator.nothing
    
    var calcState: CalculationState = CalculationState.enteringNum
    
    var firstValue: String = ""
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var subtractButton: UIButton!
    
    @IBOutlet weak var timesButton: UIButton!
    
    @IBOutlet weak var divideButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //button actions
    @IBAction func numberClicked(_ sender: UIButton){
        updateDisplay(number: String(sender.tag))
    }
    
    func updateDisplay(number: String){
        if calcState == CalculationState.newNumStarted {
            if let num = resultLabel.text , num != "" {
                firstValue = num
            }
            calcState = CalculationState.enteringNum
            resultLabel.text = number
        } else if calcState == CalculationState.enteringNum {
            resultLabel.text = resultLabel.text! + number
        }
    }
    
    
    @IBAction func operatorClicked(_ sender: UIButton){
        calcState = CalculationState.newNumStarted
        
        if let num = resultLabel.text, num != "" {
            firstValue = num
            resultLabel.text = ""
        }
        
        addButton.backgroundColor = UIColor.white()
        subtractButton.backgroundColor = UIColor.white()
        timesButton.backgroundColor = UIColor.white()
        divideButton.backgroundColor = UIColor.white()

        switch sender.tag {
            case 10:
                currentOperation = Operator.add
            case 11:
                currentOperation = Operator.subtract
            case 12:
                currentOperation = Operator.times
            case 13:
                currentOperation = Operator.divide
            default:
                return
        }
        sender.backgroundColor = UIColor.orange()
    }
    
    @IBAction func equalsClicked(_ sender: UIButton){
        performOperation()
    }

    func performOperation(){
        if (firstValue.isEmpty) {
            return
        }
        var result = ""
        
        if currentOperation == Operator.times {
            result = "\((Double(firstValue)! * Double(resultLabel.text!)!))"
        } else if currentOperation == Operator.divide {
            result = "\((Double(firstValue)! / Double(resultLabel.text!)!))"
        } else if currentOperation == Operator.add {
            result = "\((Double(firstValue)! + Double(resultLabel.text!)!))"
        } else if currentOperation == Operator.subtract {
            result = "\((Double(firstValue)! - Double(resultLabel.text!)!))"
        }
        
        resultLabel.text = result
        calcState = CalculationState.newNumStarted
        
    }
}

