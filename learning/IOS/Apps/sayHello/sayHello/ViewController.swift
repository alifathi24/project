//
//  ViewController.swift
//  sayHello
//
//  Created by Fathi Ali on 2025-07-30.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sayHello(_ sender: Any) {
        label.text = "Hello, Welcome to my App!"
    }
    
}

