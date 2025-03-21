//
//  ViewController.swift
//  SayHello
//
//  Created by Fathi Ali on 2025-03-13.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var sayHelloLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      sayHelloLabel.text = "Please enter your name"
    }

    
    @IBAction func sayHello(_ sender: UIButton) {
//        if let name = na
    }
}

