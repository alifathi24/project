//
//  ViewController.swift
//  Add Button
//
//  Created by Fathi Ali on 2025-07-17.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var showBMI: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateBMI(_ sender: Any) {
        let bmi = Double(weight.text!)! / pow(Double(height.text!)!, 2)
        showBMI.text = String(format: "%.2f", bmi)
    }
    
}

