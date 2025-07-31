//
//  ViewController.swift
//  Night Porter
//
//  Created by Fathi Ali on 2025-07-30.
//

import UIKit

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func darkMode(_ sender: Any) {
        view.backgroundColor = .darkGray
        
        for eachView in view.subviews {
            if let currentLabel = eachView as? UILabel { // Safely cast to UILabel
                currentLabel.textColor = .green
            }
        }
    }
    
}

