//
//  ViewController.swift
//  Table View
//
//  Created by Fathi Ali on 2025-07-15.
//

import UIKit

class ViewController: UIViewController {

    var numbers = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for _ in 0..<30 {
            numbers.append(Int(arc4random()))
        }
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellThing", for: indexPath)
        var config = cell.defaultContentConfiguration()
        config.text = "\(numbers[indexPath.row])"
        config.secondaryText = Date().formatted()
        cell.contentConfiguration = config
        
        return cell
    }
    
    
}

