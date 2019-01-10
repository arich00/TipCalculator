//
//  ViewController.swift
//  TipCalculator
//
//  Created by Alex Rich on 1/9/19.
//  Copyright © 2019 Alex Rich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipController: UISegmentedControl!
    @IBOutlet weak var tipPercentSlider: UISlider!
    @IBOutlet weak var tipPercentLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    

    @IBAction func updatedBillField(_ sender: Any) {
        calculateTip()
    }
    
    @IBAction func updatedButton(_ sender: Any) {
        let options = [18, 20, 25]
        tipPercentSlider.value = Float(options[tipController.selectedSegmentIndex])
        calculateTip()
    }
    
    @IBAction func updatedSlider(_ sender: Any) {
        if Int(tipPercentSlider.value) == 18 {
            tipController.selectedSegmentIndex = 0
        } else if Int(tipPercentSlider.value) == 20 {
            tipController.selectedSegmentIndex = 1
        } else if Int(tipPercentSlider.value) == 25 {
            tipController.selectedSegmentIndex = 2
        }
        calculateTip()
    }
    
    func calculateTip() {
        let tipPercent = Int(tipPercentSlider.value)
        tipPercentLabel.text = String(format: "tip: %d%%", tipPercent)
        let billValue = Double(billField.text!) ?? 0
        let tip = billValue * Double(tipPercent) / 100
        let total = billValue + tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

