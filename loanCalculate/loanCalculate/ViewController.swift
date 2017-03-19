//
//  ViewController.swift
//  loanCalculate
//
//  Created by 唐枫 on 17/3/13.
//  Copyright © 2017年 七月kirino（唐枫）. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var interestRateField: UITextField!
    @IBOutlet weak var loanTermField: UITextField!
    @IBOutlet weak var loanAmountField: UITextField!
    @IBOutlet weak var result: UILabel!
    @IBAction func simpleCalculateButton(_ sender: Any) {
        let calculate1=calculate()
        //空值
        guard let loanAmountField=loanAmountField.text,let loanTermField=loanTermField.text,let interestRateField=interestRateField.text
            else {
                print("用户输入数据有空值")
                return
        }
        //格式
        guard let loanAmount = Double( loanAmountField),let loanTerm = Int(loanTermField),let interestRate=Double(interestRateField)
            else{
                print("用户输入数据格式有误")
                return
                
        }
        result.text=calculate1.simpleCalculate(loanAmount: loanAmount, loanTerm: loanTerm, interestRate: interestRate).money
        
        
       // result.text=calculate1.simpleCalculate(loanAmount: Double(loanAmountField.text!)!, loanTerm: Int(loanTermField.text!)!, interestRate: Double(interestRateField.text!)!).money
        
        
        
    }
    
    
    
    @IBAction func compoundCalculateButton(_ sender: Any) {
        let calculate2=compoundcalculate()
        //空值
        guard let loanAmountField=loanAmountField.text,let loanTermField=loanTermField.text,let interestRateField=interestRateField.text
            else {
                print("用户输入数据有空值")
                return
        }
        //格式
        guard let loanAmount = Double( loanAmountField),let loanTerm = Int(loanTermField),let interestRate=Double(interestRateField)
            else{
                print("用户输入数据格式有误")
                return
                
        }
        result.text=calculate2.compoundCalculate(loanAmount: loanAmount, loanTerm: loanTerm, interestRate: interestRate).money
        

        //result.text=calculate2.compoundCalculate(loanAmount: Double(loanAmountField.text!)!, loanTerm: Int(loanTermField.text!)!, interestRate: Double(interestRateField.text!)!).money
    
    }
    //shift+commannd+0  调出官方参考文档
    //重写函数 使输入完之后键盘不会遮挡住按钮
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        loanAmountField.resignFirstResponder()
        loanTermField.resignFirstResponder()
        interestRateField.resignFirstResponder()
    }
    //有空值时才执行else else必须有return
    func demo(name:String?,age:Int?)
    {
        guard let name=name,let age=age else {
            print("name or age is nil")
            return
        }
        print(name+String(age))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        demo(name: "tom", age: 18)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

class calculate{
    
    func simpleCalculate(loanAmount:Double,loanTerm:Int,interestRate:Double )-> Double{
        let Rate = interestRate/100
        let rateMoney = Rate * Double(loanTerm) * loanAmount
        
        return  rateMoney+loanAmount
        
    }
    
}

class compoundcalculate{
    
    func compoundCalculate(loanAmount:Double,loanTerm:Int,interestRate:Double) -> Double {
     let Rate=interestRate/100
     let compoundRate=pow(1.0+Rate, Double(loanTerm))
        
     return loanAmount * compoundRate
    }
}

extension Double{
    var money:String{
        //结果变成货币类型
        let formatter=NumberFormatter()
        formatter.numberStyle = .currency
        
        //结果可以为空 ？表示可选类型
        let result:String?
        result = formatter.string(from: NSNumber(value:self))
        if result == nil{

            return "format error"
            }
        return result!
    }
}
