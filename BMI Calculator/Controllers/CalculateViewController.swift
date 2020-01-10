//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var personHeight: UISlider!
    @IBOutlet weak var personWeight: UISlider!
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let value = String(format: "%.2f", sender.value)
        heightLabel.text = "\(value)m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let value = String(format: "%.0f", sender.value)
        weightLabel.text = "\(value)Kg"
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = personHeight.value
        let weight = personWeight.value
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
    
}

