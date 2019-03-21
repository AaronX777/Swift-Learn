//
//  ViewController.swift
//  Calculator
//
//  Created by rd on 2019/3/17.
//  Copyright © 2019 aaron. All rights reserved.
//

import UIKit
//需要判斷按下哪個運算符號
enum Sign {
    case none
    case plus           // +
    case minus          // -
    case multi          // *
    case division       // /
    case percent        // %
    case plusOrMinus    // ±
}

enum Operation: String, CaseIterable {
    case plus = "+"
    case minis = "-"
    case multiple = "*"
    case division = "/"
}

class ViewController: UIViewController {
    
    let formatter = NumberFormatter()

    
    //按下運算符號後,firstNumber要消失,讓second Number繼續輸入,所以在這邊宣告兩個變數
    var firstNumber: Double = 0
    var secondNumber: Double = 0
    var finaNumber: Double = 0
    var currentSign = Sign.none
    var tempSecondNumber = Double()
    var tempEqual = String()
    
    var allSign = Operation.allCases.map{ $0.rawValue }
    
    @IBOutlet var resultBar: UILabel!
   
    @IBAction func number1(_ sender: AnyObject) {
//        if resultBar.text! == "+" || resultBar.text! == "-" || resultBar.text! == "*" || resultBar.text! == "/" {
//            resultBar.text! = "0"
//        }
        if let operation = resultBar.text, allSign.contains(operation) {
            resultBar.text = "0"
        }
        resultBar.text! += "1"
        resultBar.text! = checkNumber(labelText: resultBar.text!)
    }
    @IBAction func number2(_ sender: AnyObject) {
        if let operation = resultBar.text, allSign.contains(operation) {
            resultBar.text! = "0"
        }
        resultBar.text! += "2"
        resultBar.text! = checkNumber(labelText: resultBar.text!)
    }
    @IBAction func number3(_ sender: AnyObject) {
        if let operation = resultBar.text, allSign.contains(operation) {

            resultBar.text! = "0"
        }
        resultBar.text! += "3"
        resultBar.text! = checkNumber(labelText: resultBar.text!)
    }
    @IBAction func number4(_ sender: AnyObject) {
        if let operation = resultBar.text, allSign.contains(operation) {
            resultBar.text! = "0"
        }
        resultBar.text! += "4"
        resultBar.text! = checkNumber(labelText: resultBar.text!)
    }
    @IBAction func number5(_ sender: AnyObject) {
        if let operation = resultBar.text, allSign.contains(operation) {
            resultBar.text! = "0"
        }
        resultBar.text! += "5"
        resultBar.text! = checkNumber(labelText: resultBar.text!)
    }
    @IBAction func number6(_ sender: AnyObject) {
        if let operation = resultBar.text, allSign.contains(operation) {
            resultBar.text! = "0"
        }
        resultBar.text! += "6"
        resultBar.text! = checkNumber(labelText: resultBar.text!)
    }
    @IBAction func number7(_ sender: AnyObject) {
        if let operation = resultBar.text, allSign.contains(operation) {
            resultBar.text! = "0"
        }
        resultBar.text! += "7"
        resultBar.text! = checkNumber(labelText: resultBar.text!)
    }
    @IBAction func number8(_ sender: AnyObject) {
        if let operation = resultBar.text, allSign.contains(operation) {
            resultBar.text! = "0"
        }
        resultBar.text! += "8"
        resultBar.text! = checkNumber(labelText: resultBar.text!)
    }
    @IBAction func number9(_ sender: AnyObject) {
        if let operation = resultBar.text, allSign.contains(operation) {
            resultBar.text! = "0"
        }
        resultBar.text! += "9"
        resultBar.text! = checkNumber(labelText: resultBar.text!)
    }
    @IBAction func number0(_ sender: AnyObject) {
        if let operation = resultBar.text, allSign.contains(operation) {
            resultBar.text! = "0"
        }
        resultBar.text! += "0"
        if !(resultBar.text!.contains(".")) {
            resultBar.text! = checkNumber(labelText: resultBar.text!)
        }
    }
    @IBAction func point(_ sender: AnyObject) {
        //避免point連續按兩次出現Crash
        if !(resultBar.text!.contains(".")) {
        resultBar.text! += "."
        }
    }
    @IBAction func plus(_ sender: AnyObject) {
        //把目前數字給fisterNumber,再把resultBar清除,接著Sign指派給currentSign
        if !(resultBar.text!.contains("+")) {
            resultBar.text! = checkNumber(labelText: resultBar.text!)
            firstNumber = Double(resultBar.text!)!
            resultBar.text! = "+"
//            return X1 = firstNumber
        }
        currentSign = Sign.plus

    }
    @IBAction func minus(_ sender: AnyObject) {
        if !(resultBar.text!.contains("-")) {
        resultBar.text! = checkNumber(labelText: resultBar.text!)
        firstNumber = Double(resultBar.text!)!
        resultBar.text! = "-"
        }
        currentSign = Sign.minus
    }
    @IBAction func multi(_ sender: AnyObject) {
        if !(resultBar.text!.contains("*")) {
        resultBar.text! = checkNumber(labelText: resultBar.text!)
        firstNumber = Double(resultBar.text!)!
        resultBar.text! = "*"
        }
        currentSign = Sign.multi
    }
    @IBAction func division(_ sender: AnyObject) {
        if !(resultBar.text!.contains("/")) {
        resultBar.text! = checkNumber(labelText: resultBar.text!)
        firstNumber = Double(resultBar.text!)!
        resultBar.text! = "/"
        }
        currentSign = Sign.division
    }
    @IBAction func AC(_ sender: AnyObject) {
        firstNumber = 0
        secondNumber = 0
        resultBar.text! = "0"
        currentSign = Sign.none
        tempSecondNumber = 0
        tempEqual = "0"
    }
    @IBAction func percent(_ sender: AnyObject) {
        if resultBar.text == "0" {
            print("0")
        }else{
            secondNumber = Double(resultBar.text!)!
            finaNumber = (firstNumber + secondNumber) / 100
            resultBar.text! = checkNumber(labelText:String(finaNumber))
            currentSign = Sign.none
            print("finaNumber:", finaNumber)
        }
    }
    @IBAction func plusOrMinus(_ sender: AnyObject) {
        if resultBar.text == "0" {
            print("0")
        }else{
            secondNumber = Double(resultBar.text!)!
            finaNumber = (firstNumber + secondNumber) * -1
            resultBar.text! = checkNumber(labelText:String(finaNumber))
            currentSign = Sign.none
            print("finaNumber:", finaNumber)
        }
    }
    @IBAction func backButtonClick(_ sender: Any) {
        resultBar.text = String((resultBar.text?.dropLast())!)
        //避免刪除最後一個數字時resultBar沒數字
        if resultBar.text == "" {
                resultBar.text! += "0"
        }
    }

