//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    
    @IBOutlet weak var tenPctButton: UIButton!
    
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var buttonList: Array<UIButton>?

    var tip : Float = 0.1
    var splitNumber: Int = 2
    var calculatedAmount: Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonList = [zeroPctButton, tenPctButton, twentyPctButton]
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        tip = Float((sender.titleLabel?.text?.components(separatedBy: "%").first!)!)! / 100
        buttonList?.forEach { button in
            button.isSelected = sender == button ? true : false
        }
    }
    
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        splitNumber = Int(sender.value)
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        billTextField.endEditing(true)
        let billText = billTextField.text ?? ""
        let bill = Float(billText) ?? 0.0
        
        calculatedAmount = (bill * (1 + tip)) / Float(splitNumber)
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destination = segue.destination as! ResultViewController
        
        if(segue.identifier == "goToResult") {
            destination.calculatedAmount = calculatedAmount ?? 0.0
            destination.splitNumber = splitNumber
            destination.tip = tip * 100
        }
    }
    
}

