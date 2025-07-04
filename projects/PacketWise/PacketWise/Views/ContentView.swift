//
//  ContentView.swift
//  PacketWise
//
//  Created by Fathi Ali on 2025-06-22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = QuizViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.questions) { question in
                VStack(alignment: .leading) {
                    Text(question.question)
                        .font(.headline)
                    Text("Chapter: \(question.chapter)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            .navigationTitle("PacketWise - CCNA Quiz")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#Preview {
    ContentView()
}
