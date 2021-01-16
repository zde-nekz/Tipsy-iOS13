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
    
    var result: Float?
    var tip: String = "10%"

    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = sender == zeroPctButton
        tenPctButton.isSelected = sender == tenPctButton
        twentyPctButton.isSelected = sender == twentyPctButton
        
        tip = sender.currentTitle!
        
        billTextField.endEditing(true)
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        calculate()
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    func calculate() {
        var multiplier: Float = 1.0
        if (tenPctButton.isSelected) {
            multiplier = 1.1
        } else if (twentyPctButton.isSelected) {
            multiplier = 1.2
        }
        
        let bill = Float(billTextField.text ?? "0") ?? 0.0
        result = bill * multiplier / Float(splitNumberLabel.text!)!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "goToResult") {
            let resultVC = segue.destination as! ResultsViewController
            resultVC.result = result
            resultVC.people = Int(splitNumberLabel.text!)!
            resultVC.tip = tip
        }
        
    }
}


