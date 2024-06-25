//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip: Double = 0.10
    var numberOfPeople: Int = 2
    var billTotal = 0.0
    var result: Double = 0.00
    var resultTo2DecimalPlaces: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        billTextField.delegate = self
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        billTextField.resignFirstResponder()
        
        switch sender.tag {
        case 1:
            zeroPctButton.isSelected = true
            return tip = 0.00
        case 2:
            tenPctButton.isSelected = true
            return tip = 0.10
        case 3:
            twentyPctButton.isSelected = true
            return tip = 0.20
        default:
            break
        }
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text!
        
        if bill != "" {
            billTotal = Double(bill)!
//            let result = billTotal * (1 + tip) / Double(numberOfPeople)
//            let resultTo2DecimalPlaces = String(format: "%.2f", result)
        }
        result = billTotal * (1 + tip) / Double(numberOfPeople)
        resultTo2DecimalPlaces = String(format: "%.2f", result)
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goYoResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.total = resultTo2DecimalPlaces
            destinationVC.settings = "settings"
        }
    }
}
