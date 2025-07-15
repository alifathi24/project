//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Fathi Ali on 2025-07-14.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblOuput: UILabel!
    
    let tipPercentages: [Double] = [0.10, 0.15, 0.20, 0.25]

    @IBOutlet weak var tipPercent: UISegmentedControl!
    @IBOutlet weak var txtInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateButton(_ sender: Any) {
        print(tipPercent.selectedSegmentIndex)
    }
    
    func calcTip() {
        let billAmount = Double(txtInput.text ?? "0") ?? 0
        let tipPercentage = 
    }
}

