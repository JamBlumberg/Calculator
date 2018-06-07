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
        
        firstNum = Double(numField.text!)
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
        switch mode
        {
        case .addition:
            secondNum = Double(numField.text!)!
            result = firstNum + secondNum
            numField.text = "\(result)"
        case .subtraction:
            secondNum = Double(numField.text!)!
            result = firstNum - secondNum
            numField.text = "\(result)"
        case .multiplication:
            secondNum = Double(numField.text!)!
            result = firstNum * secondNum
            numField.text = "\(result)"
        case .division:
            secondNum = Double(numField.text!)!
            result = firstNum / secondNum
            numField.text = "\(result)"
        case .percentage:
            secondNum = Double(numField.text!)!
            result = (firstNum/secondNum) * 100
            numField.text = "\(result)"
        case .notSet:
            return
        }
    }
    
    
    @IBAction func numButtonPress(_ sender: UIButton) {
        let stringValue:String? = sender.titleLabel?.text
        
        if freshUI {
            numField.text = ""
            numField.text = stringValue
        }
        
        else
        {
            if operandPressed {
                numField.text = ""
                numField.text = stringValue
            }
                
            else
            {
                let oldText:String = numField.text!
                numField.text = "\(oldText)" + "\(stringValue!)"
            }
        }
        freshUI = false
        operandPressed = false
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

