//
//  ViewController.swift
//  ColorSwitcher
//
//  Created by Fathi Ali on 2025-11-25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbl1: UILabel!
    
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeBackground(_ sender: Any) {
        view.backgroundColor = .darkGray
        
        lbl1.textColor = .white
        lbl1.backgroundColor = .green
        lbl1.text = "Label 1"
        
        lbl2.textColor = .white
        lbl2.backgroundColor = .blue
        lbl2.text = "Label 2"
        
        lbl3.textColor = .white
        lbl3.backgroundColor = .red
        lbl3.text = "Label 3"
        
        
        
        
        
        
    }
    
}

