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
        result.text=calculate1.simpleCalculate(loanAmount: Double(loanAmountField.text!)!, loanTerm: Int(loanTermField.text!)!, interestRate: Double(interestRateField.text!)!)
        
        
    }
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

class calculate{
    
    func simpleCalculate(loanAmount:Double,loanTerm:Int,interestRate:Double )-> String{
        let Rate = interestRate/100
        let rateMoney = Rate * Double(loanTerm) * loanAmount
        
        return String( rateMoney+loanAmount)
        
    }
    
}

