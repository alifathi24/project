//
//  ViewController.swift
//  SayHelloWithInput
//
//  Created by Fathi Ali on 2025-11-23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func clickMe(_ sender: Any) {
        textField.text! = "Hello, \(textField.text!)!"
        myLabel.text = textField.text!
        
    }
    
}

