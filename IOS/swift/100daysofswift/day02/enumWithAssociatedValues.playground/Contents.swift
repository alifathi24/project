import UIKit

//enum Activity {
//    case bored
//    case running
//    case talking
//    case singing
//
//}

enum Activity{
    case bored
    case running(distination: String)
    case talking(topic: String)
    case singing(volume: Int)
}
// enum with raw value

enum Planet: Int {
    case mercury
    case venus
    case earth
    case mars
    
}
let earth = Planet(rawValue: 2)
