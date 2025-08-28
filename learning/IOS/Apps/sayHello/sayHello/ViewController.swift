//
//  ViewController.swift
//  sayHello
//
//  Created by Fathi Ali on 2025-08-18.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblOutput: UILabel!
    
    @IBOutlet weak var tftInput: UITextField!
    
    let lbl = UILabel(frame: CGRect(x: 100, y: 200, width: 80, height: 40))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lbl.text = "in code"
        view.addSubview(lbl)
    }

    @IBAction func sayHello(_ sender: Any) {
        lblOutput.text = tftInput.text
        lbl.text = tftInput.text
    }
    
}

