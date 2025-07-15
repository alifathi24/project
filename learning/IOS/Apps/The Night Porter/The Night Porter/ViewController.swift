//
//  ViewController.swift
//  The Night Porter
//
//  Created by Fathi Ali on 2025-07-08.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func darkMode(_ sender: Any) {
        view.backgroundColor = .darkGray    }
    let everything = view.subviews
    for eachView in everything {
        if eachView is UILabel {
            
        }
    }
}

