//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by 陈天宇 on 2024/6/25.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    var tip: Double?
    var numberOfPeople: Int?
    var billTotal: Double?
    var result: Double?
    
    func getTotalPerPersonBill() -> String {
        let resultTo2DecimalPlaces = String(format: "%.2f", result ?? 0.0)
        return resultTo2DecimalPlaces
    }
    
    func getSettings() -> String {
        let settingSplit = numberOfPeople
        let settingTip = tip
        return "Split between \(settingSplit ?? 0) people, with \(settingTip ?? 0.00)% tip."
    }
    
    mutating func calculateTotalPerPerson(totalBill: Double, tip: Double, numberOfPeople: Int) {
        result = totalBill * (1 + tip) / Double(numberOfPeople)
    }
}
