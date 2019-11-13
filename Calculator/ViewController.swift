//
//  ViewController.swift
//  PersonalTest
//
//  Created by jamieblumberg on 5/8/18.
//  Copyright © 2018 Jamie Blumberg. All rights reserved.
//

import UIKit

//making an enum. Do it outside of the class
enum modes {
    case notSet
    case addition
    case subtraction
    case multiplication
    case percentage
    case division
}

class ViewController: UIViewController {
    
    var firstNum:Double!
    var secondNum:Double!
    var mode:modes = .notSet
    var operandPressed:Bool = false
    var freshUI:Bool = true
    
    @IBOutlet weak var numField:UILabel!
    @IBOutlet weak var percentBtn: UIButton!
    @IBOutlet weak var divBtn: UIButton!
    @IBOutlet weak var multBtn: UIButton!
    @IBOutlet weak var subBtn: UIButton!
    @IBOutlet weak var addBtn: UIButton!
    
    //Wiring up the buttons
    //Clear button
    @IBAction func clearBtn(_ sender: Any) {
        numField.text = "0"
        freshUI = false
        mode = .notSet
    }
    
    //Changes the number in use from positive to negative and vice versa
    @IBAction func posNegBtn(_ sender: Any) {
        let oldNum:Double? = Double(numField.text!)
        let newNum:Double = oldNum! * -1
        numField.text = "\(newNum)"
    }
    
    @IBAction func operandButton(_ sender: UIButton) {
        firstNum = formatNum(text: numField.text!).doubleValue
        operandPressed = true
        switch sender {
        case percentBtn:
            mode = .percentage
        case divBtn:
            mode = .division
        case multBtn:
            mode = .multiplication
        case subBtn:
            mode = .subtraction
        case addBtn:
            mode = .addition
        default:
            break
        }
        
    }
    
    
    @IBAction func equalBtn(_ sender: Any) {
        var result:Double = 0
        operandPressed = false
        
        
        secondNum = formatNum(text: numField.text!).doubleValue
        switch mode
        {
        case .addition:
            result = firstNum + secondNum
            setNumField(number: result)
        case .subtraction:
            secondNum = Double(numField.text!)!
            result = firstNum - secondNum
            setNumField(number: result)
        case .multiplication:
            result = firstNum * secondNum
            setNumField(number: result)
        case .division:
            result = firstNum / secondNum
            setNumField(number: result)
        case .percentage:
            result = (firstNum/secondNum) * 100
            setNumField(number: result)
        case .notSet:
            return
        }
    }
    
    
    @IBAction func numButtonPress(_ sender: UIButton) {
        let stringValue:String? = sender.titleLabel?.text
        
        
        if freshUI {
            numField.text = ""
            setNumField(number: (formatNum(text: stringValue!)).doubleValue)
        }
        
        else
        {
            if operandPressed {
                numField.text = ""
                setNumField(number: (formatNum(text: stringValue!)).doubleValue)
            }
                
            else
            {
                let oldText:String = (formatNum(text: numField.text!)).stringValue
                let text:String = oldText + stringValue!
                guard let dubValue:Double = Double(text) else {
                    return
                }
                setNumField(number: dubValue)
            }
        }
        freshUI = false
        operandPressed = false
    }
    
    func setNumField (number:Double) {
        let formatter:NumberFormatter = NumberFormatter()
        if (number) <= 99999999999 {
            formatter.numberStyle = .decimal
        }
        else {
            formatter.numberStyle = .scientific
            formatter.positiveFormat = "0.###E+0"
            formatter.exponentSymbol = "e"
        }
        
        let num:NSNumber = NSNumber(value: number)
        numField.text = formatter.string(from: num)
    }
    
    func formatNum (text:String) -> NSNumber {
        let cleanString:String = text.replacingOccurrences(of: ",", with: "")
        let formatter:NumberFormatter = NumberFormatter()
        let dirtyNum:NSNumber = formatter.number(from: cleanString)!
        if (dirtyNum.doubleValue) <= 99999999999 {
            formatter.numberStyle = .decimal
        }
        else {
            formatter.numberStyle = .scientific
            formatter.positiveFormat = "0.###E+0"
            formatter.exponentSymbol = "e"
        }
        let cleanNum:NSNumber = formatter.number(from: cleanString)!
        return cleanNum
    }
    
    //creating a String var
    var name:String = "Jamie Blumberg"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        numField.text = "0"
    }
    
    func addNumbers(num1:Double, num2:Double){
        
        let sum = num1 + num2
        numField.text = "Sum is \(sum)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

