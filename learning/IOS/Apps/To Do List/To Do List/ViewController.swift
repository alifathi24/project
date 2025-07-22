//
//  ViewController.swift
//  To Do List
//
//  Created by Fathi Ali on 2025-07-15.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tfInput: UITextField!
    @IBOutlet weak var tvTodos: UITableView!
    var todos = [Todo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func doBtnSave(_ sender: Any) {
        let todo = Todo(name: tfInput.text ?? "No text")
        todos.append(todo, at: 0)
        tvTodos.reloadData()
        
        
    }


}

