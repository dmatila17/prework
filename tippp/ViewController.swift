//
//  ViewController.swift
//  tippp
//
//  Created by Dylan Matila on 12/30/20.
//

import UIKit

var tipPercentages = [0.15, 0.18, 0.2]
class ViewController: UIViewController {
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var valueSlider: UISlider!
    @IBOutlet weak var numOfTippers: UITextField!
    @IBOutlet weak var totalPerPersonLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func splitTotal(_ sender: Any) {
        let numOfPeople = Int(numOfTippers.text!) ?? 1
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        
        let total = tip + bill
        let totalEach = total / Double(numOfPeople)
        
        totalPerPersonLabel.text = String(format: "$%.2f", totalEach)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        //get the bill amount
        let bill = Double(billField.text!) ?? 0 // if text entered is not valid then this makes it 0
        
        //calculate tip and total
        //var tipPercentages = [0.15, 0.18, 0.2]
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        //change the slider label to match Tip Control
        var position = tipControl.selectedSegmentIndex
        
        if(position == 0) {
            valueSlider.value = 15
        } else if(position == 1){
            valueSlider.value = 18
        }else if(position == 2){
            valueSlider.value = 20
        }
        
        //update the tip and total labels
        sliderLabel.text = String(Int(valueSlider.value))
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
 
//    @IBAction func sliderValueChanged(_ sender: UISlider) {
//        let currentValue = Int(sender.value)
//        print(currentValue)
//    }
    
    @IBAction func sliderTip(_ sender: UISlider) {
        let bill = Double(billField.text!) ?? 0
        
        let currentValue = sender.value
        let percent = Double(currentValue) / 100
        
        let tip = bill * percent
        let total = tip + bill
        
        let numOfPeople = Int(numOfTippers.text!) ?? 1
        let totalEach = total / Double(numOfPeople)
        
        sliderLabel.text = String(Int(percent * 100))
        totalPerPersonLabel.text = String(format: "$%.2f", totalEach)
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        
    }
    
    
    
}

