//
//  ViewController.swift
//  Another Table View
//
//  Created by Fathi Ali on 2025-08-01.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "normalCell", for: indexPath)
        
        cell.imageView?.image = UIImage(named: "clock")
        cell.accessoryType = .disclosureIndicator
        
        cell.textLabel?.text = "This is row \(indexPath.row)"
        return cell
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