    @IBAction func equal(_ sender: AnyObject) {
        switch currentSign {
        case .plus:
            //先將後面輸入的數字給secondNumber,兩數計算後,給resultBar顯示結果
            //同時也把currentSign指派給Sign.none
            if let operation = resultBar.text, allSign.contains(operation) {
                resultBar.text! = "0"
            }
            if tempEqual == "+" {
                firstNumber = Double(resultBar.text!)!
                finaNumber = firstNumber + tempSecondNumber
                resultBar.text! = checkNumber(labelText:String(finaNumber))
            }else{
            secondNumber = Double(resultBar.text!)!
            finaNumber = firstNumber + secondNumber
            resultBar.text! = checkNumber(labelText:String(finaNumber))
            currentSign = Sign.plus
            tempEqual = "+"
            tempSecondNumber = secondNumber
            }
        case .minus:
            if let operation = resultBar.text, allSign.contains(operation) {
                resultBar.text! = "0"
            }
            if tempEqual == "-" {
                firstNumber = Double(resultBar.text!)!
                finaNumber = firstNumber - tempSecondNumber
                resultBar.text! = checkNumber(labelText:String(finaNumber))
            }else{
                secondNumber = Double(resultBar.text!)!
                finaNumber = firstNumber - secondNumber
                resultBar.text! = checkNumber(labelText:String(finaNumber))
                currentSign = Sign.minus
                tempEqual = "-"
                tempSecondNumber = secondNumber
            }
        case .multi:
            if let operation = resultBar.text, allSign.contains(operation) {
                resultBar.text! = "0"
            }
            if tempEqual == "*" {
                firstNumber = Double(resultBar.text!)!
                finaNumber = firstNumber * tempSecondNumber
                resultBar.text! = checkNumber(labelText:String(finaNumber))
            }else{
                secondNumber = Double(resultBar.text!)!
                finaNumber = firstNumber * secondNumber
                resultBar.text! = checkNumber(labelText:String(finaNumber))
                currentSign = Sign.multi
                tempEqual = "*"
                tempSecondNumber = secondNumber
            }
        case .division:
            if let operation = resultBar.text, allSign.contains(operation) {
                resultBar.text! = "0"
            }
            if tempEqual == "/" {
                firstNumber = Double(resultBar.text!)!
                finaNumber = firstNumber / tempSecondNumber
                resultBar.text! = checkNumber(labelText:String(finaNumber))
            }else{
                secondNumber = Double(resultBar.text!)!
                finaNumber = firstNumber / secondNumber
                resultBar.text! = checkNumber(labelText:String(finaNumber))
                currentSign = Sign.division
                tempEqual = "/"
                tempSecondNumber = secondNumber
            }
        case .percent:
            break
        case .plusOrMinus:
            break
        case .none:
            break
        }
    }
    func checkNumber(labelText: String) -> String {
        var stringOfNumber :NSNumber
        stringOfNumber = formatter.number(from: labelText)!
        return String(describing: stringOfNumber)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //let resultBar initial= 0
        //resultBar!.text = "0"
        formatter.numberStyle = .decimal
    }
    
}
