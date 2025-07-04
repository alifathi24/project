import UIKit

UIButton().addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

var secondsInAYear: Int = 60 * 60 * 24 * 365
var minutesInAYear: Int = secondsInAYear / 60
var hoursInAYear: Int = minutesInAYear / 60
print("Thera are \(hoursInAYear) hours in a year.")
print("There are \(minutesInAYear) minutes in a year.")
print("There are \(secondsInAYear) seconds in a year.")

func buttonTapped(_ sender: Any) {
    print("button tapped")
}
