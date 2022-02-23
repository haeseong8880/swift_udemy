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
    var tip = 0.10
    var totalSplit = ""
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tipChange(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        tip = buttonTitleAsANumber / 100

        billTextField.endEditing(true)
        
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let textNumber = Double(billTextField.text ?? "0.0") ?? 0.0
        let tipPct = tip
        let split = Double(splitNumberLabel.text ?? "0.0") ?? 0.0
        totalSplit = String(format: "%.2f", (textNumber + (textNumber * tipPct)) / split)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
                    let destinationVC = segue.destination as! ResultsViewController
                    destinationVC.total = totalSplit
            destinationVC.settings = "Split between \(splitNumberLabel.text ?? ""), with \(tip * 100)%"
                }
    }
    
}

