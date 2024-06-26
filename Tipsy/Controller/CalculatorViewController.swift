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
    
    var calculateBrain = CalculatorBrain()
    
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
            return calculateBrain.tip = 0.00
        case 2:
            tenPctButton.isSelected = true
            return calculateBrain.tip = 0.10
        case 3:
            twentyPctButton.isSelected = true
            return calculateBrain.tip = 0.20
        default:
            break
        }
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        calculateBrain.numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text!
        var billTotal: Double
        
        if bill != "" {
            billTotal = Double(bill)!
            calculateBrain.calculateTotalPerPerson(totalBill: billTotal, tip: calculateBrain.tip ?? 0.00, numberOfPeople: calculateBrain.numberOfPeople ?? 0)
        }
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.total = calculateBrain.getTotalPerPersonBill()
            destinationVC.settings = calculateBrain.getSettings()
        }
    }
}
