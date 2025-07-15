//
//  ViewController.swift
//  btn
//
//  Created by Fathi Ali on 2025-07-14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func go(_ sender: Any) {
        label.text = textField.text
    }
    
    
}

