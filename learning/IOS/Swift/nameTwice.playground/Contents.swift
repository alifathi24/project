import UIKit
import Foundation
import PlaygroundSupport

let view = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 200))
view.backgroundColor = .white

PlaygroundPage.current.liveView = view

let textField = UITextField(frame: CGRect(x: 20, y: 40, width: 260, height: 30))
textField.borderStyle = .roundedRect
textField.placeholder = "Enter some text"
view.addSubview(textField)

let label = UILabel(frame: CGRect(x: 20, y: 80, width: 260, height: 30))
label.text = textField.text
label.textColor = .black
view.addSubview(label)



//var lblOutput: UILabel!
//lblOutput.text = textField.text? "No text"
