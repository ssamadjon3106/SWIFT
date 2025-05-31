//
//  ViewController.swift
//  CalculatorTutorial
//
//  Created by CallumHill on 4/12/20.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var calculatorWorkings: UILabel!
    @IBOutlet weak var calculatorResults: UILabel!
    
    @IBOutlet weak var q: UIButton!
    @IBOutlet weak var w: UIButton!
    @IBOutlet weak var e: UIButton!
    @IBOutlet weak var r: UIButton!
    @IBOutlet weak var t: UIButton!
    @IBOutlet weak var y: UIButton!
    @IBOutlet weak var u: UIButton!
    @IBOutlet weak var i: UIButton!
    @IBOutlet weak var o: UIButton!
    @IBOutlet weak var p: UIButton!
    @IBOutlet weak var a: UIButton!
    @IBOutlet weak var s: UIButton!
    @IBOutlet weak var d: UIButton!
    @IBOutlet weak var f: UIButton!
    @IBOutlet weak var g: UIButton!
    @IBOutlet weak var h: UIButton!
    @IBOutlet weak var j: UIButton!
    @IBOutlet weak var k: UIButton!
    
    @IBOutlet weak var button: UIButton!
    var workings:String = ""
    
    override func viewDidLoad()
    {
        button.layer.cornerRadius = button.frame.size.height / 2
        q.layer.cornerRadius = q.frame.size.width / 2.15
        q.layer.cornerRadius = q.frame.size.height / 2.15
        w.layer.cornerRadius = w.frame.size.height / 2.15
        e.layer.cornerRadius = e.frame.size.height / 2.15
        r.layer.cornerRadius = r.frame.size.height / 2.15
        t.layer.cornerRadius = t.frame.size.height / 2.15
        y.layer.cornerRadius = y.frame.size.height / 2.15
        u.layer.cornerRadius = u.frame.size.height / 2.15
        i.layer.cornerRadius = i.frame.size.height / 2.15
        o.layer.cornerRadius = o.frame.size.height / 2.15
        p.layer.cornerRadius = p.frame.size.height / 2.15
        a.layer.cornerRadius = a.frame.size.height / 2.15
        s.layer.cornerRadius = s.frame.size.height / 2.15
        d.layer.cornerRadius = d.frame.size.height / 2.15
        f.layer.cornerRadius = f.frame.size.height / 2.15
        g.layer.cornerRadius = g.frame.size.height / 2.15
        h.layer.cornerRadius = h.frame.size.height / 2.15
        j.layer.cornerRadius = j.frame.size.height / 2.15
        k.layer.cornerRadius = k.frame.size.height / 2.15

        super.viewDidLoad()
        clearAll()
    }
    
    func clearAll()
    {
        workings = ""
        calculatorWorkings.text = ""
        calculatorResults.text = ""
    }

    @IBAction func equalsTap(_ sender: Any)
    {
        if(validInput())
        {
            let checkedWorkingsForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkedWorkingsForPercent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            calculatorResults.text = resultString
        }
        else
        {
            let alert = UIAlertController(
                title: "Invalid Input",
                message: "Calculator unable to do math based on input",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func validInput() ->Bool
    {
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in workings
        {
            if(specialCharacter(char: char))
            {
                funcCharIndexes.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        
        for index in funcCharIndexes
        {
            if(index == 0)
            {
                return false
            }
            
            if(index == workings.count - 1)
            {
                return false
            }
            
            if (previous != -1)
            {
                if(index - previous == 1)
                {
                    return false
                }
            }
            previous = index
        }
        
        return true
    }
    
    func specialCharacter (char: Character) -> Bool
    {
        if(char == "*")
        {
            return true
        }
        if(char == "/")
        {
            return true
        }
        if(char == "+")
        {
            return true
        }
        return false
    }
    
    func formatResult(result: Double) -> String
    {
        if(result.truncatingRemainder(dividingBy: 1) == 0)
        {
            return String(format: "%.0f", result)
        }
        else
        {
            return String(format: "%.2f", result)
        }
    }
    
    func handleOperator(_ op: String) {
        if let lastChar = workings.last, "+-*/".contains(lastChar) {
            workings.removeLast()
        }
        workings += op
        calculatorWorkings.text = workings
    }

    
    @IBAction func allClearTap(_ sender: Any)
    {
        clearAll()
    }
    
    @IBAction func backTap(_ sender: Any)
    {
        if(!workings.isEmpty)
        {
            workings.removeLast()
            calculatorWorkings.text = workings
        }
    }
    
    func addToWorkings(value: String)
    {
        workings = workings + value
        calculatorWorkings.text = workings
    }
    
    @IBAction func percentTap(_ sender: Any)
    {
        handleOperator("%")
    }
    
    @IBAction func divideTap(_ sender: Any)
    {
        handleOperator("/")
    }
    
    @IBAction func timesTap(_ sender: Any)
    {
        handleOperator("*")
    }
    
    @IBAction func minusTap(_ sender: Any)
    {
        handleOperator("-")
    }
    
    @IBAction func plusTap(_ sender: Any)
    {
        handleOperator("+")
    }
    
    @IBAction func decimalTap(_ sender: Any)
    {
        handleOperator(".")
    }
    
    @IBAction func zeroTap(_ sender: Any)
    {
        addToWorkings(value: "0")
    }
    
    @IBAction func oneTap(_ sender: Any)
    {
        addToWorkings(value: "1")
    }
    
    @IBAction func twoTap(_ sender: Any)
    {
        addToWorkings(value: "2")
    }
    
    @IBAction func threeTap(_ sender: Any)
    {
        addToWorkings(value: "3")
    }
    
    @IBAction func fourTap(_ sender: Any)
    {
        addToWorkings(value: "4")
    }
    
    @IBAction func fiveTap(_ sender: Any)
    {
        addToWorkings(value: "5")
    }
    
    @IBAction func sixTap(_ sender: Any)
    {
        addToWorkings(value: "6")
    }
    
    @IBAction func sevenTap(_ sender: Any)
    {
        addToWorkings(value: "7")
    }
    
    @IBAction func eightTap(_ sender: Any)
    {
        addToWorkings(value: "8")
    }
    
    @IBAction func nineTap(_ sender: Any)
    {
        addToWorkings(value: "9")
    }
}

