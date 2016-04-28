//
//  ViewController.swift
//  simplecalc
//
//  Created by iGuest on 4/21/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var firstNumber = 0;
    
    var secondNumber = 0;
    
    var currNumberString = "";
    
    var operation = "";
    
    var textToDisplay = "";
    
    var finishedOp = false
    
    var calc = Calc.Instance
    

    @IBOutlet weak var textDisplay: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        textDisplay.userInteractionEnabled = false;
        textDisplay.textAlignment = NSTextAlignment.Right
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ClickNumber(sender: UIButton) {
        if finishedOp == true {
            clearAll()
            finishedOp = false
        }
        currNumberString += sender.currentTitle!
        textToDisplay += sender.currentTitle!
        displayToUI()
    }
    
    @IBAction func ClickOperator(sender: UIButton) {
        operation = sender.currentTitle!
        setFirstNumber()
        
        textToDisplay += operation
        NSLog("text to display'\(textToDisplay)'")
        displayToUI()
        
        currNumberString = ""
    }
    
    @IBAction func doOperation() {
        
        finishedOp = true
        
        switch operation {
        case "+" :
            setSecondNumber()
            textToDisplay += " = \(calc.Add(firstNumber, right: secondNumber))"
            displayToUI()
        case "-" :
            setSecondNumber()
            textToDisplay += " = \(calc.Subtract(firstNumber, right: secondNumber))"
            displayToUI()
        case "*" :
            setSecondNumber()
            textToDisplay += " = \(calc.Multiply(firstNumber, right: secondNumber))"
            displayToUI()
        case "/" :
            setSecondNumber()
            textToDisplay += " = \(calc.Divide(firstNumber, right: secondNumber))"
            displayToUI()
        case "%" :
            setSecondNumber()
            textToDisplay += " = \(calc.Mod(firstNumber, right: secondNumber))"
            displayToUI()
        case "COUNT" :
            textToDisplay += " = \(calc.Count())"
            displayToUI()
        case "AVG" :
            textToDisplay += " = \(calc.Avg())"
            displayToUI()
        case "!" :
            textToDisplay += " = \(calc.Factorial(firstNumber))"
            displayToUI()
        default :
            print("Not a valid operator")
            clearAll()
        }
        if (textToDisplay != "") {
            sendToHistory()
        }
        currNumberString = ""
        operation = ""
        
    }
    
    func sendToHistory() {
        Calc.Instance.History.append(textToDisplay)
    }
    
    func setFirstNumber() {
        firstNumber = calc.IntVersion(currNumberString)
        calc.AddToCountAndAvg(firstNumber)
        NSLog("first number \(firstNumber)")
    }
    
    func setSecondNumber() {
        secondNumber = calc.IntVersion(currNumberString)
        calc.AddToCountAndAvg(secondNumber)
        NSLog("second number \(secondNumber)")
    }
    
    
    
    func displayToUI() {
        textDisplay.text = textToDisplay
    }
    
    @IBAction func clearClick(sender: AnyObject) {
        NSLog("should clear")
        clearAll()
    }
    
    func clearAll() {
        firstNumber = 0;
        
        secondNumber = 0;
        
        currNumberString = "";
        
        operation = "";
        
        textToDisplay = "";
        
        calc.NumCount = 0;
        
        calc.NumSum = 0;
        
        displayToUI()
    }
    
    
}

