//
//  ViewController.swift
//  Night Porter Table View
//
//  Created by Fathi Ali on 2025-07-31.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected row \(indexPath.row) and section \(indexPath.section)")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return dailyTasks.count
        case 1:
            return weeklytasks.count
        case 2:
            return monthlyTasks.count
        default:
            return 0
        }
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
//        let myCell = tableView.dequeueReusableCell(withIdentifier: normalCell, for: indexPath) then add Table View cell to the 
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = dailyTasks[indexPath.row]
        case 1:
            cell.textLabel?.text = weeklytasks[indexPath.row]
        case 2:
            cell.textLabel?.text = monthlyTasks[indexPath.row]
        default:
            cell.textLabel?.text = "This shouldn't happen"
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Daily Tasks"
        case 1:
            return "Weekly Tasks"
        case 2:
            return "Monthly Tasks"
        default:
            return nil
        }
    }
    
    // Create [String] arrays of tasks
    let dailyTasks = ["Check all windows", "Check all doors", "Is the boiler fueled", "Check the mailbox", "Empty trash containers", "If freezing, check water pipes", "Document \"strange and unsual\" occurrences",]
    
    let weeklytasks = ["Check inside all cabins", "Flush all lavatories in cabins", "Walk the perimeter of property",]
    
    let monthlyTasks = ["Test security alarm", "Test motion detectors", "Test smoke alarms",]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

