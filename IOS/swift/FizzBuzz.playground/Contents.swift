import UIKit

//var number = 10
//
//if number % 3 == 0 {
//    print("Fizz")
//}
//
//else if number % 5 == 0 {
//    print("Buzz")
//}
//
//else if number % 3 != 0 && number % 5 != 0 {
//    print("FizzBuzz")
//    
//}
//else {
//    print(number)
//}
func runFizzBuzz() {
    for i in 1...100 {
        var output = ""
        if i % 3 == 0 {
            output += "Fizz"
        }
        if i % 5 == 0 {
            output += "Buzz"
        }
        print(output.isEmpty ? i : output)
    }
}

print(runFizzBuzz())

