import UIKit
import SwiftUI
import PlaygroundSupport

var greeting = "Hello, playground"

[1, 2, 3, 4, 5]
    .publisher
    .map{String($0)}
    .sink{
        print("output \($0)")
    }


struct ContentView: View {
    var body: some View {
        Text("Hello SwiftUI")
    }
} 

PlaygroundPage.current.setLiveView(ContentView())
