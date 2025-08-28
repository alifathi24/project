//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Fathi Ali on 2025-08-19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var tftInput: UITextField!
    @IBOutlet weak var scTipPercentage: UISegmentedControl!
    let percentages = [0.1, 0.15, 0.2, 0.25]
    let numFormatter = NumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        numFormatter.numberStyle = .currency
    }
    @IBAction func doBtnCalc(_ sender: Any) {
        calcTip()
    }
    @IBAction func doSCChange(_ sender: Any) {
        calcTip()
    }
    @IBAction func doTCChange(_ sender: Any) {
        calcTip()
    }
    
    func calcTip() {
        let billAmt = Double(tftInput.text ?? "0.0") ?? 0.0
        let selectedIndex = scTipPercentage.selectedSegmentIndex
        let tipPercentage = percentages[selectedIndex]
        let tip = billAmt * tipPercentage
        let total = billAmt + tip
        let totalStr  = numFormatter.string(for: total) ?? ""
        lblTotal.text = "Total:\(totalStr)"
        
    }
    

}

