import UIKit
import PlaygroundSupport

// MARK: - Modal Input View Controller
// This protocol will be used to send data back from the modal.
protocol ModalInputViewControllerDelegate: AnyObject {
    func didSaveNewItem(item: String)
}

class ModalInputViewController: UIViewController {
    
    // Delegate property is weak to prevent a retain cycle
    weak var delegate: ModalInputViewControllerDelegate?
    
    private let inputTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter new item..."
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        // Add text field to the view
        view.addSubview(inputTextField)
        
        // Set up constraints for the text field
        NSLayoutConstraint.activate([
            inputTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            inputTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            inputTextField.widthAnchor.constraint(equalToConstant: 250)
        ])
        
        // Add navigation bar buttons
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(didTapCancelButton))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(didTapSaveButton))
    }
    
    @objc private func didTapCancelButton() {
        // Dismiss the modal without saving
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func didTapSaveButton() {
        // Check for text and call the delegate method
        if let newItem = inputTextField.text, !newItem.isEmpty {
            delegate?.didSaveNewItem(item: newItem)
        }
    }
}

// MARK: - Table View Controller
class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModalInputViewControllerDelegate {
    
    private var items: [String] = ["Apples", "Bananas", "Oranges"]
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "My Items"
        
        // Add the table view to the view
        view.addSubview(tableView)
        
        // Set up constraints for the table view
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // Set the data source and delegate
        tableView.dataSource = self
        tableView.delegate = self
        
        // Add the "Add" button to the navigation bar
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAddButton))
    }
    
    // MARK: - IBActions
    
    @objc private func didTapAddButton() {
        let modalVC = ModalInputViewController()
        modalVC.delegate = self
        let navController = UINavigationController(rootViewController: modalVC)
        present(navController, animated: true, completion: nil)
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    // MARK: - ModalInputViewControllerDelegate
    
    // MARK: - ModalInputViewControllerDelegate
    
    nonisolated func didSaveNewItem(item: String) {
        // We explicitly switch to the main actor to update the UI
        Task { @MainActor in
            // Add the new item to the data source
            self.items.append(item)
            
            // Reload the table view to display the new item
            self.tableView.reloadData()
            
            // Dismiss the modal view controller
            self.dismiss(animated: true, completion: nil)
        }
    }
}

// MARK: - Playground Setup
// Create an instance of your TableViewController
let tableVC = TableViewController()

// Embed the table view controller in a navigation controller to get the navigation bar
let navController = UINavigationController(rootViewController: tableVC)

// Set the live view for the playground
PlaygroundPage.current.liveView = navController
