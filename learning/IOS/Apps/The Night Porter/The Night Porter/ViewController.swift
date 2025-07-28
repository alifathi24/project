import UIKit // Assuming this is for iOS development

class MyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // This code runs once, after the view and its initial subviews are loaded.
        // It will make all *existing* subviews green when the view loads.
        
    }
    
    @IBAction func darkMode(_ sender: UIButton) {
        view.backgroundColor = .darkGray
    }
}

